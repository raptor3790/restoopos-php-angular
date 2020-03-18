<?php

global $Options;

$this->Gui->col_width(1, 4);

$this->Gui->add_meta(array(
    'col_id'    =>    1,
    'namespace'    =>    'cashier_performance'
));

ob_start();

echo tendoo_info(__('Affiche les achats réalisées par un client par mois', 'nexo_premium'));

?>
<div class="input-group"> <span class="input-group-addon" id="basic-addon1">
	<?php _e('Veuillez choisir un client', 'nexo_premium');?>
    </span>
    <select name="customer_id" class="form-control chosen-select" multiple>
        <?php if (! empty($customers)):?>
        <?php foreach ($customers as $customer):?>
        <option value="<?php echo $customer[ 'ID' ];?>"><?php echo $customer[ 'NOM' ];?></option>
        <?php endforeach;?>
        <?php else :?>
        <option value="">
        <?php _e('Aucun client disponible', 'nexo_premium');?>
        </option>
        <?php endif;?>
    </select>
</div>
<br />
<form class="form-inline">
    <div class='input-group date' id='datetimepicker6'>
    	<span class="input-group-addon"><?php _e('Date de départ', 'nexo_premium');?></span>
        <input type='text' class="form-control" name="start" value="<?php echo $start_date;?>" />
        <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span>
	</div>
    <div class='input-group date' id='datetimepicker7'>
    	<span class="input-group-addon"><?php _e('Date de fin', 'nexo_premium');?></span>
        <input type='text' class="form-control" name="end" value="<?php echo $end_date;?>" />
        <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span>
	</div>
    <input type="button" class="btn btn-primary trigger_fetch" value="<?php _e('Afficher les résultats', 'nexo_premium');?>" />
</form>
<br />
<div class="box">
</div>
<script type="text/javascript">

"use strict";

var cashiers_names	=	new Array;
<?php foreach ($customers as $customer):?>
	cashiers_names[ <?php echo $customer[ 'ID' ];?> ]	=	'<?php echo $customer[ 'NOM' ];?>';
<?php endforeach;?>

$( document ).ready( function(){
    // Chosen Select
    $( '.chosen-select' ).chosen();
});

// Date Picker
$(function () {
	$('#datetimepicker6').datetimepicker({
		format	:	'YYYY-MM-DD'
	});
	$('#datetimepicker7').datetimepicker({
		useCurrent: false, //Important! See issue #1075
		format	:	'YYYY-MM-DD'
	});
	$("#datetimepicker6").on("dp.change", function (e) {
		$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
	});
	$("#datetimepicker7").on("dp.change", function (e) {
		$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
	});
});

