<!-- business information here -->

<div class="row" style="padding: 1px;">

	<!-- Logo -->
	@if(!empty($receipt_details->logo))
		<img src="{{$receipt_details->logo}}" class="img img-responsive center-block">
	@endif

<!-- Header text -->
	@if(!empty($receipt_details->header_text))
		<div class="col-xs-12">
			{!! $receipt_details->header_text !!}
		</div>
@endif

<!-- business information here -->
	<div class="col-xs-12 text-center">
		<h2 class="text-center">
			<!-- Shop & Location Name  -->
			@if(!empty($receipt_details->display_name))
				{{$receipt_details->display_name}}
			@endif
		</h2>

		<!-- Address -->
		<p>
			@if(!empty($receipt_details->address))
				<small class="text-center">
					{!! $receipt_details->address !!}
				</small>
			@endif
			@if(!empty($receipt_details->contact))
				<br/>{{ $receipt_details->contact }}
			@endif
			@if(!empty($receipt_details->contact) && !empty($receipt_details->website))
				,
			@endif
			@if(!empty($receipt_details->website))
				{{ $receipt_details->website }}
			@endif
			@if(!empty($receipt_details->location_custom_fields))
				<br>{{ $receipt_details->location_custom_fields }}
			@endif
		</p>
		<p>
			@if(!empty($receipt_details->sub_heading_line1))
				{{ $receipt_details->sub_heading_line1 }}
			@endif
			@if(!empty($receipt_details->sub_heading_line2))
				<br>{{ $receipt_details->sub_heading_line2 }}
			@endif
			@if(!empty($receipt_details->sub_heading_line3))
				<br>{{ $receipt_details->sub_heading_line3 }}
			@endif
			@if(!empty($receipt_details->sub_heading_line4))
				<br>{{ $receipt_details->sub_heading_line4 }}
			@endif
			@if(!empty($receipt_details->sub_heading_line5))
				<br>{{ $receipt_details->sub_heading_line5 }}
			@endif
		</p>
		<p>
			@if(!empty($receipt_details->tax_info1))
				<b>{{ $receipt_details->tax_label1 }}</b> {{ $receipt_details->tax_info1 }}
			@endif

			@if(!empty($receipt_details->tax_info2))
				<b>{{ $receipt_details->tax_label2 }}</b> {{ $receipt_details->tax_info2 }}
			@endif
		</p>

		<!-- Title of receipt -->
		@if(!empty($receipt_details->invoice_heading))
			<h3 class="text-center">
				{!! $receipt_details->invoice_heading !!}
			</h3>
	@endif

	<!-- Invoice  number, Date  -->
		<p style="width: 100% !important" class="word-wrap">
			<span class="pull-left text-left word-wrap">
				@if(!empty($receipt_details->invoice_no_prefix))
					<b>{!! $receipt_details->invoice_no_prefix !!}</b>
				@endif
				{{$receipt_details->invoice_no}}

			<!-- Table information-->
				@if(!empty($receipt_details->table_label) || !empty($receipt_details->table))
					<br/>
					<span class="pull-left text-left">
						@if(!empty($receipt_details->table_label))
							<b>{!! $receipt_details->table_label !!}</b>
					@endif
					{{$receipt_details->table}}

					<!-- Waiter info -->
					</span>
				@endif

			<!-- customer info -->
				@if(!empty($receipt_details->customer_info))
					<br/>
					<b>{{ $receipt_details->customer_label }}</b> {!! $receipt_details->customer_info !!}
				@endif
				@if(!empty($receipt_details->client_id_label))
					<br/>
					<b>{{ $receipt_details->client_id_label }}</b> {{ $receipt_details->client_id }}
				@endif
				@if(!empty($receipt_details->customer_tax_label))
					<br/>
					<b>{{ $receipt_details->customer_tax_label }}</b> {{ $receipt_details->customer_tax_number }}
				@endif
				@if(!empty($receipt_details->customer_custom_fields))
					<br/>{!! $receipt_details->customer_custom_fields !!}
				@endif
				@if(!empty($receipt_details->sales_person_label))
					<br/>
					<b>{{ $receipt_details->sales_person_label }}</b> {{ $receipt_details->sales_person }}
				@endif
			</span>

			<span class="pull-right">
				<b>{{$receipt_details->date_label}}</b> {{$receipt_details->invoice_date}}
			</span>
		</p>
	</div>
	<!-- /.col -->
</div>


