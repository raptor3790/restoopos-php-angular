<div class="box" ng-controller="FoodStockCTRL">
    <div class="box-body">
        <form action="" method="POST" name="stockForm" class="ng-pristine ng-valid">
            <div class="form-group">
                <label><?php echo __( 'Ingredient Name', 'nexo' );?></label>
                <input required name="stock_name" type="text" ng-model="order.name" class="form-control"/>
            </div>
            <div class="form-group">
                <label><?php echo __( 'Code', 'nexo' );?></label>
                <input required name="stock_code" ng-model="order.code" class="form-control" type="text"/>
            </div>
            <div class="form-group">
                <label><?php echo __( 'UOM', 'nexo' );?></label>
                <input required name="stock_uom" ng-model="order.uom" class="form-control" type="text"/>
            </div>
            <div class="form-group">
                <label><?php echo __( 'Cost', 'nexo' );?></label>
                <input required name="stock_cost" ng-model="order.cost" class="form-control" type="text"/>
            </div>
            <div class="form-group">
                <label><?php echo __( 'Qty', 'nexo' );?></label>
                <input required name="stock_qty" ng-model="order.qty" class="form-control" type="text"/>
            </div>
        </form>
    </div>

    <div class="box-footer text-center">
        <?php if ($page ==='add'):?>
            <button type="button" ng-click="addStock()" class="btn btn-primary"><?php echo __( 'Add', 'food-stock' );?></button>
        <?php elseif ($page === 'edit'):?>
            <button type="button" ng-click="updateStock()" class="btn btn-primary"><?php echo __( 'Update', 'food-stock' );?></button>
        <?php endif; ?>
    </div>
</div>
<style>
.list-class {
    z-index:999;
}

[name=stockForm] {
    padding: 10px 10px 0px 10px;
}
</style>
