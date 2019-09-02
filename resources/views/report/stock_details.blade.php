@extends('layouts.app')
@section('title', __('report.stock_report'))

@section('content')

	<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>{{ __('report.stock_report')}}</h1>
</section>

<div class="row">
	<div class="col-md-10 col-md-offset-1 col-xs-12">
		<div class="table-responsive">
			<table class="table table-bordered table-condensed bg-gray">
				<tr>
					<th>#</th>
					<th>SKU</th>
					<th>@lang('business.product')</th>
{{--					<th>@lang('report.current_stock')</th>--}}
					<th>@lang('report.opening_stock')</th>
					<th>@lang('report.ton')</th>
					<th>@lang('report.purchase')</th>
					<th>@lang('report.ton')</th>
					<th>@lang('report.sale_return')</th>
					<th>@lang('report.ton')</th>
					<th>@lang('report.total')</th>
					<th>@lang('report.ton')</th>
					<th>@lang('report.sale')</th>
					<th>@lang('report.ton')</th>
					<th>@lang('report.rem_stock')</th>
					<th>@lang('report.ton')</th>
					{{--<th>@lang('report.transfer')</th>--}}
					{{--<th>@lang('report.ton')</th>--}}
{{--					<th>@lang('report.closing_stock')</th>--}}
					<th>@lang('report.closing_stock')</th>
					<th>@lang('report.ton')</th>
					<th>@lang('report.unit_price')</th>
					<th>@lang('report.current_value_stock')</th>
				</tr>
{{--				@php print_r($product_details); @endphp--}}
				@foreach( $product_details as $details )
					<tr>
						<td>{{ $loop->iteration }}</td>
						<td>{{ $details->sku}}</td>
						<td>{{ $details->product}}</td>
						<td>{{ $details->opening_stock}}</td>
						<td>@php
								if($details->unitid==3){
									echo ($details->opening_stock * $details->weight)/1000;
                                }else if($details->unitid==6){
									echo ($details->opening_stock * $details->weight)/1090;
                                }
							@endphp
						</td>
						<td>{{ $details->purchase}}</td>
						<td>@php
								if($details->unitid==3){
									echo ($details->purchase * $details->weight)/1000;
                                }else if($details->unitid==6){
									echo ($details->purchase * $details->weight)/1090;
                                }
							@endphp
						</td>
						<td>{{ $details->total_adjusted}}</td>
						<td>@php
								if($details->unitid==3){
									echo ($details->total_adjusted * $details->weight)/1000;
                                }else if($details->unitid==6){
									echo ($details->total_adjusted * $details->weight)/1090;
                                }
							@endphp
						</td>
						<td>@php echo $total = $details->opening_stock + $details->purchase + $details->total_adjusted; @endphp</td>
						<td>@php
								if($details->unitid==3){
									echo ($total * $details->weight)/1000;
                                }else if($details->unitid==6){
									echo ($total * $details->weight)/1090;
                                }
							@endphp
						</td>
						<td>{{ $details->total_sold}}</td>
						<td>@php
								if($details->unitid==3){
									echo ($details->total_sold * $details->weight)/1000;
                                }else if($details->unitid==6){
									echo ($details->total_sold * $details->weight)/1090;
                                }
							@endphp
						</td>
						<td>@php echo $rem_total = $total - $details->total_sold; @endphp</td>
						<td>@php
								if($details->unitid==3){
									echo ($rem_total * $details->weight)/1000;
                                }else if($details->unitid==6){
									echo ($rem_total * $details->weight)/1090;
                                }
							@endphp
						</td>
						{{--<td>{{ $details->total_transfered}}</td>--}}
						{{--<td>{{ $details->total_transfered/1000}}</td>--}}
{{--						<td>{{ $details->closing_stock}}</td>--}}
						<td>{{ ($details->opening_stock + $details->purchase + $details->total_adjusted) - ($details->total_sold + $details->total_transfered)}}</td>
						<td>{{ (($details->opening_stock + $details->purchase + $details->total_adjusted) - ($details->total_sold + $details->total_transfered))/1000}}</td>
						<td>{{ $details->unit_price }}</td>
						<td>{{ $details->unit_price * $rem_total }}</td>
					</tr>
				@endforeach
			</table>
		</div>
	</div>
</div>

@endsection