<div class="row">
	<div class="col-xs-12">
		<table class="table table-responsive">
			<thead>
			<tr>
				<th>{{$receipt_details->table_product_label}}</th>
				<th>{{$receipt_details->table_qty_label}}</th>
				{{--					<th>{{$receipt_details->table_unit_price_label}}</th>--}}
				{{--					<th>{{$receipt_details->table_subtotal_label}}</th>--}}
				<th>{{$receipt_details->table_unit_price_tax_label}}</th>
				<th>{{$receipt_details->tax_label}}</th>
				<th>{{$receipt_details->table_subtotal_label_tax}}</th>
				<th>{{$receipt_details->product_to}}</th>
				<th>{{$receipt_details->product_ato}}</th>
				<th>{{$receipt_details->line_discount_label}}</th>
			</tr>
			</thead>
			<tbody>
			@php $total_to = 0;$total_ato = 0;$total_product_discount = 0; @endphp
			@forelse($receipt_details->lines as $line)
				<tr>
					<td>
						{{$line['name']}}
					</td>
					<td>{{$line['quantity']}} </td>
					{{--						<td>{{$line['unit_price_exc_tax']}}</td>--}}
					{{--						<td>{{$line['price_exc_tax']}}</td>--}}
					<td>{{$line['unit_price_inc_tax']}}</td>
					<td>{{$line['tax']}}</td>
					<td>{{$line['line_total']}}</td>
					<td>{{$line['product_to']}}</td>
					<td>{{$line['product_ato']}}</td>
					<td>{{$line['line_discount_amount']}}</td>
				</tr>
				@php $total_to = $total_to + ($line['quantity'] * $line['weight'] * $line['product_to']);
				 $total_ato = $total_ato + ($line['quantity'] * $line['weight'] * $line['product_ato']);
				 $total_product_discount = $total_product_discount + ($line['quantity'] * $line['weight'] * $line['line_discount_amount']); @endphp
				@if(!empty($line['modifiers']))
					@foreach($line['modifiers'] as $modifier)
						<tr>
							<td>
								{{$modifier['name']}} {{$modifier['variation']}}
								@if(!empty($modifier['sub_sku'])), {{$modifier['sub_sku']}} @endif @if(!empty($modifier['cat_code'])), {{$modifier['cat_code']}}@endif
								@if(!empty($modifier['sell_line_note']))({{$modifier['sell_line_note']}}) @endif
							</td>
							<td>{{$modifier['quantity']}} {{$modifier['units']}} </td>
							<td>{{$modifier['unit_price_inc_tax']}}</td>
							<td>{{$modifier['line_total']}}</td>
						</tr>
					@endforeach
				@endif
			@empty
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
			@endforelse
			</tbody>
		</table>
	</div>
</div>

<div class="row">


	<div class="col-xs-6">

		<table class="table table-condensed">

			@if(!empty($receipt_details->payments))
				@foreach($receipt_details->payments as $payment)
					<tr>
						<td>{{$payment['method']}}</td>
						<td>{{$payment['amount']}}</td>
						<td>{{$payment['date']}}</td>
					</tr>
				@endforeach
			@endif

		<!-- Total Paid-->
			@if(!empty($receipt_details->total_paid))
				<tr>
					<th>
						&nbsp;
					</th>
					<th>
						{!! $receipt_details->total_paid_label !!}
					</th>
					<td>
						{{$receipt_details->total_paid}}
					</td>
				</tr>
			@endif

		<!-- Total Due-->
			@if(!empty($receipt_details->total_due))
				<tr>
					<th>
						{!! $receipt_details->total_due_label !!}
					</th>
					<td>
						{{$receipt_details->total_due}}
					</td>
				</tr>
			@endif
		</table>

		{{$receipt_details->additional_notes}}
	</div>

	<div class="col-xs-6">
		<div class="table-responsive">
			<table class="table">
				<tbody>
				<tr>
					<th style="width:70%">
						{!! $receipt_details->subtotal_label !!}
					</th>
					<td>
						{{$receipt_details->subtotal}}
					</td>
				</tr>
				<tr>
					<th style="width:70%">
						Total TO
					</th>
					<td>
						Rs {{number_format($total_to,2)}}
					</td>
				</tr>
				<tr>
					<th style="width:70%">
						Total ATO
					</th>
					<td>
						Rs {{number_format($total_ato,2)}}
					</td>
				</tr>
				<tr>
					<th style="width:70%">
						Total Discount
					</th>
					<td>
						Rs {{number_format($total_product_discount,2)}}
					</td>
				</tr>

				<!-- Shipping Charges -->
				@if(!empty($receipt_details->shipping_charges))
					<tr>
						<th style="width:70%">
							{!! $receipt_details->shipping_charges_label !!}
						</th>
						<td>
							{{$receipt_details->shipping_charges}}
						</td>
					</tr>
				@endif

				<!-- Discount -->
				@if( !empty($receipt_details->discount) )
					<tr>
						<th>
							{!! $receipt_details->discount_label !!}
						</th>

						<td>
							(-) {{$receipt_details->discount}}
						</td>
					</tr>
				@endif

				<!-- Tax -->
				@if( !empty($receipt_details->tax) )
					<tr>
						<th>
							{!! $receipt_details->tax_label !!}
						</th>
						<td>
							(+) {{$receipt_details->tax}}
						</td>
					</tr>
				@endif

				<!-- Total -->
				<tr>
					<th>
						{!! $receipt_details->total_label !!}
					</th>
					<td>
						{{$receipt_details->total}}
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

@if($receipt_details->show_barcode)
	<div class="row">
		<div class="col-xs-12">
			{{-- Barcode --}}
			<img class="center-block" src="data:image/png;base64,{{DNS1D::getBarcodePNG($receipt_details->invoice_no, 'C128', 2,30,array(39, 48, 54), true)}}">
		</div>
	</div>
@endif

@if(!empty($receipt_details->footer_text))
	<div class="row">
		<div class="col-xs-12">
			{!! $receipt_details->footer_text !!}
		</div>
	</div>
@endif