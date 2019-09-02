<div class="modal-dialog modal-lg" role="document">
  <div class="modal-content">
  @php
    $form_id = 'contact_add_form';
    if(isset($quick_add)){
    $form_id = 'quick_add_contact';
    }
  @endphp
    {!! Form::open(['url' => action('BankController@store'), 'method' => 'post', 'id' => $form_id ]) !!}

    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h4 class="modal-title">@lang('contact.add_bank')</h4>
    </div>

    <div class="modal-body">
      <div class="row">

      <div class="col-md-5">
        <div class="form-group">
            {!! Form::label('name', __('contact.name') . ':*') !!}
                {!! Form::text('name', null, ['class' => 'form-control','placeholder' => __('contact.name'), 'required']); !!}
        </div>
      </div>

          <div class="col-md-4">
              <div class="form-group">
              {!! Form::label('opening_balance', __('contact.op_bal') . ':*') !!}
              {!! Form::text('opening_balance', null, ['class' => 'form-control','maxlength'=>'13',
              'placeholder' => __('contact.op_bal'), 'required']); !!}
              </div>
          </div>

          <div class="col-md-3">
              <div class="form-group">
              {!! Form::label('type', __('contact.type') . ':*') !!}
                  {{--{!! Form::select('type', null , ['class' => 'form-control', 'id' => 'type','placeholder' => __('messages.please_select'), 'required']); !!}--}}
                  {{Form::select('type', array('1' => 'Credit', '2' => 'Debit'), '0',['class' => 'form-control', 'id' => 'type','placeholder' => __('messages.please_select'), 'required'])}}
              </div>
          </div>
      <div class="clearfix"></div>

    </div>
    </div>
    <div class="modal-footer">
      <button type="submit" class="btn btn-primary">@lang( 'messages.save' )</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
    </div>

    {!! Form::close() !!}
  
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->