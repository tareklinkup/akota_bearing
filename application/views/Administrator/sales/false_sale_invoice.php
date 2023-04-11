<div id="falseSaleInvoice">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<false-invoice v-bind:sale_id="saleId"></false-invoice>
		</div>
	</div>
</div>

<script src="<?php echo base_url();?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/components/falseInvoice.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>
<script>
	new Vue({
		el: '#falseSaleInvoice',
		components: {
			falseInvoice
		},
		data(){
			return {
				saleId: parseInt('<?php echo $saleId;?>')
			}
		}
	})
</script>

