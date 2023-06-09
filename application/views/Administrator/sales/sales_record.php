<style>
    .v-select{
		margin-top:-2.5px;
        float: right;
        min-width: 180px;
        margin-left: 5px;
	}
	.v-select .dropdown-toggle{
		padding: 0px;
        height: 25px;
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
	#searchForm select{
		padding:0;
		border-radius: 4px;
	}
	#searchForm .form-group{
		margin-right: 5px;
	}
	#searchForm *{
		font-size: 13px;
	}
	.record-table{
		width: 100%;
		border-collapse: collapse;
	}
	.record-table thead{
		background-color: #0097df;
		color:white;
	}
	.record-table th, .record-table td{
		padding: 3px;
		border: 1px solid #454545;
	}
    .record-table th{
        text-align: center;
    }
</style>
<div id="salesRecord">
	<div class="row" style="border-bottom: 1px solid #ccc;padding: 3px 0;">
		<div class="col-md-12">
			<form class="form-inline" id="searchForm" @submit.prevent="getSearchResult">
				<div class="form-group">
					<label>Search Type</label>
					<select class="form-control" v-model="searchType" @change="onChangeSearchType">
						<option value="">All</option>
						<option value="customer">By Customer</option>
						<option value="employee">By Employee</option>
						<option value="category">By Category</option>
						<option value="quantity">By Quantity</option>
						<option value="user">By User</option>
					</select>
				</div>
				
				<div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'customer' && customers.length > 0 ? '' : 'none'}">
					<label>Parent</label>
					<v-select v-bind:options="parents" v-model="selectedCustomer" label="display_name"></v-select>
				</div>

				<div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'customer' && childrens.length > 0 ? '' : 'none'}">
					<label class="col-sm-4 control-label no-padding-right"> Customer </label>
					<div class="col-sm-8">
						<v-select v-bind:options="childrens" label="display_name" v-model="selectedChildren"></v-select>
					</div>
				</div>

				<div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'employee' && employees.length > 0 ? '' : 'none'}">
					<label>Employee</label>
					<v-select v-bind:options="employees" v-model="selectedEmployee" label="Employee_Name"></v-select>
				</div>

				<div class="form-group" style="display: none;" :style="{display: searchType == 'quantity' ? '' : 'none'}">
					<label for="brand">Brands</label>
					<v-select v-bind:options="brands" v-model="selectedBrand" label="brand_name"></v-select>
				</div>

				<div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'quantity' && products.length > 0 ? '' : 'none'}">
					<label>Product</label>
					<v-select v-bind:options="filterProducts" v-model="selectedProduct" label="display_text"></v-select>
				</div>

				<div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'category' && categories.length > 0 ? '' : 'none'}">
					<label>Category</label>
					<v-select v-bind:options="categories" v-model="selectedCategory" label="ProductCategory_Name"></v-select>
				</div>

				<div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'user' && users.length > 0 ? '' : 'none'}">
					<label>User</label>
					<v-select v-bind:options="users" v-model="selectedUser" label="FullName"></v-select>
				</div>

				<div class="form-group" v-bind:style="{display: searchType == '' || searchType == 'user' || searchType == 'customer' || searchType == 'employee' ? '' : 'none'}">
					<label>Record Type</label>
					<select class="form-control" v-model="recordType" @change="sales = []">
						<option value="without_details">Without Details</option>
						<option value="with_details">With Details</option>
					</select>
				</div>

				<div class="form-group">
					<input type="date" class="form-control" v-model="dateFrom">
				</div>

				<div class="form-group">
					<input type="date" class="form-control" v-model="dateTo">
				</div>

				<div class="form-group" style="margin-top: -5px;">
					<input type="submit" value="Search">
				</div>
			</form>
		</div>
	</div>

	<div class="row" style="margin-top:15px;display:none;" v-bind:style="{display: sales.length > 0 ? '' : 'none'}">
		<div class="col-md-12" style="margin-bottom: 10px;">
			<a href="" @click.prevent="print"><i class="fa fa-print"></i> Print</a>
		</div>
		<div class="col-md-12">
			<div class="table-responsive" id="reportContent">
				<table 
					class="record-table" 
					v-if="(searchType == '' || searchType == 'user' || searchType == 'customer' || searchType == 'employee') && recordType == 'with_details'" 
					style="display:none" 
					v-bind:style="{display: (searchType == '' || searchType == 'user' || searchType == 'customer' || searchType == 'employee') && recordType == 'with_details' ? '' : 'none'}"
					>
					<thead>
						<tr>
							<th>Invoice No.</th>
							<th>Date</th>
							<th>Customer Name</th>
							<th>Employee Name</th>
							<th>Saved By</th>
							<th>Product Name</th>
							<th>Brand</th>
							<th>Origin</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<template v-for="sale in sales">
							<tr>
								<td>{{ sale.SaleMaster_InvoiceNo }}</td>
								<td>{{ sale.SaleMaster_SaleDate }}</td>
								<td>{{ sale.Customer_Name }}</td>
								<td>{{ sale.Employee_Name }}</td>
								<td>{{ sale.AddBy }}</td>
								<td>{{ sale.saleDetails[0].Product_Name }}</td>
								<td>{{ sale.saleDetails[0].brand_name }}</td>
								<td>{{ sale.saleDetails[0].origin }}</td>
								<td style="text-align:right;">{{ sale.saleDetails[0].SaleDetails_Rate }}</td>
								<td style="text-align:center;">{{ sale.saleDetails[0].SaleDetails_TotalQuantity }}</td>
								<td style="text-align:right;">{{ sale.saleDetails[0].SaleDetails_TotalAmount }}</td>
								<td style="text-align:center;">

									<a href="" title="False Sales" v-bind:href="`/false_sales/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-usd"></i></a>
									<a href="" title="False Challan" v-bind:href="`/false_challan/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-file-o"></i></a>

									<a href="" title="Invoice" v-bind:href="`/quotation/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-quote-right"></i></a>
									<a href="" title="Sale Invoice" v-bind:href="`/sale_invoice_print/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-file"></i></a>
									<a href="" title="Chalan" v-bind:href="`/chalan/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-file-o"></i></a>
									<?php if($this->session->userdata('accountType') != 'u'){?>
									<a href="" title="Edit Sale" v-bind:href="`/sales/${sale.is_service == 'true' ? 'service' : 'product'}/${sale.SaleMaster_SlNo}`"><i class="fa fa-edit"></i></a>
									<a href="" title="Delete Sale" @click.prevent="deleteSale(sale.SaleMaster_SlNo)"><i class="fa fa-trash"></i></a>
									<?php }?>
								</td>
							</tr>
							<tr v-for="(product, sl) in sale.saleDetails.slice(1)">
								<td colspan="5" v-bind:rowspan="sale.saleDetails.length - 1" v-if="sl == 0"></td>
								<td>{{ product.Product_Name }}</td>
								<td>{{ product.brand_name }}</td>
								<td>{{ product.origin }}</td>
								<td style="text-align:right;">{{ product.SaleDetails_Rate }}</td>
								<td style="text-align:center;">{{ product.SaleDetails_TotalQuantity }}</td>
								<td style="text-align:right;">{{ product.SaleDetails_TotalAmount }}</td>
								<td></td>
							</tr>
							<tr style="font-weight:bold;">
								<td colspan="9"></td>
								<td style="text-align:center;">Total Quantity<br>{{ sale.saleDetails.reduce((prev, curr) => {return prev + parseFloat(curr.SaleDetails_TotalQuantity)}, 0) }}</td>
								<td style="text-align:right;">
									Total: {{ sale.SaleMaster_TotalSaleAmount }}<br>
									Paid: {{ sale.SaleMaster_PaidAmount }}<br>
									Due: {{ sale.SaleMaster_DueAmount }}
								</td>
								<td></td>
							</tr>
						</template>
					</tbody>
				</table>

				<table 
					class="record-table" 
					v-if="(searchType == '' || searchType == 'user' || searchType == 'customer' || searchType == 'employee') && recordType == 'without_details'" 
					style="display:none" 
					v-bind:style="{display: (searchType == '' || searchType == 'user' || searchType == 'customer' || searchType == 'employee') && recordType == 'without_details' ? '' : 'none'}"
					>
					<thead>
						<tr>
							<th>Invoice No.</th>
							<th>Date</th>
							<th>Customer Name</th>
							<th>Employee Name</th>
							<th>Saved By</th>
							<th>Sub Total</th>
							<th>VAT</th>
							<th>Discount</th>
							<th>Transport Cost</th>
							<th>Total</th>
							<th>Paid</th>
							<th>Due</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="sale in sales">
							<td>{{ sale.SaleMaster_InvoiceNo }}</td>
							<td>{{ sale.SaleMaster_SaleDate }}</td>
							<td>{{ sale.Customer_Name }}</td>
							<td>{{ sale.Employee_Name }}</td>
							<td>{{ sale.AddBy }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_SubTotalAmount }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_TaxAmount }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_TotalDiscountAmount }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_Freight }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_TotalSaleAmount }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_PaidAmount }}</td>
							<td style="text-align:right;">{{ sale.SaleMaster_DueAmount }}</td>
							<td style="text-align:center;">
								<a href="" title="False Sales" v-bind:href="`/false_sales/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-usd"></i></a>
								<a href="" title="False Challan" v-bind:href="`/false_challan/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-file-o"></i></a>

								<a href="" title="Invoice" v-bind:href="`/quotation/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-quote-right"></i></a>
								<a href="" title="Sale Invoice" v-bind:href="`/sale_invoice_print/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-file"></i></a>
								<a href="" title="Chalan" v-bind:href="`/chalan/${sale.SaleMaster_SlNo}`" target="_blank"><i class="fa fa-file-o"></i></a>
								<?php if($this->session->userdata('accountType') != 'u'){?>
								<a href="" title="Edit Sale" v-bind:href="`/sales/${sale.is_service == 'true' ? 'service' : 'product'}/${sale.SaleMaster_SlNo}`"><i class="fa fa-edit"></i></a>
								<a href="" title="Delete Sale" @click.prevent="deleteSale(sale.SaleMaster_SlNo)"><i class="fa fa-trash"></i></a>
								<?php }?>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr style="font-weight:bold;">
							<td colspan="5" style="text-align:right;">Total</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_SubTotalAmount)}, 0) }}</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_TaxAmount)}, 0) }}</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_TotalDiscountAmount)}, 0) }}</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_Freight)}, 0) }}</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_TotalSaleAmount)}, 0) }}</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_PaidAmount)}, 0) }}</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr)=>{return prev + parseFloat(curr.SaleMaster_DueAmount)}, 0) }}</td>
							<td></td>
						</tr>
					</tfoot>
				</table>

				<table 
					class="record-table" 
					v-if="searchType == 'category' || searchType == 'quantity'"  
					style="display:none;" 
					v-bind:style="{display: searchType == 'category' || searchType == 'quantity' ? '' : 'none'}"
					>
					<thead>
						<tr>
							<th>Invoice No.</th>
							<th>Date</th>
							<th>Customer Name</th>
							<th>Product Name</th>
							<th>Brand</th>
							<th>Origin</th>
							<th>Sales Rate</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="sale in sales">
							<td>{{ sale.SaleMaster_InvoiceNo }}</td> 
							<td>{{ sale.SaleMaster_SaleDate }}</td>
							<td>{{ sale.Customer_Name }}</td>
							<td>{{ sale.Product_Name }}</td> 
							<td>{{ sale.brand_name }}</td>
							<td>{{ sale.origin }}</td>
							<td style="text-align:right;">{{ sale.SaleDetails_Rate }}</td>
							<td style="text-align:right;">{{ sale.SaleDetails_TotalQuantity }}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr style="font-weight:bold;">
							<td colspan="5" style="text-align:right;">Total Quantity</td>
							<td style="text-align:right;">{{ sales.reduce((prev, curr) => { return prev + parseFloat(curr.SaleDetails_TotalQuantity)}, 0) }}</td>
						</tr>
					</tfoot>
				</table>
			</div>
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
		el: '#salesRecord',
		data(){
			return {
				searchType: '',
				recordType: 'without_details',
				dateFrom: moment().format('YYYY-MM-DD'),
				dateTo: moment().format('YYYY-MM-DD'),
				parents:[],
				selectedChildren: null,
				customers: [],
				childrens: [],
				selectedCustomer: null,
				employees: [],
				selectedEmployee: null,
				products: [],
				selectedProduct: null,
				users: [],
				selectedUser: null,
				categories: [],
				selectedCategory: null,
				sales: [],
				brands: [],
				selectedBrand: null,
				filterProducts: [],
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
			},
			selectedBrand(brand) {
				if(brand == undefined) return;
				this.filterProducts = this.products.filter(p => p.brand == brand.brand_SiNo);
			}
		},

		methods: {
			onChangeSearchType(){
				this.sales = [];
				if(this.searchType == 'quantity'){
					this.getProducts();
					this.getBrands();
				} 
				else if(this.searchType == 'user'){
					this.getUsers();
				}
				else if(this.searchType == 'category'){
					this.getCategories();
				}
				else if(this.searchType == 'customer'){
					this.getCustomers();
				}
				else if(this.searchType == 'employee'){
					this.getEmployees();
				}
			},
			getProducts(){
				axios.get('/get_products').then(res => {
					this.products = res.data;
				})
			},
			getCustomers(){
				axios.get('/get_customers').then(res => {
					this.customers = res.data;
					this.parents = res.data.filter(item => item.parent_id == null);
				})
			},
			getEmployees(){
				axios.get('/get_employees').then(res => {
					this.employees = res.data;
				})
			},
			getUsers(){
				axios.get('/get_users').then(res => {
					this.users = res.data;
				})
			},
			getCategories(){
				axios.get('/get_categories').then(res => {
					this.categories = res.data;
				})
			},
			getBrands(){
				axios.get('/get_brands').then(res => {
					this.brands = res.data;
				})
			},
			getSearchResult(){
				if(this.searchType != 'customer'){
					this.selectedCustomer = null;
					this.selectedChildren = null;
				}

				if(this.searchType != 'employee'){
					this.selectedEmployee = null;
				}

				if(this.searchType != 'quantity'){
					this.selectedProduct = null;
				}

				if(this.searchType != 'category'){
					this.selectedCategory = null;
				}

				if(this.searchType == '' || this.searchType == 'user' || this.searchType == 'customer' || this.searchType == 'employee'){
					this.getSalesRecord();
				} else {
					this.getSaleDetails();
				}
			},
			getSalesRecord(){
				let filter = {
					userFullName: this.selectedUser == null || this.selectedUser.FullName == '' ? '' : this.selectedUser.FullName,
					// customerId: this.selectedCustomer == null || this.selectedCustomer.Customer_SlNo == '' ? '' : this.selectedCustomer.Customer_SlNo,
					customerId: this.selectedChildren == null ? (this.selectedCustomer != null ? this.selectedCustomer.Customer_SlNo : null) : this.selectedChildren.Customer_SlNo,
					employeeId: this.selectedEmployee == null || this.selectedEmployee.Employee_SlNo == '' ? '' : this.selectedEmployee.Employee_SlNo,
					dateFrom: this.dateFrom,
					dateTo: this.dateTo
				}

				let url = '/get_sales';
				if(this.recordType == 'with_details'){
					url = '/get_sales_record';
				}

				axios.post(url, filter)
				.then(res => {
					if(this.recordType == 'with_details'){
						this.sales = res.data;
					} else {
						this.sales = res.data.sales;
					}
				})
				.catch(error => {
					if(error.response){
						alert(`${error.response.status}, ${error.response.statusText}`);
					}
				})
			},
			getSaleDetails(){
				if(this.searchType == 'quantity' && this.selectedProduct == null) {
					alert('Select product');
					return;
				}

				let filter = {
					categoryId: this.selectedCategory == null || this.selectedCategory.ProductCategory_SlNo == '' ? '' : this.selectedCategory.ProductCategory_SlNo,
					productId: this.selectedProduct == null || this.selectedProduct.Product_SlNo == '' ? '' : this.selectedProduct.Product_SlNo,
					dateFrom: this.dateFrom,
					dateTo: this.dateTo
				}

				axios.post('/get_saledetails', filter)
				.then(res => {
					this.sales = res.data;
				})
				.catch(error => {
					if(error.response){
						alert(`${error.response.status}, ${error.response.statusText}`);
					}
				})
			},
			deleteSale(saleId){
				let deleteConf = confirm('Are you sure?');
				if(deleteConf == false){
					return;
				}
				axios.post('/delete_sales', {saleId: saleId})
				.then(res => {
					let r = res.data;
					alert(r.message);
					if(r.success){
						this.getSalesRecord();
					}
				})
				.catch(error => {
					if(error.response){
						alert(`${error.response.status}, ${error.response.statusText}`);
					}
				})
			},
			async print(){
				let dateText = '';
				if(this.dateFrom != '' && this.dateTo != ''){
					dateText = `Statemenet from <strong>${this.dateFrom}</strong> to <strong>${this.dateTo}</strong>`;
				}

				let userText = '';
				if(this.selectedUser != null && this.selectedUser.FullName != '' && this.searchType == 'user'){
					userText = `<strong>Sold by: </strong> ${this.selectedUser.FullName}`;
				}

				let customerText = '';
				if(this.selectedCustomer != null && this.selectedCustomer.Customer_SlNo != '' && this.searchType == 'customer'){
					customerText = `<strong>Customer: </strong> ${this.selectedCustomer.Customer_Name}<br>`;
				}

				let employeeText = '';
				if(this.selectedEmployee != null && this.selectedEmployee.Employee_SlNo != '' && this.searchType == 'employee'){
					employeeText = `<strong>Employee: </strong> ${this.selectedEmployee.Employee_Name}<br>`;
				}

				let productText = '';
				if(this.selectedProduct != null && this.selectedProduct.Product_SlNo != '' && this.searchType == 'quantity'){
					productText = `<strong>Product: </strong> ${this.selectedProduct.Product_Name}`;
				}

				let categoryText = '';
				if(this.selectedCategory != null && this.selectedCategory.ProductCategory_SlNo != '' && this.searchType == 'category'){
					categoryText = `<strong>Category: </strong> ${this.selectedCategory.ProductCategory_Name}`;
				}


				let reportContent = `
					<div class="container">
						<div class="row">
							<div class="col-xs-12 text-center">
								<h3>Sales Record</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6">
								${userText} ${customerText} ${employeeText} ${productText} ${categoryText}
							</div>
							<div class="col-xs-6 text-right">
								${dateText}
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#reportContent').innerHTML}
							</div>
						</div>
					</div>
				`;

				var reportWindow = window.open('', 'PRINT', `height=${screen.height}, width=${screen.width}`);
				reportWindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php');?>
				`);

				reportWindow.document.head.innerHTML += `
					<style>
						.record-table{
							width: 100%;
							border-collapse: collapse;
						}
						.record-table thead{
							background-color: #0097df;
							color:white;
						}
						.record-table th, .record-table td{
							padding: 3px;
							border: 1px solid #454545;
						}
						.record-table th{
							text-align: center;
						}
					</style>
				`;
				reportWindow.document.body.innerHTML += reportContent;

				if(this.searchType == '' || this.searchType == 'user'){
					let rows = reportWindow.document.querySelectorAll('.record-table tr');
					rows.forEach(row => {
						row.lastChild.remove();
					})
				}


				reportWindow.focus();
				await new Promise(resolve => setTimeout(resolve, 1000));
				reportWindow.print();
				reportWindow.close();
			}
		}
	})
</script>