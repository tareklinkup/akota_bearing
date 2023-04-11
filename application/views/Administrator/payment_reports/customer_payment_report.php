<style>
	.v-select{
		margin-bottom: 5px;
	}
	.v-select .dropdown-toggle{
		padding: 0px;
	}
	.v-select input[type=search], .v-select input[type=search]:focus{
		margin: 0px;
	}
	.v-select .vs__selected-options{
		overflow: hidden;
		flex-wrap:nowrap;
	}
	.v-select .selected-tag{
		margin: 2px 0px;
		white-space: nowrap;
		position:absolute;
		left: 0px;
	}
	.v-select .vs__actions{
		margin-top:-5px;
	}
	.v-select .dropdown-menu{
		width: auto;
		overflow-y:auto;
	}
</style>
<div class="row" id="customerPaymentReport">
	<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;">
		<div class="form-group">
			<label class="col-sm-1">Parent</label>
			<div class="col-sm-2">
				<v-select v-bind:options="parents" v-model="selectedCustomer" label="display_name"></v-select>
			</div>
		</div>

		<div v-if="childrens.length > 0" class="form-group">
			<label class="col-sm-1 control-label no-padding-right"> Customer </label>
			<div class="col-sm-2">
				<v-select v-bind:options="childrens" label="display_name" v-model="selectedChildren"></v-select>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-5">
				<div class="row">
					<label class="col-sm-2 control-label no-padding-right" style="padding: 0;"> Date From </label>
					<div class="col-sm-4" style="padding:0">
						<input type="date" class="form-control" v-model="dateFrom">
					</div>
					<label class="col-sm-2 control-label no-padding-right text-center">Date To </label>
					<div class="col-sm-4" style="padding: 0;">
						<input type="date" class="form-control" v-model="dateTo">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-1">
				<input type="button" class="btn btn-block btn-primary" value="Show" v-on:click="getReport" style="margin-top:0px;border:0px;height:28px;">
			</div>
		</div>
	</div>

	<div class="col-sm-12" style="display:none;" v-bind:style="{display: showTable ? '' : 'none'}">
		<a href="" style="margin: 7px 0;" v-on:click.prevent="print">
			<i class="fa fa-print"></i> Print
		</a> |&nbsp;
		<a href="javascript:" 
			onclick="exportToExcel('customer-payment', 'Customer Payment - <?php echo date('D d F, Y') ?>')"
		> 
			<i class="fa fa-file-excel-o"></i> Customer Payment Excel 
		</a> | &nbsp;
		<a href="javascript:" 
			onclick="exportToWord('Customer Payment - <?php echo date('D d F, Y') ?>')"
		> 
			<i class="fa fa-file-word-o"></i> Customer Payment Word 
		</a>
		
		<div class="table-responsive googoose-wrapper" id="reportTable">
			<table class="table table-bordered" id="customer-payment">
				<thead>
					<tr>
						<th style="text-align:center">Date</th>
						<th style="text-align:center">Description</th>
						<th style="text-align:center">Bill</th>
						<th style="text-align:center">Paid</th>
						<th style="text-align:center">Inv.Due</th>
						<th style="text-align:center">Retruned</th>
						<th style="text-align:center">Paid to customer</th>
						<th style="text-align:center">Balance</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td style="text-align:left;">Previous Balance</td>
						<td colspan="5"></td>
						<td style="text-align:right;">{{ parseFloat(previousBalance).toFixed(2) }}</td>
					</tr>
					<tr v-for="payment in payments">
						<td>{{ payment.date }}</td>
						<td style="text-align:left;">{{ payment.description }}</td>
						<td style="text-align:right;">{{ parseFloat(payment.bill).toFixed(2) }}</td>
						<td style="text-align:right;">{{ parseFloat(payment.paid).toFixed(2) }}</td>
						<td style="text-align:right;">{{ parseFloat(payment.due).toFixed(2) }}</td>
						<td style="text-align:right;">{{ parseFloat(payment.returned).toFixed(2) }}</td>
						<td style="text-align:right;">{{ parseFloat(payment.paid_out).toFixed(2) }}</td>
						<td style="text-align:right;">{{ parseFloat(payment.balance).toFixed(2) }}</td>
					</tr>
					<tr v-if="payments.length > 0">
						<td colspan="2" style="text-align: right;"><strong>Total</strong></td>
						<td style="text-align: right;"><strong>{{ payments.reduce((p, c) => { return +p + +c.bill}, 0).toFixed(2) }}</strong></td>
						<td style="text-align: right;"><strong>{{ payments.reduce((p, c) => { return +p + +c.paid}, 0).toFixed(2) }}</strong></td>
						<td style="text-align: right;"><strong>{{ payments.reduce((p, c) => { return +p + +c.due}, 0).toFixed(2) }}</strong></td>
						<td style="text-align: right;"><strong>{{ payments.reduce((p, c) => { return +p + +c.returned}, 0).toFixed(2) }}</strong></td>
						<td style="text-align: right;"><strong>{{ payments.reduce((p, c) => { return +p + +c.paid_out}, 0).toFixed(2) }}</strong></td>
						<td></td>
					</tr>
				</tbody>
				<tbody v-if="payments.length == 0">
					<tr>
						<td colspan="8">No records found</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script src="<?php echo base_url();?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#customerPaymentReport',
		data(){
			return {
				parents:[],
				customers: [],
				selectedCustomer: null,
				childrens: [],
				selectedChildren: null,
				dateFrom: null,
				dateTo: null,
				payments: [],
				previousBalance: 0.00,
				showTable: false
			}
		},
		watch: {
			selectedCustomer(customer) {
				if(customer == undefined) return;
				this.childrens = this.customers.filter(item => item.parent_id == customer.Customer_SlNo);
				this.selectedChildren = null;
			},
			async selectedChildren(child) {
				if(child == undefined) return;
			}
		},
		created(){
			let today = moment().format('YYYY-MM-DD');
			this.dateTo = today;
			this.dateFrom = moment().format('YYYY-MM-DD');
			this.getCustomers();
		},
		methods:{
			getCustomers(){
				axios.get('/get_customers').then(res => {
					this.customers = res.data;
					this.parents = res.data.filter(item => item.parent_id == null);
				})
			},
			getReport(){
				if(this.selectedCustomer == null){
					alert('Select customer');
					return;
				}
				let data = {
					dateFrom: this.dateFrom,
					dateTo: this.dateTo,
					// customerId: this.selectedCustomer.Customer_SlNo
					customerId: this.selectedChildren == null ? (this.selectedCustomer != null ? this.selectedCustomer.Customer_SlNo : null) : this.selectedChildren.Customer_SlNo,
				}

				axios.post('/get_customer_ledger', data).then(res => {
					this.payments = res.data.payments;
					this.previousBalance = res.data.previousBalance;
					this.showTable = true;
				})
			},
			async print(){
				let reportContent = `
					<div class="container">
						<h4 style="text-align:center">Customer payment report</h4 style="text-align:center">
						<div class="row">
							<div class="col-xs-6" style="font-size:12px;">
								<strong>Customer Code: </strong> ${this.selectedCustomer.Customer_Code}<br>
								<strong>Name: </strong> ${this.selectedCustomer.Customer_Name}<br>
								<strong>Address: </strong> ${this.selectedCustomer.Customer_Address}<br>
								<strong>Mobile: </strong> ${this.selectedCustomer.Customer_Mobile}<br>
							</div>
							<div class="col-xs-6 text-right">
								<strong>Statement from</strong> ${this.dateFrom} <strong>to</strong> ${this.dateTo}
							</div>
						</div>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#reportTable').innerHTML}
							</div>
						</div>
					</div>
				`;

				var mywindow = window.open('', 'PRINT', `width=${screen.width}, height=${screen.height}`);
				mywindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php');?>
				`);

				mywindow.document.body.innerHTML += reportContent;

				mywindow.focus();
				await new Promise(resolve => setTimeout(resolve, 1000));
				mywindow.print();
				mywindow.close();
			}
		}
	})
</script>