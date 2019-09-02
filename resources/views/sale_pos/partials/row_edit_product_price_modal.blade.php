<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">{{$product->product_name}} - {{$product->sub_sku}}</h4>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="form-group col-xs-12 @if(!auth()->user()->can('edit_product_price_from_sale_screen')) hide @endif">
					<label>@lang('sale.unit_price')</label>
						<input type="text" name="products[{{$row_count}}][unit_price]" class="form-control pos_unit_price input_number mousetrap" value="{{@num_format(!empty($product->unit_price_before_discount) ? $product->unit_price_before_discount : $product->default_sell_price)}}">
				</div>
				@php
					$discount_type 	= !empty($product->line_discount_type) ? $product->line_discount_type : 'fixed';
					$discount_amount = !empty($product->line_discount_amount) ? $product->line_discount_amount : 0;
					$weight 	= !empty($product->weight) ? $product->weight : 0;
				@endphp
				{{--<div class="form-group col-xs-12 col-sm-6 @if(!auth()->user()->can('edit_product_discount_from_sale_screen')) hide @endif">--}}
					{{--<label>@lang('sale.discount_type')</label>--}}
						{{--{!! Form::select("products[$row_count][line_discount_type]", ['fixed' => __('lang_v1.fixed'), 'percentage' => __('lang_v1.percentage')], $discount_type , ['class' => 'form-control row_discount_type']); !!}--}}
				{{--</div>--}}
				<div class="form-group col-xs-12 col-sm-12 @if(!auth()->user()->can('edit_product_discount_from_sale_screen')) hide @endif">
					<label>@lang('sale.discount')</label>
						{!! Form::text("products[$row_count][line_discount_amount]", @num_format($discount_amount), ['class' => 'form-control input_number row_discount_amount']); !!}
				</div>
				<div class="form-group col-xs-12 {{$hide_tax}}">
					<label>@lang('sale.tax')</label>
					{!! Form::hidden("products[$row_count][item_tax]", @num_format($item_tax), ['class' => 'item_tax']); !!}

					{!! Form::select("products[$row_count][tax_id]", $tax_dropdown['tax_rates'], $tax_id, ['placeholder' => 'Select', 'class' => 'form-control tax_id'], $tax_dropdown['attributes']); !!}
				</div>
				<div class="form-group col-xs-12 col-sm-6 @if(!auth()->user()->can('edit_product_discount_from_sale_screen')) hide @endif">
					<label>@lang('sale.t_o')</label>
					{!! Form::text("products[$row_count][product_to]", $product->product_to, ['class' => 'form-control product_to input_number']); !!}
				</div>
				<div class="form-group col-xs-12 col-sm-6 @if(!auth()->user()->can('edit_product_discount_from_sale_screen')) hide @endif">
					<label>@lang('sale.a_t_o')</label>
					{!! Form::text("products[$row_count][product_ato]", $product->product_ato, ['class' => 'form-control product_ato input_number']); !!}
				</div>
				<div class="form-group col-xs-12 col-sm-6 @if(!auth()->user()->can('edit_product_discount_from_sale_screen')) hide @endif">
					<label>@lang('sale.weight')</label>
					{!! Form::text("products[$row_count][weight]", $product->weight, ['class' => 'form-control weight input_number', 'readonly' => 'true']); !!}
				</div>

			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
		</div>
	</div>
</div>