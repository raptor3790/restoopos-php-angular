<div id="qty_dlg" class="modal" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <input type="hidden" name="item_id" id="item_id_val"/>
                <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true"
                        style="margin-top: -10px;">×
                </button>
                <div class="bootbox-body">
                    <div id="discount-box-wrapper">
                        <h4 class="text-center">Modify Qty<span class="discount_type"></span>
                        </h4>
                        <br>

                        <div class="row input-group-lg">
                            <div class="col-md-2 text-right">
                                <label>Qty:</label>
                            </div>
                            <div class="col-md-9">
                                <input id="qty_num" type="number" name="discount_value" class="form-control"
                                       placeholder="Enter Qty of modify">
                            </div>
                        </div>
                        <br>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel_qty_dlg" data-bb-handler="cancel" type="button" class="btn btn-default">Cancel</button>
                <button id="submit_qty_dlg" data-bb-handler="confirm" type="button" class="btn btn-primary">OK</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('body').on('click', 'a.fa-plus.crud-action', function (e) {
            e.preventDefault();
            $('#qty_dlg').modal();
            $('#qty_num').val(0);
            $('#item_id_val').val($(this).attr('data-item-id'));
        });

        $('#cancel_qty_dlg').on('click', function(){
            $('#qty_dlg').modal('hide');
        })

        var canSubmit = true;
        $('#submit_qty_dlg').on('click', function(){
            if(canSubmit == true){
                canSubmit = false;
            }else{
                NexoAPI.Toast()( '<?php echo _s( 'Other thread processing!', 'product-item' );?>' );
                return false;
            }
            $('#qty_dlg').modal('hide');
            $.ajax({
                url :' <?php echo site_url([ 'rest', 'food_stock', 'increase_stock' ]);?>',
                type : 'POST',
                data : {qty: $('#qty_num').val(), id: $('#item_id_val').val()},
                beforeSend: function(){
                    $this.ui.loader.start();
                },
                success	:	function(data){
                    canSubmit = true;
                    if( typeof callback !== 'undefined' ) {
                        callback();
                    }
                    $('#ajax_refresh_and_loading').trigger('click')
                    NexoAPI.Toast()( '<?php echo _s( 'Saved successfully!', 'product-item' );?>' );
                },
                error: function(data){
                    canSubmit = true;
                    NexoAPI.Toast()( '<?php echo _s( 'Save failed!', 'product-item' );?>' );
                }
            });
        })
    });
</script>