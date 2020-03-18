<link rel="stylesheet" href="<?php echo module_url('nexo') . 'DataTables/datatables.min.css';?>" />
<style>
    #stock_list tr {
        cursor: pointer;
    }

    #stock_list tr.active td{
        background-color: #002a80;
        color: white;
    }

    #stock_item_list .action_col {
        width: 30%;
    }

    #stock_item_list .action_col span{
        margin-right: 5px;
    }

    .action_btn {
        width: 80px;
        margin-right: 20px;
    }
</style>
<div class="row">
    <div class="col-md-6">
        <table id="stock_item_list" class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>UOM</th>
                <th>Qty</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($stock_items as $c):?>
                <tr data-item-id="<?php echo $c['STOCK_ID'];?>" data-item-pid="<?php echo $c['ID'];?>">
                    <td><?php echo $c['NAME'];?></td>
                    <td><?php echo $c['UOM'];?></td>
                    <td><?php echo $c['QUANTITY'];?></td>
                    <td class="action_col">
                        <span class="fa fa-plus btn btn-primary ls_plus_item_button"></span><span class="fa fa-minus btn btn-warning ls_minus_item_button"></span><span class="fa fa-remove btn btn-danger ls_remove_item_button"></span>
                    </td>
                </tr>
            <?php endforeach;?>
            </tbody>
        </table>
    </div>

    <div class="col-md-6">
        <div class="row">
            <div class="col-md-12 form-group text-right">
                <button type="button" class="btn btn-primary ls_add_button">Add</button>
            </div>
        </div>
        <table id="stock_list" class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Name</th>
                <th>UOM</th>
                <th>Qty</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($stocks as $c):?>
                <tr class="clickable-row" data-item-id="<?php echo $c['ID'];?>">
                    <td><?php echo $c['NAME'];?></td>
                    <td><?php echo $c['UOM'];?></td>
                    <td><?php echo $c['QTY'];?></td>
                    <td><?php echo $c['COST'];?></td>
                </tr>
            <?php endforeach;?>
            </tbody>
        </table>
    </div>

    <div class="text-center">
        <button type="button" class="btn btn-primary action_btn" id="id_btn_save_items">Save</button>
        <a class="btn btn-warning action_btn" href="<?php echo site_url(['dashboard', 'nexo', 'produits' , 'lists']);?>">To List</a>
    </div>

