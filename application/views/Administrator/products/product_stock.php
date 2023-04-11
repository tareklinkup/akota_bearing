<style>
	.v-select{
		margin-bottom: 5px;
	}
	.v-select.open .dropdown-toggle{
		border-bottom: 1px solid #ccc;
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
	#products label{
		font-size:13px;
	}
	#products select{
		border-radius: 3px;
		padding: 0px 6px !important;
	}
	#products .add-button{
		padding: 2.5px;
		width: 28px;
		background-color: #298db4;
		display:block;
		text-align: center;
		color: white;
	}
	#products .add-button:hover{
		background-color: #41add6;
		color: white;
	}
</style>
<div id="products">
	<div class="row" style="border-bottom: 1px solid #ccc;padding: 3px 0;">
		<div class="col-md-12">
			<form class="inline-form" @submit.prevent="getProducts">
				<div class="from-group">
					<label for="for" class="contron-lable col-md-1">Branch</label>
					<div class="col-md-2">
						<v-select v-bind:options="branches" v-model="selectedBranch" label="Brunch_name"></v-select>
					</div>
				</div>
				<div class="from-group">
					<label for="for" class="contron-lable col-md-1">Brand</label>
					<div class="col-md-2">
						<v-select v-bind:options="brands" v-model="selectedBrand" label="brand_name"></v-select>
					</div>
				</div>
				<div class="from-group" style="display: none">
					<div class="col-md-2">
						<select class="form-control" v-model="type">
							<option value="without">Without 0 Stock</option>
							<option value="with">With 0 Stock</option>
						</select>
					</div>
				</div>
				<div class="from-group">
					<div class="col-md-1">
						<button type="submit" class="btn btn-xs btn-block btn-info">Search</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="row" v-if="products.length > 0">
		<br>
		<div class="col-sm-12 form-inline">
			<div class="form-group">
				<label for="filter" class="sr-only">Filter</label>
				<input type="text" class="form-control" v-model="filter" placeholder="Filter">
			</div>
		</div>
		<div class="col-md-12">
			<div class="table-responsive">
				<datatable :columns="columns" :data="filteredProducts" >
					<template scope="{ row }">
						<tr :style="{background: row.sl == unikId ? '#61747ca6' : ''}"> 
							<td @click="unikId = row.sl">{{ row.Product_Code }}</td>
							<td @click="unikId = row.sl">{{ row.Product_Name }}</td>
							<td @click="unikId = row.sl">{{ row.brand_name }}</td>
							<td @click="unikId = row.sl">{{ row.origin }}</td>
							<td @click="unikId = row.sl">{{ row.Product_Purchase_Rate }}</td>
							<td @click="unikId = row.sl">{{ row.Product_SellingPrice }}</td>
							<td @click="unikId = row.sl">{{ row.Product_WholesaleRate }}</td>
							<td @click="unikId = row.sl">  <span style="color: green"> Total = {{row.brances.reduce((pre,next)=>{
									return pre+parseFloat(next.current_quantity)
								},0)}} {{ row.Unit_Name }} - </span><br>
								<span v-for="brance in row.brances" v-bind:style=" (brance.current_quantity<0) ? 'color: red' : 'color:#222' ">
									{{brance.Brunch_name}} => {{brance.current_quantity}} {{ row.Unit_Name }}
									<br>
								</span></td>
						</tr>
					</template>
				</datatable>
				<datatable-pager v-model="page" type="abbreviated" :per-page="per_page"></datatable-pager>
			</div>
		</div>
	</div> 
</div> 
<script src="<?php echo base_url();?>assets/js/vue/vue.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>
<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#products',
		data(){
			return {
				branches: [],
				selectedBranch: null,
				brands: [],
				selectedBrand: null,
				products: [],
				filteredProducts:[],
				type: '',
				columns: [
                    { label: 'Product Id', field: 'Product_Code', align: 'center', filterable: false },
                    { label: 'Product Name', field: 'Product_Name', align: 'center',filterable: true },
                    { label: 'Brand', field: 'brand_name', align: 'center',filterable: false },
                    { label: 'Origin', field: 'origin', align: 'center',filterable: false },
                    { label: 'Purchase Price', field: 'Product_Purchase_Rate', align: 'center',filterable: false },
                    { label: 'Sales Price', field: 'Product_SellingPrice', align: 'center',filterable: false },
                    { label: 'Wholesale Price', field: 'Product_WholesaleRate', align: 'center',filterable: false },
                    { label: 'Current Stock', align: 'right',field: 'current_stock',filterable: false }
                ],
                page: 1,
                per_page: 100,
                filter: '',
				unikId: null
			}
		},
		created(){
			this.getBranches();
			this.getBrands();
			// this.getProducts();
		},
		watch: {
			filter(value) {
				this.filteredProducts = this.products.filter(product => product.Product_Name.toLowerCase().match(value.toLowerCase()));
			}
		},
		methods:{
			getBranches() {
				axios.get('/get_branches')
				.then(res => {
					this.branches = res.data;
				})
			},
			getBrands() {
				axios.get('get_brands')
				.then(res => {
					this.brands = res.data;
				})
			},
			async getProducts(){
				let filter = {
					branchId: this.selectedBranch != null ? this.selectedBranch.brunch_id : null,
					brandId: this.selectedBrand != null ? this.selectedBrand.brand_SiNo : null
				}

				await axios.post('/get-searching-stock', filter).then(res => {
					this.products = res.data.stock;
					this.filteredProducts = res.data.stock.map((item, sl) => {
						item.sl = sl + 1;
						return item;
					});
				});
			}
		}
	})
</script>