var NexoCashierPerformance	=	new function(){

	this.Nexo_Order_Avance	=	'<?php echo 'nexo_order_advance';?>';
	this.Nexo_Order_Cash			=	<?php echo json_encode( $this->events->apply_filters( 'report_order_types', [ 'nexo_order_comptant' ] ) );?>;
	this.Nexo_Order_Devis	=	'<?php echo 'nexo_order_devis';?>';

	/**
	 * launch function
	**/

	this.GetStats			=	function( customer_id, start_date, end_date ){
		if( customer_id == '' ) {
			bootbox.alert( '<?php echo addslashes(__('Impossible d\'afficher les données pour cette sélection.', 'nexo_premium'));?>' );
			return;
		}

		$.ajax( '<?php echo site_url(array( 'nexo', 'customer_statistics' ));?>/' + start_date + '/' + end_date + '<?php echo store_get_param( '?' );?>', {
			data	:	_.extend( tendoo.csrf_data, _.object( [ 'customer_id' ], [ customer_id ] ) ),
			dataType:	"json",
			type	:	'POST',
			success	:	function( data ){
				NexoCashierPerformance.ShowChart( data );
			},
			error	:	function(){
				bootbox.alert( '<?php echo addslashes(__('Une erreur s\'est produite durant l\'affichage du rapport. Assurez-vous de choisir un bon interval de temps. Il doit y avoir au minimum 1 mois d\'intervale entre les dates.', 'nexo_premium'));?>' );
			}
		});
	};

	/**
	 * Random Hex Color
	 *
	**/

	this.RandHex			=	function(){
		var colors		=	[ '#346b90', '#57aefc', '#001c32', '#939c5b', '#9c5b93', '#5b939c', '#9c645b', '#645b9c', '#5b9c64', '#a2cc61', '#f49ac2', '#bc8dbf', '#8882be', '#7ea7d8', '#6ecff6', '#7bcdc8', '#82ca9d', '#c4df9b', '#fff79a', '#fdc68a', '#f7977a', '#f6989d', '#c6b7b7', '#4f4f4f', '#636363', '#213380', '#384474', '#4f5568', '#66655c', '#7d7650', '#948644', '#ab9638', '#c2a72c', '#d9b720', '#0a238c', '#f0c814', '#b92f1c', '#22e0e0', '#404040', '#480a0d', '#e7e009', '#d5eb7' ];
		var i= Math.floor(Math.random()*colors.length);
		if( i in colors ){
			return colors.splice(i, 1)[0];
		}
		return colors[i];
	};

	/**
	 * show Chart
	 * @param json
	 * @return void
	**/

	this.ShowChart			=	function( data ) {

		// Unexpected shake bug fix
		$( '.box' ).html('<canvas id="chartjs" width="500"></canvas>');

		var chartLabels		=	_.mapObject( _.keys( data ), function( val, key ){
			return moment( val ).format("MMMM YYYY");
		});

		var ChartSet			=	new Array;
		_.each( data, function( value, key ) {
			_.each( value.customers, function( __value, __customer_id ) {
				var amount	=	0;
				// Create first Array
				if( typeof ChartSet[ __customer_id ] == 'undefined' ) {
					ChartSet[ __customer_id ] 			=	new Object;
				}
				// Data
				if( typeof ChartSet[ __customer_id ].data == 'undefined' ) {
					ChartSet[ __customer_id ].data	=	new Array;
				}

				// Count Cash
				if( _.isArray( __value ) ) {
					_.each( __value, function( order, order_key ) {
						// Cash Order only
						if( _.contains( NexoCashierPerformance.Nexo_Order_Cash, order.TYPE ) ) {
							// Fix bug when VAT is not set
							amount	+=	( NexoAPI.ParseFloat( order.TOTAL ) + NexoAPI.ParseFloat( order.TVA == '' ? 0 : order.TVA ) );
						}
					});
				}

				ChartSet[ __customer_id ].label				=	cashiers_names[ __customer_id ];
				ChartSet[ __customer_id ].borderColor		=	NexoCashierPerformance.RandHex();
				ChartSet[ __customer_id ].data.push( amount );
			});
		});

		console.log( ChartSet );

		var CTX				=	document.getElementById("chartjs");
		var myChart 		= new Chart( CTX, {
			type: 'line',
			data: {
				labels: _.values( chartLabels ),
				datasets: _.values( ChartSet )
			},
			options: {
				scales: {
					height	:	5
				}
			}
		});
	};
};

$( document ).ready(function(e) {
   $( '[name="customer_id"]' ).bind( 'change', function(){
		NexoCashierPerformance.GetStats(
			$( this ).val(),
			$( '[name="start"]' ).val(),
			$( '[name="end"]' ).val()
		);
   });

   $( '.trigger_fetch' ).bind( 'click', function(){
	   NexoCashierPerformance.GetStats(
			$( '[name="customer_id"]' ).val(),
			$( '[name="start"]' ).val(),
			$( '[name="end"]' ).val()
	   );
   });
});


</script>
<?php

$this->Gui->add_item(array(
    'type'        =>    'dom',
    'content'    =>    ob_get_clean()
), 'cashier_performance', 1);

$this->Gui->output();