</div>
<script src="<?php echo module_url('nexo') . 'DataTables/datatables.min.js';?>"></script>
<script>
    $('#stock_list').on('click', '.clickable-row', function(event) {
        $(this).addClass('active').siblings().removeClass('active');
    });
    $(function(){
        var canSubmit = true;
        var cur_article_id = "<?php echo $article_id?>";
        $('#stock_list').DataTable();
        $('.ls_add_button').on('click', function(event){
            if( canSubmit == true ) {
                canSubmit   =   false;
            } else {
                NexoAPI.Toast()( '<?php echo _s( 'Other thread processing!', 'product-item' );?>' );
                return false;
            }
            var postData = {};
            var rowObject = $('#stock_list tr.active');
            if(rowObject !== null) {
                var item_exist = $('#stock_item_list tr[data-item-id=' + rowObject.attr('data-item-id') + ']');
                if( item_exist.html() === undefined){
                    postData['ARTICLES_ID'] = cur_article_id;
                    postData['STOCK_ID'] = rowObject.attr('data-item-id');
                    postData['QUANTITY'] = 1;

                    $.ajax({
                        url :' <?php echo site_url([ 'rest', 'nexo', 'food_stock_item_add' ]);?>',
                        type : 'POST',
                        data : {item: postData},
                        beforeSend: function(){
                            $this.ui.loader.start();
                        },
                        success	:	function(data){
                            canSubmit = true;
                            if( typeof callback !== 'undefined' ) {
                                callback();
                            }
                            domTr = '<tr data-item-id="' + rowObject.attr('data-item-id')
                                + '" data-item-pid="' + data + '">'
                                + '<td>' + rowObject.children('td:first').html() + '</td>'
                                + '<td>' + rowObject.children('td:nth(1)').html() + '</td><td>1</td>'
                                + '<td class="action_col"><span class="fa fa-plus btn btn-primary ls_plus_item_button"></span>'
                                + '<span class="fa fa-minus btn btn-warning ls_minus_item_button"></span>'
                                + '<span class="fa fa-remove btn btn-danger ls_remove_item_button"></span></td>'
                                + '</tr>';
                            $('#stock_item_list tr:last').after(domTr);

                            NexoAPI.Toast()( '<?php echo _s( 'Added successfully!', 'product-item' );?>' );
                        },
                        error: function(e){
                            canSubmit = true;
                        }
                    });
                }else{
                    NexoAPI.Toast()( '<?php echo _s( 'That item is exsit already!', 'product-item' );?>' );
                    canSubmit = true;
                }
            }else{
                canSubmit = true;
            }
        });

        $('#id_btn_save_items').on('click', function(){
            if( canSubmit == true ) {
                canSubmit   =   false;
            } else {
                NexoAPI.Toast()( '<?php echo _s( 'Other thread processing!', 'product-item' );?>' );
                return false;
            }
            postData = Array();
            $('#stock_item_list tr:not(:first)').each(function(i, v){
                postData[i] = {};
                postData[i]['ID'] = $(this).attr('data-item-pid');
                postData[i]['ARTICLES_ID'] = cur_article_id;
                postData[i]['STOCK_ID'] = $(this).attr('data-item-id');
                postData[i]['QUANTITY'] = $(this).children('td:eq(2)').html();;
            });

            console.log(postData);

            $.ajax({
                url :' <?php echo site_url([ 'rest', 'nexo', 'food_stock_item_update' ]);?>',
                type : 'POST',
                data : {items: postData},
                beforeSend: function(){
                    $this.ui.loader.start();
                },
                success	:	function(data){
                    canSubmit = true;
                    if( typeof callback !== 'undefined' ) {
                        callback();
                    }
                    NexoAPI.Toast()( '<?php echo _s( 'Saved successfully!', 'product-item' );?>' );
                },
                error: function(data){
                    canSubmit = true;
                    NexoAPI.Toast()( '<?php echo _s( 'Save failed!', 'product-item' );?>' );
                }
            });
        });

        $('#stock_item_list').on('click', 'span.ls_plus_item_button', function() {
            // do something
            qtyObject = $(this).parents('tr').children('td:nth(2)');
            curQty = qtyObject.html();
            curQty = parseInt(curQty, 10) + 1;
            qtyObject.html(curQty);
        });

        $('#stock_item_list').on('click', '.ls_minus_item_button', function(){
            qtyObject = $(this).parents('tr').children('td:nth(2)');
            curQty = parseInt(qtyObject.html());
            if(curQty > 1){
                curQty = parseInt(curQty, 10) - 1;
                qtyObject.html(curQty);
            }
        });

        $('#stock_item_list').on('click', 'span.ls_remove_item_button', function(){
            if( canSubmit == true ) {
                canSubmit   =   false;
            } else {
                NexoAPI.Toast()( '<?php echo _s( 'Other thread processing!', 'product-item' );?>' );
                return false;
            }
            var curObj = $(this).parents('tr');
            $.ajax({
                url :' <?php echo site_url([ 'rest', 'nexo', 'food_stock_item_remove' ]);?>',
                type : 'POST',
                data : {item_id: curObj.attr('data-item-pid')},
                beforeSend: function(){
                    $this.ui.loader.start();
                },
                success	:	function(data){
                    canSubmit = true;
                    if( typeof callback !== 'undefined' ) {
                        callback();
                    }
                    NexoAPI.Toast()( '<?php echo _s( 'Removed successfully !', 'product-item' );?>' );
                    curObj.remove()
                },
                error: function(data){
                    canSubmit = true;
                    NexoAPI.Toast()( '<?php echo _s( 'Remove failed !', 'product-item' );?>' );
                }
            });

        });

        $()
    });
</script>
