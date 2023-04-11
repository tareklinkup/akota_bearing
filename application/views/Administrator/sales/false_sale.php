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
	#branchDropdown .vs__actions button{
		display:none;
	}
	#branchDropdown .vs__actions .open-indicator{
		height:15px;
		margin-top:7px;
	}
</style>
<div id="sale" class="row">
	<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;margin-bottom:5px;">
		<div class="row">
			<div class="form-group">
				<label class="col-sm-1 control-label no-padding-right"> Invoice no </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" v-model="sale.invoiceNo" readonly/>
				</div>
			</div>
			<div class="form-group" style="display:none">
				<label class="col-sm-1 control-label no-padding-right"> Invoice. By </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" v-model="sale.invoiceBy" readonly />
				</div>
			</div>

            <div class="form-group">
                <label class="col-sm-1 control-label no-padding-right"> PR/PO  </label>
                <div class="col-sm-2">
                    <input type="text" id="PRPO_label" class="form-control" v-model="sale.PRPO_label"  />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 control-label no-padding-right"> Challan  No </label>
                <div class="col-sm-2">
                    <input type="text" id="PRPO_text" class="form-control" v-model="sale.PRPO_text"  />
                </div>
            </div>
		</div>
	</div>

	<div class="col-xs-9 col-md-9 col-lg-9">
		<div class="widget-box">
			<div class="widget-header">
				<h4 class="widget-title">Invoice Information</h4>
				<div class="widget-toolbar">
					<a href="#" data-action="collapse">
						<i class="ace-icon fa fa-chevron-up"></i>
					</a>

					<a href="#" data-action="close">
						<i class="ace-icon fa fa-times"></i>
					</a>
				</div>
			</div>

			<div class="widget-body">
				<div class="widget-main">

					<div class="row">
						<div class="col-sm-5">
							<div class="form-group clearfix">
								<label class="col-sm-4 control-label no-padding-right"> Customer</label>
								<div class="col-sm-8">
									<input type="text" style="color: #222" class="form-control" v-model="sale.customerName" placeholder="Customer Name">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label no-padding-right"> Mobile No </label>
								<div class="col-sm-8">
									<input type="text" style="color: #222" placeholder="Mobile No" class="form-control" v-model="sale.customerMobile" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label no-padding-right"> Address </label>
								<div class="col-sm-8">
									<textarea style="color: #222" placeholder="Address" class="form-control" v-model="sale.customerAddress"></textarea>
								</div>
							</div>
						</div>

						<div class="col-sm-5">
							<form v-on:submit.prevent="addToCart">
								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"> Product Name </label>
									<div class="col-sm-8">
										<input type="text" style="color: #222" rel="product" placeholder="product name" class="form-control" v-model="selectedProduct.Product_Name" v-on:input="productTotal"/>
									</div>
								</div>

								<div class="form-group" style="display: none;">
									<label class="col-sm-4 control-label no-padding-right"> Product </label>
									<div class="col-sm-8">
										<v-select v-bind:options="products"  v-model="selectedProduct" label="display_text" v-on:input="productOnChange"></v-select>
									</div>
									<div class="col-sm-1" style="padding: 0;">
										<a href="<?= base_url('product')?>" class="btn btn-xs btn-danger" style="height: 25px; border: 0; width: 27px; margin-left: -10px;" target="_blank" title="Add New Product"><i class="fa fa-plus" aria-hidden="true" style="margin-top: 5px;"></i></a>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"> Brand </label>
									<div class="col-sm-8">
										<input type="text" placeholder="brand" class="form-control" v-model="selectedProduct.brand_name" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"> Origin </label>
									<div class="col-sm-8">
										<input type="text" placeholder="origin" class="form-control" v-model="selectedProduct.origin" />
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"> Sale Rate </label>
									<div class="col-sm-8">
										<input style="color: #222" type="number" placeholder="Rate" class="form-control" v-model="selectedProduct.Product_SellingPrice" v-on:input="productTotal"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"> Quantity </label>
									<div class="col-sm-8">
										<input style="color: #222" type="number" id="quantity" placeholder="Qty" class="form-control" ref="quantity" v-model="selectedProduct.quantity" v-on:input="productTotal" autocomplete="off" required/>
									</div>
								</div>

								<div class="form-group" style="display:none;">
									<label class="col-sm-4 control-label no-padding-right"> Discount</label>
									<div class="col-sm-8">
										<span>(%)</span>
										<input type="text" placeholder="Discount" class="form-control" style="display: inline-block; width: 90%" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"> Amount </label>
									<div class="col-sm-8">
										<input style="color: #222" type="text" placeholder="Amount" class="form-control" v-model="selectedProduct.total" readonly />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"> </label>
									<div class="col-sm-9">
										<button type="submit" class="btn btn-default pull-right">Add to Cart</button>
									</div>
								</div>
							</form>

						</div>
						<div class="col-sm-2">
							<input type="password" ref="productPurchaseRate" v-model="selectedProduct.Product_Purchase_Rate" v-on:mousedown="toggleProductPurchaseRate" v-on:mouseup="toggleProductPurchaseRate" v-on:mouseout="$refs.productPurchaseRate.type = 'password'" readonly title="Purchase rate (click & hold)" style="font-size:12px;width:100%;text-align: center;">
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-xs-12 col-md-12 col-lg-12" style="padding-left: 0px;padding-right: 0px;">
			<div class="table-responsive">
				<table class="table table-bordered" style="color:#000;margin-bottom: 5px;">
					<thead>
						<tr class="">
							<th style="width:10%;color:#000;">Sl</th>
							<th style="width:20%;color:#000;">Product Name</th>
							<th style="width:20%;color:#000;">Brand</th>
							<th style="width:20%;color:#000;">Origin</th>
							<th style="width:7%;color:#000;">Qty</th>
							<th style="width:8%;color:#000;">Rate</th>
							<th style="width:15%;color:#000;">Total Amount</th>
							<th style="width:15%;color:#000;">Action</th>
						</tr>
					</thead>
					<tbody style="display:none;" v-bind:style="{display: cart.length > 0 ? '' : 'none'}">
						<tr v-for="(product, sl) in cart">
							<td>{{ sl + 1 }}</td>
							<td>{{ product.name }}</td>
							<td>{{ product.brand_name }}</td>
							<td>{{ product.origin }}</td>
							<td>{{ product.quantity }}</td>
							<td>{{ product.Product_SellingPrice }}</td>
							<td>{{ product.total }}</td> 
							<td>
                                <!-- <a style="margin-right: 5px" href="" v-on:click.prevent="edit(product,sl)"><i class="fa fa-edit"></i></a> -->
                                <a href="" v-on:click.prevent="removeFromCart(sl)"><i class="fa fa-trash"></i></a>
                            </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
		<div class="widget-box">
			<div class="widget-header">
				<h4 class="widget-title">Amount Details</h4>
				<div class="widget-toolbar">
					<a href="#" data-action="collapse">
						<i class="ace-icon fa fa-chevron-up"></i>
					</a>

					<a href="#" data-action="close">
						<i class="ace-icon fa fa-times"></i>
					</a>
				</div>
			</div>

			<div class="widget-body">
				<div class="widget-main">
					<div class="row">
						<div class="col-sm-12">
							<div class="table-responsive">
								<table style="color:#000;margin-bottom: 0px;border-collapse: collapse;">
									<tr>
										<td>
											<div class="form-group">
												<label class="col-sm-12 control-label no-padding-right">Sub Total</label>
												<div class="col-sm-12">
													<input type="number" class="form-control" v-model="sale.subTotal" readonly />
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td>
											<div class="form-group">
												<label class="col-sm-12 control-label no-padding-right"> Vat </label>
												<div class="col-sm-4">
													<input type="number" class="form-control" v-model="vatPercent" v-on:input="calculateTotal"/>
												</div>
												<label class="col-sm-1 control-label no-padding-right">%</label>
												<div class="col-sm-7">
													<input type="number" readonly class="form-control" v-model="sale.vat"/>
												</div>
											</div>
										</td>
									</tr>

									<tr style="display:none;">
										<td>
											<div class="form-group">
												<label class="col-sm-12 control-label no-padding-right">Freight</label>
												<div class="col-sm-12">
													<input type="number" class="form-control" />
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td>
											<div class="form-group">
												<label class="col-sm-12 control-label no-padding-right">Discount Persent</label>

												<div class="col-sm-4">
													<input type="number" class="form-control" v-model="discountPercent" v-on:input="calculateTotal"/>
												</div>

												<label class="col-sm-1 control-label no-padding-right">%</label>

												<div class="col-sm-7">
													<input type="number" id="discount" class="form-control" v-model="sale.discount" v-on:input="calculateTotal"/>
												</div>

											</div>
										</td>
									</tr>

									<tr style="display:none;">
										<td>
											<div class="form-group">
												<label class="col-sm-12 control-label no-padding-right">Round Of</label>
												<div class="col-sm-12">
													<input type="number" class="form-control" />
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td>
											<div class="form-group">
												<label class="col-sm-12 control-label no-padding-right">Total</label>
												<div class="col-sm-12">
													<input type="number" class="form-control" v-model="sale.total" readonly />
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td>
											<div class="form-group">
												<div class="col-sm-3">
													<input type="button" class="btn btn-default" value="Save" v-on:click="saveFalseSale" style="color:#fff;margin-top: 0px;">
												</div>
												<div class="col-sm-4">
													<input type="button" class="btn btn-info" value="New sale" v-on:click="window.location = '/sale'" style="color:#fff;margin-top: 0px;">
												</div>
											</div>
										</td>
									</tr>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="<?php echo base_url();?>assets/js/vue/vue.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#sale',
		data(){
			return {
				sale:{
                    id: null,
					saleId: parseInt('<?php echo $saleId;?>'),
					invoiceNo: '<?php echo $invoice;?>',
					customerName: '',
					customerMobile: '',
					customerAddress: '',
					invoiceBy: '<?php echo $this->session->userdata("FullName"); ?>',
					saleFrom: '',
					subTotal: 0.00,
					discount: 0.00,
					vat: 0.00,
					total: 0.00,
					PRPO_label:'',
					PRPO_text:''
				},
				
				vatPercent: 0,
				discountPercent: 0,
				cart: [],
				cartAction:'create',
				branches: [],
				selectedBranch: {
					brunch_id: "<?php echo $this->session->userdata('BRANCHid'); ?>",
					Brunch_name: "<?php echo $this->session->userdata('Brunch_name'); ?>"
				},
				products: [],
				selectedProduct: {
					Product_SlNo: '',
					display_text: 'Select Product',
					Product_Name: '',
					Unit_Name: '',
					quantity: 0,
					Product_Purchase_Rate: '',
					Product_SellingPrice: 0.00,
					total: 0.00,
					brand_name:'',
					origin:''
				}
			}
		},
		created(){
			this.getBranches();
			this.getProducts();

			if(this.sale.id != 0){
				this.getFalseSales();
			}


		},
		methods:{
			getBranches(){
				axios.get('/get_branches').then(res=>{
					this.branches = res.data;
				})
			},
			getProducts(){
				axios.get('/get_products').then(res=>{
					this.products = res.data;
				})
			},
			productTotal(){
				this.selectedProduct.total = (parseFloat(this.selectedProduct.quantity) * parseFloat(this.selectedProduct.Product_SellingPrice)).toFixed(2);
			},
			productOnChange(){
				// this.$refs.quantity.focus();
			},
			toggleProductPurchaseRate(){
				//this.productPurchaseRate = this.productPurchaseRate == '' ? this.selectedProduct.Product_Purchase_Rate : '';
				this.$refs.productPurchaseRate.type = this.$refs.productPurchaseRate.type == 'text' ? 'password' : 'text';
			},
			addToCart(){
				if(this.selectedProduct.quantity == 0 || this.selectedProduct.quantity == '') {
					alert('Enter quantity');
					return;
				}
                let product = {
                    categoryName: this.selectedProduct.ProductCategory_Name,
                    name: this.selectedProduct.Product_Name,
                    Product_SellingPrice: this.selectedProduct.Product_SellingPrice,
                    brand_name: this.selectedProduct.brand_name,
                    origin: this.selectedProduct.origin,
                    quantity: this.selectedProduct.quantity,
                    total: this.selectedProduct.total
                }
                this.cart.unshift(product);

				if(product.Product_SellingPrice == 0 || product.Product_SellingPrice == ''){
					alert('Enter sales rate');
					return;
				}
                
				this.clearProduct();
				this.calculateTotal();
			},
			removeFromCart(ind){
				this.cart.splice(ind, 1);
				this.calculateTotal();
			},
			clearProduct(){
				this.selectedProduct = {
					Product_SlNo: '',
					display_text: 'Select Product',
					Product_Name: '',
					quantity: 0,
					Product_SellingPrice: 0.00,
					total: 0.00
				}
			},

			calculateTotal(){
				this.sale.subTotal = this.cart.reduce((prev, curr) => { return prev + parseFloat(curr.total)}, 0).toFixed(2);
                this.sale.vat = ((parseFloat(this.sale.subTotal) * parseFloat(this.vatPercent)) / 100).toFixed(2);
                
				if(event.target.id == 'discount'){
					this.discountPercent = (parseFloat(this.sale.discount) / parseFloat(this.sale.subTotal) * 100).toFixed(2);
				} else {
					this.sale.discount = ((parseFloat(this.sale.subTotal) * parseFloat(this.discountPercent)) / 100).toFixed(2);
				}
                let vat = this.sale.vat != 'NaN'? parseFloat(this.sale.vat) : 0;
                let discount = this.sale.discount != 'NaN'? parseFloat(this.sale.discount) : 0;
				this.sale.total = ((parseFloat(this.sale.subTotal) +  parseFloat(vat)) - parseFloat(discount)).toFixed(2);

			},
			saveFalseSale(){
				if(this.cart.length == 0){
					alert('Cart is empty');
					return;
				}

				if(this.sale.invoiceNo == '') {
					alert('Invoice is required');
					return;
				}

				if(this.sale.customerName == undefined || this.sale.customerName == '') {
					alert('Customer name is required');
					return;
				}
				if(this.sale.customerMobile == undefined || this.sale.customerMobile == '') {
					alert('Customer name is required');
					return;
				}


                let url = "";
                if(this.sale.id != null) {
                    url = "/update_false_sale";
                } else {
                    url = '/add_false_sale';
                    delete this.sale.id;
                }

			
				this.sale.saleFrom = this.selectedBranch.brunch_id;
				let data = {
					sale: this.sale,
					cart: this.cart
				}
				axios.post(url, data).then(async res=> {
					let r = res.data;
					alert(r.message);
					if(r.success){
						let conf = confirm('Do you want to view invoice?');
						if(conf){
							window.open('/sale_invoice/'+r.saleId, '_blank');
							await new Promise(r => setTimeout(r, 1000));
							window.location = `/false_sales/${this.sale.saleId}`;
						} else {
							window.location = `/false_sales/${this.sale.saleId}`;
						}
					}
				})
			},
			getFalseSales(){
				axios.post('/get_false_sales', {saleId: this.sale.saleId}).then(res=>{
					let r = res.data;
					let sale = r.sales[0];
                    this.sale.id = sale?.id;
					this.sale.customerName = sale?.SaleMaster_customer_name;
					this.sale.customerMobile = sale?.SaleMaster_customer_mobile;
					this.sale.customerAddress = sale?.SaleMaster_customer_address;
					this.sale.invoiceBy = sale?.AddBy;
					this.sale.salesFrom = sale?.SaleMaster_branchid;
					this.sale.salesDate = sale?.SaleMaster_SaleDate;
					this.sale.subTotal = sale?.SaleMaster_SubTotalAmount;
					this.sale.discount = sale?.SaleMaster_TotalDiscountAmount;
					this.sale.vat = sale?.SaleMaster_TaxAmount;
					this.sale.total = sale?.SaleMaster_TotalSaleAmount;
					this.sale.PRPO_label = sale?.PRPO_label;
					this.sale.PRPO_text = sale?.PRPO_text;

					this.vatPercent = parseFloat(this.sale.vat) * 100 / parseFloat(this.sale.subTotal);
					this.discountPercent = parseFloat(this.sale.discount) * 100 / parseFloat(this.sale.subTotal);

					r.saleDetails.forEach(product => {
						let cartProduct = {
							Product_SellingPrice: product.SaleDetails_Rate,
							quantity: product.SaleDetails_TotalQuantity,
							total: product.SaleDetails_TotalAmount,
							name:product.product_name,
							brand_name: product.brand_name,
							origin: product.origin
						}

						this.cart.push(cartProduct);
					})
				})
			},
		}
	})
</script>