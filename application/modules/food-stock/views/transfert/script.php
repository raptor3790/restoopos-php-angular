<?php include_once( MODULESPATH . 'nexo/inc/angular/order-list/filters/money-format.php' );?>
<script>
var FoodStockCTRL   =   function( $scope, $http ) {

    <?php if($page === 'edit'):?>
        $scope.order       =   {
            id         : '<?php echo $info[0]['ID']; ?>',
            name       : '<?php echo $info[0]['NAME']; ?>',
            code       : '<?php echo $info[0]['CODE']; ?>',
            uom       :  '<?php echo $info[0]['UOM']; ?>',
            cost       : '<?php echo $info[0]['COST']; ?>',
            qty       : '<?php echo $info[0]['QTY']; ?>'
        };
    <?php else :?>
        $scope.order       =   {
            name       : '',
            code       : '',
            uom       :  '',
            cost       :  '',
            qty       :  ''
        };
    <?php endif ?>

    $scope.ajaxHeader		=	{
		'<?php echo $this->config->item('rest_key_name');?>'	    :	'<?php echo get_option( 'rest_key' );?>'
		// 'Content-Type'											: 	'application/x-www-form-urlencoded'
	}
    /**
     * Submit Stock
     * @return void
    **/

    $scope.canSubmitStock       =   true;

    $scope.addStock      =   function() {

        if( $scope.canSubmitStock == true ) {
            $scope.canSubmitStock   =   false;
        } else {
            return false;
        }

        if( $scope.order.name == '' ) {
            $scope.canSubmitStock       =   true;
            return NexoAPI.Toast()( '<?php echo _s( 'You must provide a name', 'stock-manager' );?>' );
        }

        if( $scope.order.code == '' ) {
            $scope.canSubmitStock       =   true;
            return NexoAPI.Toast()( '<?php echo _s( 'You must provide a code', 'stock-manager' );?>' );
        }

        if( $scope.order.uom == '' ) {
            $scope.canSubmitStock       =   true;
            return NexoAPI.Toast()( '<?php echo _s( 'You must provide a uom', 'stock-manager' );?>' );
        }

        if( $scope.order.cost == '' ) {
            $scope.canSubmitStock       =   true;
            return NexoAPI.Toast()( '<?php echo _s( 'You must provide a cost', 'stock-manager' );?>' );
        }

        if( $scope.order.qty == '' ) {
            $scope.canSubmitStock       =   true;
            return NexoAPI.Toast()( '<?php echo _s( 'You must provide a qty', 'stock-manager' );?>' );
        }

        NexoAPI.Bootbox().confirm( '<?php echo _s( 'Would you like to confirm this transfert ?', 'stock-manager' );?>', function( action ) {
            if( action ) {
                $http({
                    url		        :	'<?php echo site_url( array( 'rest', 'food_stock', 'add_stock' ) );?>',
                    method	        :	'POST',
                    data	        :	$scope.order,
                    headers			:	$scope.ajaxHeader
                }).then(function( response ){
                    NexoAPI.Toast()( '<?php echo _s( 'The stock has been successfully created !', 'stock-manager' );?>' );
                    $scope.order       =   {
                        name       : '',
                        code       : '',
                        uom       :  '',
                        cost       :  '',
                        qty       :  ''
                    };

                    $scope.canSubmitStock   =   true;
                }, function(){
                    $scope.canSubmitStock   =   true;
                });
            } else {
                $scope.canSubmitStock       =   true;
            }
        });
    }

    $scope.updateStock      =   function() {

        if( $scope.canSubmitStock == true ) {
            $scope.canSubmitStock   =   false;
        } else {
            return false;
        }

        if( $scope.order.name == '' ) {
            $scope.canSubmitStock       =   true;
            return NexoAPI.Toast()( '<?php echo _s( 'You must provide a stock', 'stock-manager' );?>' );
        }

        NexoAPI.Bootbox().confirm( '<?php echo _s( 'Would you like to confirm this transfert ?', 'stock-manager' );?>', function( action ) {
            if( action ) {
                $http({
                    url		        :	'<?php echo site_url( array( 'rest', 'food_stock', 'update_stock' ) );?>',
                    method	        :	'POST',
                    data	        :	$scope.order,
                    headers			:	$scope.ajaxHeader
                }).then(function( response ){
                    NexoAPI.Toast()( '<?php echo _s( 'The stock has been successfully updated !', 'stock-manager' );?>' );

                    $scope.canSubmitStock   =   true;
                }, function(){
                    $scope.canSubmitStock   =   true;
                });
            } else {
                $scope.canSubmitStock       =   true;
            }
        });
    }

    // Initial focus
    $( '.barcode-field' ).focus();
}

FoodStockCTRL.$inject       =   [ '$scope', '$http' ];

tendooApp.controller( 'FoodStockCTRL',  FoodStockCTRL );
</script>