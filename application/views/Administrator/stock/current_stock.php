<style>
    .v-select {
        margin-bottom: 5px;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
    }

    .v-select input[type=search],
    .v-select input[type=search]:focus {
        margin: 0px;
    }

    .v-select .vs__selected-options {
        overflow: hidden;
        flex-wrap: nowrap;
    }

    .v-select .selected-tag {
        margin: 2px 0px;
        white-space: nowrap;
        position: absolute;
        left: 0px;
    }

    .v-select .vs__actions {
        margin-top: -5px;
    }

    .v-select .dropdown-menu {
        width: auto;
        overflow-y: auto;
    }
</style>
<div id="stock">
	<div class="row">
		<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;margin-bottom:5px;">
			<div class="form-group" style="margin-top:10px;">
				<label class="col-sm-1 col-sm-offset-1 control-label no-padding-right"> Select Type </label>
				<div class="col-sm-2">
					<v-select v-bind:options="searchTypes" v-model="selectedSearchType" label="text" v-on:input="onChangeSearchType"></v-select>
				</div>
			</div>
	
			<div class="form-group" style="margin-top:10px;" v-if="selectedSearchType.value == 'category'">
				<div class="col-sm-2" style="margin-left:15px;">
					<v-select v-bind:options="categories" v-model="selectedCategory" label="ProductCategory_Name"></v-select>
				</div>
			</div>
			
			<div class="form-group" style="margin-top:10px;" v-if="selectedSearchType.value == 'brand' || selectedSearchType.value=='product' || selectedSearchType.value=='branch'">
				<label for="brand" class="col-sm-1 text-center" style="padding: 0;">Brands</label>
				<div class="col-sm-2" style="padding: 0;">
					<v-select v-bind:options="brands" v-model="selectedBrand" label="brand_name"></v-select>
				</div>
			</div>

			<div class="form-group" style="margin-top:10px;" v-if="selectedSearchType.value == 'product' || selectedSearchType.value=='branch' || selectedSearchType.value=='current'">
				<label for="product" class="col-sm-1 text-center" style="padding: 0;">Products</label>	
				<div class="col-sm-2" style="padding: 0;">
					<v-select v-bind:options="filterProducts" v-model="selectedProduct" label="display_text"></v-select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-2">
					<input type="button" class="btn btn-primary" value="Show Report" v-on:click="getStock" style="margin-top:0px;border:0px;height:28px;">
				</div>
			</div>
		</div>
	</div>
	<div class="row" v-if="searchType != null" style="display:none" v-bind:style="{display: searchType == null ? 'none' : ''}">
		<div class="col-md-12">
			<a href="" v-on:click.prevent="print"><i class="fa fa-print"></i> Print</a> | &nbsp;
			<a href="javascript:" 
				v-if="searchType == 'current'" 
				onclick="exportToExcel('current_stock_table', 'Current Stock - <?php echo date('D d F, Y') ?>')"
			> 
				<i class="fa fa-file-excel-o"></i> Current Stock Excel 
			</a>
			<a href="javascript:" v-else 
				onclick="exportToExcel('total_stock_table', 'Total Stock - <?php echo date('D d F, Y') ?>')"
			> 
				<i class="fa fa-file-excel-o"></i> Total Stock Excel 
			</a> | &nbsp;
			 
			<a href="javascript:" 
				onclick="exportToWord('Stock Report - <?php echo date('D d F, Y') ?>')"
			> 
				<i class="fa fa-file-word-o"></i> Stock Report Word 
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive googoose-wrapper" id="stockContent">

				<table id="current_stock_table" class="table table-bordered" v-if="searchType == 'current'" style="display:none" v-bind:style="{display: searchType == 'current' ? '' : 'none'}">
					<thead>
						<tr>
							<th>Product Id</th>
							<th>Product Name</th>
							<th>Category</th>
							<th>Brand</th>
							<th>Purchase Rate</th>
							<th>Last Update</th>
							<th>Current Quantity</th>
							<th>Stock Value</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="product in stock">
							<td>{{ product.Product_Code }}</td>
							<td>{{ product.Product_Name }}</td>
							<td>{{ product.ProductCategory_Name }}</td>
							<td>{{ product.brand_name }}</td>
							<td>{{ product.Product_Purchase_Rate  }}</td>
							<td>{{ product.lastupdate  }}</td>
							<td v-bind:style=" (product.current_quantity<0) ? 'color: red' : 'color:#222' ">{{ product.current_quantity }} {{ product.Unit_Name }}</td>
							<td>{{ product.stock_value }}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6" style="text-align:right;">Total Stock Value</td>
							<td>{{ totalStockValue }}</td>
						</tr>
					</tfoot>
				</table>


				<table class="table table-bordered" v-if="searchType == 'brand'" style="display:none" v-bind:style="{display: searchType == 'brand' ? '' : 'none'}">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Brand Name</th>
							<th>Category</th>
							<th>purchase Rate</th>
							<th>Sale Rate</th>
							<th>Quantity</th>
							<th>Stock Value</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="product in stock">
							<td>{{ product.Product_Name }}</td>
							<td>{{ product.brand_name }}</td>
							<td>{{ product.ProductCategory_Name }}</td>
							<td>{{ product.Product_Purchase_Rate }}</td>
							<td>{{ product.Product_SellingPrice }}</td>
							<td v-bind:style=" (product.current_quantity<0) ? 'color: red' : 'color:#222' ">{{ product.current_quantity }} {{ product.Unit_Name }}</td>
							<td>{{ product.stock_value }}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6" style="text-align:right;">Total Stock Value</td>
							<td>{{ totalStockValue }}</td>
						</tr>
					</tfoot>
				</table>

                
				<table 
					id="total_stock_table"
					class="table table-bordered" 
						v-if="searchType != 'current' && searchType != 'brand' && searchType != null && searchType != 'branch'" 
						style="display:none;" 
						v-bind:style="{display: searchType != 'current' && searchType != 'branch' && searchType != null ? '' : 'none'}">
					<thead>
						<tr>
							<th>Product Id</th>
							<th>Product Name</th>
							<th>Category</th>
							<th>Brand</th>
							<th>Purchase Rate</th>
							<th>Last update</th>
							<th>Purchased Quantity</th>
							<th>Purchase Returned Quantity</th>
							<th>Damaged Quantity</th>
							<th>Sold Quantity</th>
							<th>Sales Returned Quantity</th>
							<th>Transfered In Quantity</th>
							<th>Transfered Out Quantity</th>
							<th>Current Quantity</th>
							<th>Stock Value</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="product in stock">
							<td>{{ product.Product_Code }}</td>
							<td>{{ product.Product_Name }}</td>
							<td>{{ product.ProductCategory_Name }}</td>
							<td>{{ product.brand_name }}</td>
							<td>{{ product.Product_Purchase_Rate }}</td>
								<td>{{ product.lastupdate  }}</td>
							<td>{{ product.purchased_quantity }}</td>
							<td>{{ product.purchase_returned_quantity }}</td>
							<td>{{ product.damaged_quantity }}</td>
							<td>{{ product.sold_quantity }}</td>
							<td>{{ product.sales_returned_quantity }}</td>
							<td>{{ product.transfered_to_quantity}}</td>
							<td>{{ product.transfered_from_quantity}}</td>
							<td v-bind:style=" (product.current_quantity<0) ? 'color: red' : 'color:#222' ">{{ product.current_quantity }} {{ product.Unit_Name }}</td>
							<td>{{ product.stock_value }}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="13" style="text-align:right;">Total Stock Value</td>
							<td>{{ totalStockValue }}</td>
						</tr>
					</tfoot>
				</table>

				<table id="total_stock_table" class="table table-bordered" v-if="searchType == 'branch'" style="display:none" v-bind:style="{display: searchType == 'branch' ? '' : 'none'}">
					<thead>
						<tr>
							<th>Product Id</th>
							<th>Product Name</th>
							<th>Brand</th>
							<th>Category</th>
							<th>Current Quantity with Branch</th>
							<th>Stock Value</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="product in stock">
							<td>{{ product.Product_Code }}</td>
							<td>{{ product.Product_Name }}</td>
							<td>{{ product.brand_name }}</td>
							<td>{{ product.ProductCategory_Name }}</td>
							<td> 
                                
								    <span style="color: green"> Total = {{product.brances.reduce((pre,next)=>{
                                		return pre+parseFloat(next.current_quantity)
                                	},0)}} {{ product.Unit_Name }} - </span><br>
                                	<span v-for="brance in product.brances" v-bind:style=" (brance.current_quantity<0) ? 'color: red' : 'color:#222' ">
                                		{{brance.Brunch_name}} = {{brance.current_quantity}} {{ product.Unit_Name }}
                                		<br>
                                	</span>
                                	
							</td>
							<td>{{ product.stock_value }}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:right;">Total Stock Value</td>
							<td>{{ totalStockValue }}</td>
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

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#stock',
		data(){
			return {
				searchTypes: [
					{text: 'Current Stock', value: 'current'},
					{text: 'Total Stock', value: 'total'},
					{text: 'Category Wise Stock', value: 'category'},
					{text: 'Product Wise Stock', value: 'product'},
					{text: 'Branch Wise Stock', value: 'branch'},
				    {text: 'Brand Wise Stock', value: 'brand'}
				],
				selectedSearchType: {
					text: 'select',
					value: ''
				},
				searchType: null,
				categories: [],
				selectedCategory: null,
				products: [],
				selectedProduct: {
					Product_SlNo:0,
					display_text: 'Select Product'
				},
				brands: [],
				selectedBrand: null,
				filterProducts: [],
				selectionText: '',

				stock: [],
				totalStockValue: 0.00
			}
		},
		watch: {
			selectedBrand(brand) {
				if(brand == undefined) return;
				this.filterProducts = this.products.filter(p => p.brand == brand.brand_SiNo);
			}
		},
		created(){
		},
		methods:{
			
			async getStock(){
				this.searchType = this.selectedSearchType.value;
				let url = '';
				if(this.searchType == 'current' ){
					url = '/get_current_stock';
				}else if(this.searchType == 'branch'){
					url = '/get_branch_stock';
				} else {
					url = '/get_total_stock';
				}

				let parameters = null;
				this.selectionText = "";

				if(this.searchType == 'category' && this.selectedCategory == null){
					alert('Select a category');
					return;
				} else if(this.searchType == 'category' && this.selectedCategory != null) {
					parameters = {
						categoryId: this.selectedCategory.ProductCategory_SlNo
					}
					this.selectionText = "Category: " + this.selectedCategory.ProductCategory_Name;
				}
				
				if(this.searchType == 'product'  && this.selectedProduct.Product_SlNo == 0){
					alert('Select a brand');
					return;
				} else  if(this.searchType == 'product' && this.selectedProduct.Product_SlNo != 0) {
					parameters = {
						productId: this.selectedProduct.Product_SlNo != 0 ? this.selectedProduct.Product_SlNo : null,
						brandId: this.selectedBrand != null ? this.selectedBrand.brand_SiNo : null
					}
					this.selectionText = "product: " + this.selectedProduct.Product_SlNo != 0 ? this.selectedProduct.display_text : '';
				}

				if(this.searchType == 'brand' && this.selectedBrand == null){
					alert('Select a brand');
					return;
				} else if(this.searchType == 'brand' && this.selectedBrand != null) {
					parameters = {
						brandId: this.selectedBrand.brand_SiNo
					}
					this.selectionText = "Brand: " + this.selectedBrand.brand_name;
				}

				if (this.searchType == 'branch' ) {
					if(this.selectedBrand == null && this.selectedProduct.Product_SlNo == 0) {
						alert('Select brand');
						return;
					}

					if(this.selectedBrand != null && this.selectedProduct.Product_SlNo != 0) {
						parameters = {
							productId: this.selectedProduct.Product_SlNo != null ? this.selectedProduct.Product_SlNo : null,
							brandId: this.selectedBrand != null ? this.selectedBrand.brand_SiNo : null
						}
					} else if(this.selectedBrand != null) {
						parameters = {
							brandId:this.selectedBrand.brand_SiNo
						}
					} else if(this.selectedProduct.Product_SlNo != 0) {
						parameters = {
							productId: this.selectedProduct.Product_SlNo
						}
					}

					console.log(parameters)
				}
				if ( this.searchType == 'current') {
					parameters = {
						productId: this.selectedProduct.Product_SlNo
					}
				}



				await axios.post(url, parameters).then(res => {
					this.stock = res.data.stock;
					this.totalStockValue = res.data.totalValue;
				})
			},
			onChangeSearchType(){
				if(this.selectedSearchType.value == 'category' && this.categories.length == 0){
					this.getCategories();
				} else if(this.selectedSearchType.value == 'brand' && this.brands.length == 0){
					this.getBrands();
				} 

				if(this.selectedSearchType.value == 'product'  && this.products.length == 0){
					this.getProducts();
				}

				if(this.selectedSearchType.value == 'branch' || this.selectedSearchType.value == 'current'){
					this.getProducts();
				}

				if(this.selectedSearchType.value == 'branch' || this.selectedSearchType.value == 'product'){
					this.getBrands();
				}
			},
			getCategories(){
				axios.get('/get_categories').then(res => {
					this.categories = res.data;
				})
			},
			getProducts(){
				axios.get('/get_products').then(res => {
					this.products =  res.data;
					this.filterProducts = res.data;
				})
			},
			getBrands(){
				axios.get('/get_brands').then(res => {
					this.brands = res.data;
				})
			},
			async print(){
				let reportContent = `
					<div class="container">
						<h4 style="text-align:center">${this.selectedSearchType.text} Report</h4 style="text-align:center">
						<h6 style="text-align:center">${this.selectionText}</h6>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#stockContent').innerHTML}
							</div>
						</div>
					</div>
				`;

				var reportWindow = window.open('', 'PRINT', `height=${screen.height}, width=${screen.width}, left=0, top=0`);
				reportWindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php');?>
				`);

				reportWindow.document.body.innerHTML += reportContent;

				reportWindow.focus();
				await new Promise(resolve => setTimeout(resolve, 1000));
				reportWindow.print();
				reportWindow.close();
			}
		}
	})
</script>