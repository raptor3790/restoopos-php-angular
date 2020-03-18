<?php global $Options,$NexoEditScreen;?>
<script type="text/javascript">

"use strict";

/**
 * Server Time
 * @since 2.5.5
**/

var	Nexo_Server_Time	=	'<?php echo date_now();?>';
var Nexo_Moment			=	moment( Nexo_Server_Time );

/** 
 * Filters
 * Filters for NexoPOS checkout
**/

NexoAPI.events.addFilter( 'nexo_customer_dom_popup', function( value ) {
	return '<form id="NewClientForm" method="POST">' +
				'<?php echo tendoo_warning(addslashes(__('Toutes les autres informations comme la "date de naissance" pourront être remplis ultérieurement.', 'nexo')));?>' +
			'<div class="form-group">'+
				'<div class="input-group">' +
				  '<span class="input-group-addon" id="basic-addon1"><?php echo addslashes(__('Nom du client', 'nexo'));?></span>'+
				  '<input type="text" class="form-control" placeholder="<?php echo addslashes(__('Name', 'nexo'));?>" name="customer_name" aria-describedby="basic-addon1">' +
				'</div>'+
			'</div>' +
			'<div class="form-group">'+
				'<div class="input-group">' +
				  '<span class="input-group-addon" id="basic-addon1"><?php echo addslashes(__('Prénom du client', 'nexo'));?></span>'+
				  '<input type="text" class="form-control" placeholder="<?php echo addslashes(__('Prénom', 'nexo'));?>" name="customer_surname" aria-describedby="basic-addon1">' +
				'</div>'+
			'</div>' +
			'<div class="form-group">'+
				'<div class="input-group">' +
				  '<span class="input-group-addon" id="basic-addon1"><?php echo addslashes(__('Email du client', 'nexo'));?></span>'+
				  '<input type="text" class="form-control" placeholder="<?php echo addslashes(__('Email', 'nexo'));?>" name="customer_email" aria-describedby="basic-addon1">' +
				'</div>'+
			'</div>' +
			'<div class="form-group">'+
				'<div class="input-group">' +
				  '<span class="input-group-addon" id="basic-addon1"><?php echo addslashes(__('Téléphone du client', 'nexo'));?></span>'+
				  '<input type="text" class="form-control" placeholder="<?php echo addslashes(__('Téléphone', 'nexo'));?>" name="customer_tel" aria-describedby="basic-addon1">' +
				'</div>'+
			'</div>' +
		'</form>' + value;
});


var inFormOrLink;

if( typeof NexoScreen == 'undefined' ) {
	var NexoScreen			=	'new';
}

if( typeof NexoCurrentClient	== 'undefined' ){
	var NexoCurrentClient	=	0;
}

var	NexoCommandes			=	new function(){
	
	/**
	 * .GetProduct
	 * get product from store
	 * @return void
	**/
	
	this.GetProduct						=	function( product_code ){
		$.ajax( tendoo.site_url  + 'nexo/item/' + product_code + '/CODEBAR',{
			success	:	function( a ){
				NexoCommandes.TreatProduct(a);
			}, 
			error 	:	function(){
				bootbox.alert( '<?php _e('Cet article est introuvable ou le code est incorrect.', 'nexo');?>' );
				NexoCommandes.Sound(2);
			}
		});
	};
	
	/**
	 * .TreatProduct
	 * Parse JSON returned and add it to cart
	 * @return void
	**/
	
	this.TreatProduct					=	function( product ) {
		if( product.length > 0 ) {

			// Si la quantité du produit est supérieure à 0;
			if( parseInt( product[0].QUANTITE_RESTANTE ) > 0 ) {
				if( typeof( this.CommandCart[ product[0].CODEBAR ] ) != 'undefined' ) { // Si le produit a déjà été ajouté au manier
					// Si la quantité du produit dans le panier est inférieure ou égale a la quanité restante
					if( this.CommandCart[ product[0].CODEBAR ][0].ADDED_TO_CART < parseInt( this.CommandCart[ product[0].CODEBAR ][0].QUANTITE_RESTANTE ) ) {
						this.CommandCart[ product[0].CODEBAR ][0].ADDED_TO_CART++;  // incremente la quantité du produit
						this.RefreshCart();
					} else {
						bootbox.alert( "<?php _e('Impossible d\'ajouter cet article, car le stock vient de s\'épuiser.', 'nexo');?>" );
						this.Sound(2);
					}

				} else {
					this.CommandCart[ product[0].CODEBAR ] = product;
					this.CommandCart[ product[0].CODEBAR ][0].ADDED_TO_CART	=	1;
					this.RefreshCart();
				}

			} else {
				bootbox.alert( "<?php _e('Impossible d\'ajouter cet article, car le stock est épuisé.', 'nexo');?>" );
				this.Sound(2);
			}
		} else {
			bootbox.alert( '<?php _e('Cet article est introuvable ou le code est incorrect.', 'nexo');?>' );
			this.Sound(2);
		}
	};
	
	/**
	 * .HasProducts
	 * Checks whether the cart has a products or not
	 * @return bool
	**/
	
	this.HasProducts					=	function(){
		return Object.keys( this.CommandCart ).length > 0 ? true : false;
	};

	/**
	 * .RefreshCart
	 * Refresh product added to cart
	 * @return void
	**/

	this.RefreshCart					=	function(){
		this.DisplayEmptyCart();
		// Seulement lorsque le panier n'est pas vide on retire la notice "c
		if( Object.keys( this.CommandCart ).length > 0 ){
			this.RemoveEmptyCart();
		}
		// Ajout du parent
		// $('.Nexo-cart-table tbody').html('<tr class="Nexo-cart-content"/>' );
		_.each( this.CommandCart, function( value, key ){
			
			// @since 2.5.6 check if promo price is enabled
			var Product_Promo_Start_Obj		=	moment( value[0].SPECIAL_PRICE_START_DATE ).startOf( 'day' );
			var Product_Promo_End_Obj		=	moment( value[0].SPECIAL_PRICE_END_DATE ).endOf( 'day' );
			var Class						=	'';
			
			// Default promo price
			var PrixDeVente					=	parseInt( value[0].PRIX_DE_VENTE );
			var PrixDeVenteString			=	NexoAPI.Format( PrixDeVente );
			var PrixDeVenteTotal			=	parseInt( value[0].PRIX_DE_VENTE ) * value[0].ADDED_TO_CART;
			var PrixDeVenteTotalString		=	NexoAPI.Format( PrixDeVenteTotal );
			// If promo price is valid
			if( Product_Promo_Start_Obj.isValid() ) {
				// if promo price is enabled
				if( Product_Promo_End_Obj.isAfter( Nexo_Server_Time, 'minutes' ) && Product_Promo_Start_Obj.isBefore( Nexo_Server_Time, 'minutes' ) ) {
					PrixDeVente				=	parseInt( value[0].PRIX_PROMOTIONEL );
					PrixDeVenteString		=	NexoAPI.Format( PrixDeVente ) + ' <small><strike>' + NexoAPI.Format( parseInt( value[0].PRIX_DE_VENTE ) ) + '</strike></small>';			
					PrixDeVenteTotal		=	PrixDeVente * parseInt( value[0].ADDED_TO_CART );
					PrixDeVenteTotalString	=	NexoAPI.Format( PrixDeVenteTotal ) + ' <small><strike>' + NexoAPI.Format( parseInt( value[0].PRIX_DE_VENTE ) * value[0].ADDED_TO_CART ) + '</strike></small>';	
					Class					=	'class="info"';
				}
			}
			
			var ReduceButtons				=	( NexoCommandes.DisplayReduceButtons	) ? 
				'<td><a href="javascript:void(0);" class="btn-primary btn btn-xs Nexo-cart-reduce"><?php echo _e('Retirer', 'nexo');?></a> - <a href="javascript:void(0);" class="btn-warning btn btn-xs Nexo-cart-add"><?php echo _e('Ajouter', 'nexo');?></a></td>' : '';
			
			$('.Nexo-cart-table tbody').append(
			'<tr data-item-codebar="' + value[0].CODEBAR + '" ' + Class + '>' +
				'<td>' + value[0].DESIGN + '</td>' +
				'<td>' + PrixDeVenteString + '</td>' +
				'<td>' + value[0].ADDED_TO_CART + '</td>' +
				'<td>' + PrixDeVenteTotalString + '</td>' +
				ReduceButtons + 
			'</tr>'
			);
		});
		// RefreshCart
		this.RefreshCartValue();
		this.BindReduceEffect();
	}

	/**
	 * .DisplayEmptyCart
	 * Display a notice if the cart is empty
	 * @return void
	**/

	this.DisplayEmptyCart				=	function(){
		$('.Nexo-cart-table tbody').html('<tr class="cart-empty"><td colspan="5"><?php echo addslashes(__('Aucun article n\'a été ajouté au panier', 'nexo'));?></td></tr>');
	}

	/**
	 * .RemoveEmptyCart
	 * Remove notice for empty cart
	 * @return void
	**/

	this.RemoveEmptyCart				=	function(){
		$('.Nexo-cart-table tbody').find('.cart-empty').remove();
	}

	/**
	 * .RefrshCartValue
	 * Refresh cart prices
	 * @return void
	**/	 

	this.RefreshCartValue				=	function(){
		
		// Réinitialisation de la valeur du panier
		var	__CartValue				=	0;
		_.each( this.CommandCart, function( value, key ) {
			// @since 2.5.6
			var Product_Promo_Start_Obj		=	moment( value[0].SPECIAL_PRICE_START_DATE ).startOf( 'day' );
			var Product_Promo_End_Obj		=	moment( value[0].SPECIAL_PRICE_END_DATE ).endOf( 'day' );
			var CurrentValue				=	( parseInt( value[0].ADDED_TO_CART ) * parseInt( value[0].PRIX_DE_VENTE ) );

			// Check if Special Price is enabled
			if( Product_Promo_Start_Obj.isValid() ) {
				// if promo price is enabled
				if( Product_Promo_End_Obj.isAfter( Nexo_Server_Time, 'minutes' ) && Product_Promo_Start_Obj.isBefore( Nexo_Server_Time, 'minutes' ) ) {
					CurrentValue			=	( parseInt( value[0].ADDED_TO_CART ) * parseInt( value[0].PRIX_PROMOTIONEL ) )
				}
			}
			__CartValue						+=	CurrentValue;
		});
		
		this.CartValue				=	__CartValue;
		this.ApplyPercentDiscount();
		
		$( '.Nexo-cart-total-price' ).html( NexoAPI.Format( this.CartValue ) );
		$( '.Nexo-cart-global-charge' ).html( NexoAPI.Format( this.GlobalCharge ) );
		
		// @since 2.5.5
		if( this.CartVATPercent != '0' ) { // If VAT are disabled
			
			this.CartVAT	=	( ( this.CartValue - this.GlobalCharge ) * parseInt( this.CartVATPercent ) ) / 100;
			
			$( '.Nexo-cart-global-vat' ).html( NexoAPI.Format( this.CartVAT ) );	
		}
		
		this.CartTTC			=	( this.CartValue - this.GlobalCharge ) + this.CartVAT;
		
		$( '.Nexo-cart-ttc' ).text( NexoAPI.Format( this.CartTTC ) );
		
		$( '.Nexo-cart-received' ).text( NexoAPI.Format( this.Received ) );
		
		this.DisplaysWhatLeft();
	}

	/**
	 * .DisplayWhatLeft
	 * Display which amount left to have a cash order
	 * @return void
	**/

	this.DisplaysWhatLeft				=	function(){
		this.CartPriceWithCharge		=	Math.abs( parseInt( this.CartValue ) - parseInt( this.GlobalCharge ) );
		
		if( this.CartVartPercent == '0' ) {
			this.WhatLeft					=	( parseInt( this.Received ) - parseInt( this.CartValue ) ) + this.GlobalCharge;
		} else {
			this.WhatLeft					=	( parseInt( this.Received ) - this.CartTTC );
		}
		
		$('.Nexo-cart-left').html( NexoAPI.Format( this.WhatLeft ) );
	}

	/***
	 * .ReduceItemFromCart
	 * Reduct product quantity from cart
	 * @return void
	**/

	this.ReduceItemFromCart				=	function( codebar ){
		// Si le produit existe dans le panier
		if( typeof this.CommandCart[ codebar ] !== 'undefined' ){
			if( this.CommandCart[ codebar ][0].ADDED_TO_CART > 1 ) {
				this.CommandCart[ codebar ][0].ADDED_TO_CART--;
			} else {
				delete this.CommandCart[ codebar ];
			}
			this.RefreshCart();
		} else {
			bootbox.alert( "<?php echo addslashes(__('Une erreur fatale s\'est produite durant la suppression de l\'article. Nous vous recommandons de recommencer le processus de commande. <br><strong>Si le problème persiste, veuillez contacter l\'administrateur ou soumettre un bug via le formulaire d\'assistance.</strong>', 'nexo'));?>" );
			NexoCommandes.Sound(2);
		}// JavaScript Document
	}

	/**
	 * .BindReduceEffect
	 * Bind reduce increase effect
	 * @return void
	**/

	this.BindReduceEffect				=	function(){
		// Since cash order can't be edited
		if( this.ReduceEffectEnabled ) {
			$( '.Nexo-cart-reduce' ).bind( 'click', function(){
				parent		=	$(this).closest('tr');
				var itemcodebar	=	$(parent).data( 'item-codebar' );
				NexoCommandes.ReduceItemFromCart( itemcodebar );
			});
			$( '.Nexo-cart-add' ).bind( 'click', function(){
				parent		=	$(this).closest('tr');
				var itemcodebar	=	$(parent).data( 'item-codebar' );
				$('#codebar_field' ).val( itemcodebar );
				$( '#submit_codebar_code' ).trigger('click');
			});
		}
	}

	/**
	 * .RefreshHiddenProducts
	 * refresh product from core array
	 * @return void
	**/

	this.RefreshHiddenProducts			=	function(){
		// Suppressions des produits masqué
		$('.cart-hidden-product').each(function(){
			$(this).remove();
		});
		/**
		 * C'est également ici que l'on calcule le prix de la promotion
		**/
		_.each( this.CommandCart, function( value, key ) {
			
			var Product_Promo_Start_Obj		=	moment( value[0].SPECIAL_PRICE_START_DATE ).startOf( 'day' );
			var Product_Promo_End_Obj		=	moment( value[0].SPECIAL_PRICE_END_DATE ).endOf( 'day' );
			// Default promo price
			var PrixDeVente					=	parseInt( value[0].PRIX_DE_VENTE );
				
			if( Product_Promo_Start_Obj.isValid() ) {
				// if promo price is enabled
				if( Product_Promo_End_Obj.isAfter( Nexo_Server_Time, 'minutes' ) && Product_Promo_Start_Obj.isBefore( Nexo_Server_Time, 'minutes' ) ) {
					PrixDeVente				=	parseInt( value[0].PRIX_PROMOTIONEL );
				}
			}
			
			$('#crudForm').append( '<input class="cart-hidden-product" type="hidden" name="order_products[]" value=\'{"codebar" : "' + value[0].CODEBAR + '", "qte" : "' + value[0].ADDED_TO_CART + '", "price" : "' + PrixDeVente + '", "quantite_restante" : "' + value[0].QUANTITE_RESTANTE + '", "quantite_vendu" : "' + value[0].QUANTITE_VENDU + '"}\'>' );
			
		});
		// Adding other charge to hidden product
		$('#crudForm').append( '<input type="hidden" class="other_charge" name="other_charge" value="' + this.OtherCharge + '"/>' );
		$('#crudForm').append( '<input type="hidden" class="total_value_with_charge" name="total_value_with_charge" value="' + this.CartPriceWithCharge + '"/>' );
		$('#crudForm').append( '<input type="hidden" class="order_total" name="order_total" value="' + this.CartValue + '"/>' );
		$('#crudForm').append( '<input type="hidden" class="order_vat" name="order_vat" value="' + this.CartVAT + '"/>' );
		$('#crudForm').submit();
	}

	/**
	 * .ResetCart
	 * reset cart product and value
	 * @return void
	**/
	
	this.ResetCart							=	function(){
		this.CartValue						=	0;
		this.Received						=	0;
		this.Charge							=	0;
		this.GlobalCharge					=	0;
		this.OtherCharge					=	0;
		this.ChargePercent					=	'<?php echo @$Options[ 'discount_percent' ];?>';
		this.ChargeAmount					=	'<?php echo @$Options[ 'discount_amount' ];?>';
		this.ChargeType						=	'<?php echo @$Optins[ 'discount_type' ];?>';
		this.AutoPrintReceipt				=	<?php echo @$Options[ 'nexo_enable_autoprint' ] == 'yes' ? 'true' : 'false';?>;
		this.CartPriceWithCharge			=	0;
		this.WhatLeft						=	0;
		this.SubmitCodebar					=	false;
		this.CommandCart					=	new Object;
		this.ProceedPercentDiscount			=	false;
		this.AutomatePercentDiscount		=	true;
		this.SubmitByEnterPress				=	false; // pour éviter la validation des commandes en utilisant la touche entrée
		this.RequireConfirm					=	true;
		// @since 2.5.5
		this.CartVATPercent					=	'<?php echo @$Options[ 'nexo_enable_vat' ] == 'oui' ? $Options[ 'nexo_vat_percent' ] : 0;?>';
		this.CartVAT						=	0;
		this.CartTTC						=	0;
		this.ReduceEffectEnabled			=	true;
		this.DisplayReduceButtons			=	true;
		this.DisplayCancelDiscountButton	=	true;
		
		this.RefreshCart();
		this.HideDiscountText(); // Hide discount text
		// this.RefreshCartValue(); déjà appelé dans RefreshCart
		$('#crudForm').trigger( 'reset' );
	}

	/**
	 * .SubmitOrder
	 * Display a notice if a order is empty
	 * @return @void
	**/

	this.SubmitOrder					=	function(){
		if( this.HasProducts() ) {
			this.RefreshHiddenProducts();
		} else {
			setTimeout( function(){
				bootbox.alert( '<?php _e('Une commande sans article ne peut être soumise.', 'nexo');?>' );
				NexoCommandes.Sound(2);
			}, 500 );
		}
	};

	/**
	 * .SetCharge
	 * set a flat charge for current order
	 * @return void
	**/
	
	this.SetCharge						=	function( charge ){
		charge	=	( ( typeof charge == 'undefined' || typeof charge == 'string' ) && charge == '' ) ? 0 : charge;
		this.Charge				=	parseInt( charge );
		this.GlobalCharge		=	this.OtherCharge + this.Charge;
		this.RefreshCart();
	}

	/**
	 * Définit une charge auto
	**/

	this.SetOtherCharge					=	function( charge ){
		charge	=	( typeof charge == 'undefined' || typeof charge == 'string' && charge == '' ) ? 0 : charge;
		this.OtherCharge		=	parseInt( charge )	;
		this.GlobalCharge		=	this.OtherCharge + this.Charge;
		this.RefreshCart();
	}

	/**
	 * .TreatSuccess
	 * Display notice if an order is complete or not
	 * @return void
	**/

	this.TreatSuccess					=	function(){
		if( $( '.go-to-edit-form' ).length > 0 ){
			var url				=	$( '.go-to-edit-form' ).attr( 'href' );
			var lengthToSplit	=	'<?php echo site_url(array( 'dashboard', 'nexo', 'commandes', 'lists', 'edit' ));?>/';
			var id				=	url.substr( lengthToSplit.length );

			if( this.AutoPrintReceipt ) {
				
				tendoo.notify.success( '<?php _e('Commande valide !', 'nexo');?>', '<?php _e("La facture est en cours d\'impression.", 'nexo');?>' );
				
				$( 'body' ).append( '<iframe style="display:none;" id="CurrentReceipt" name="CurrentReceipt" src="<?php echo site_url(array( 'dashboard', 'nexo', 'print', 'order_receipt' ));?>/' + id + '"></iframe>' );
				
				window.frames["CurrentReceipt"].focus();
				window.frames["CurrentReceipt"].print();
				
				setTimeout( function(){
					$( '#CurrentReceipt' ).remove();
				}, 5000 );
				
			
			} else {
				tendoo.notify.success( '<?php _e('Commande valide !', 'nexo');?>', '<?php _e("La facture a été enregistrée.", 'nexo');?>' );
			}
			
			// En cas de nouvelle commande, le panier est remis à zero
			NexoCommandes.ResetCart();

		} else {
			// Pour les commandes en édition
			// Le rafraichissement de la page se fait lorsque la commande est complete.
			if( $( '#report-success' && NexoScreen == 'edit' ).length > 0 ) {
				
				bootbox.dialog({
					title	:	'<?php _e('Veuillez patienter SVP.', 'nexo');?>',
					message : 	'<?php _e('La commande est en cours de rafraichissement.', 'nexo');?>'
				})
				
				// On evite d'affaire une notificatin pour l'édition des commandes actives
				this.RequireConfirm		=	false;
				
				document.location 		= '<?php echo current_url();?>';
			}
		}
	}

	/**
	 * Verifie si le client profite d'une remise
	**/

	this.CheckIfDiscountIsEnabled		=	function( client_id ){
		// La charge automatique est restaurée à chaque changement de client
		this.OtherCharge			=	0;
		// si NexoCommandesEdit est défini, alors nous sommes dans l'interface d'édition des commandes.
		// Nous enregistrons donc le principal client comme client ne pouvant pas bénéficie de réduction
		if( NexoScreen == 'edit' && typeof NexoCommandes.CurrentClient == 'undefined' ){
			NexoCommandes.CurrentClient		=	client_id;
		}
		// La restauration du panier se fait, même sur l'interface d'édition des commandes
		this.HideDiscountText();
		this.ProceedPercentDiscount	=	false;
		this.SetOtherCharge(0); // restaurer les autres charges (remise)
		// La recherche des réduction automatique ne se fait que pour le client
		if( client_id != NexoCurrentClient || NexoScreen == 'new' ) {
			$.ajax( tendoo.site_url  + '/nexo/customer/' + client_id + '/ID',{
				success	:	function( a ){
					if( typeof a[0] != 'undefined' ) {
						if( a[0].DISCOUNT_ACTIVE == '1' )  {
							tendoo.notify.info( "<?php echo __('Eligible pour une réduction automatique<br>', 'nexo');?>", "<?php echo sprintf(__("Ce client bénéficiera d\'une réduction automatique. Le nombre d\'achats requis a été atteint : %s", 'nexo'), $Options[ 'how_many_before_discount' ]);?>" );
							NexoCommandes.Sound(1); // notice
							NexoCommandes.DisplayDiscountText();
							<?php
                            if (@$Options[ 'discount_type' ] == 'amount') {
                                ?>
								NexoCommandes.SetOtherCharge( NexoCommandes.ChargeAmount );
								<?php

                            } elseif (@$Options[ 'discount_type' ] == 'percent') {
                                ?>
								NexoCommandes.ProceedPercentDiscount = true;
								NexoCommandes.AutomatePercentDiscount = true; // Restauration des remises automatiques
								NexoCommandes.RefreshCart();
								<?php

                            }
                            
                            /**
                             * Corrige le blug majeure de la version 2.4.2
                             * Les commandes soumis à une réduction automatique au pourcentage conservait leur charge après changement du client
                             * #2.4.2
                             * @author Blair Jersyer
                            **/
                            
                            ?>
							
						} else {
							NexoCommandes.RefreshCart();
						}
					}
				},
				dataType:"json"
			});
		}
	};
	
	/**
	 * Display DiscountText
	**/
	
	this.DisplayDiscountText			=	function ( discount_type ) {
		if( typeof discount_type == 'undefined' ) {
			<?php
            $remise_type    =    @$Options[ 'discount_type' ] == 'percent' ?
                sprintf(__('Remise à %s %%', 'nexo'), @$Options[ 'discount_percent' ])
                : __('Remise à taux fixe', 'nexo');
            ?>
			var discount_type_text	=	'<?php echo $remise_type;?>';
		} else {
			var discount_type_text	=	discount_type == 'percent' ? 
				'<?php echo sprintf(__('Remise à %s %%', 'nexo'), @$Options[ 'discount_percent' ]);?>' 
				: '<?php echo __('Remise à taux fixe', 'nexo');?>';
		}
		$( '#cart-price-list thead #discount-wrapper' ).append( '<div class="badge badge-warning pull-right" id="discount-notice">' + discount_type_text + '</div>' );
		
		this.DisplayRemoveDiscountButton();

	}
	
	/**
	 * Hide discount button
	**/
	
	this.DisplayRemoveDiscountButton	=	function(){
		if( this.DisplayCancelDiscountButton ) {
			var button	=	$( '.box-footer #checkout' ).after( '<div class="btn-group" role="group" id="cancel_discount_button"><button type="button" class="btn btn-warning" id="checkout"><?php echo addslashes(__('Cancel discount', 'nexo'));?></button></div>' );
			$( '#cancel_discount_button' ).bind( 'click', function(){
				// Tout ce qui concerne les remises automatique sont retiré
				<?php 
                if (@$Options[ 'discunt_type' ] == 'amount') {
                    ?>
					NexoCommandes.SetOtherCharge(0);
					<?php

                } elseif (@$Options[ 'discount_type' ] == 'percent') {
                    ?>
					NexoCommandes.ProceedPercentDiscount = false;
					NexoCommandes.AutomatePercentDiscount = false;
					NexoCommandes.SetOtherCharge(0);
					NexoCommandes.RefreshCart();
					<?php

                }
                ?>
				NexoCommandes.HideDiscountText();
			});
		}
	}
	
	this.RemoveDiscountButton			=	function(){
		$( '#cancel_discount_button' ).remove();
	};
	
	this.HideDiscountText				=	function() {
		$( '#discount-notice' ).remove();
		
		this.RemoveDiscountButton();
	}

	/**
	 * Active une fois la réduction automatique au pourcentage
	**/

	this.ApplyPercentDiscount			=	function(){
		// Ceci permet d'échapper le calcul des remises lors de la modification d'une commande. 
		// Ce processus est reinitialisé lorsque le titulaire de la commande est modifié
		if( this.AutomatePercentDiscount ) {

			// Si la réduction automatique s'applique, la valeur "globalcharge" sera modifiée
			if( this.ProceedPercentDiscount ) {
				this.OtherCharge		=	Math.floor( ( this.CartValue * parseInt( <?php echo intval(@$Options[ 'discount_percent' ]);?> ) ) / 100 );
				this.GlobalCharge		=	this.OtherCharge + this.Charge;
			}
		}
	};

	/**
	 * Play Sound
	 * @return void
	**/

	this.Sound							=	function( sound ){
		var SoundEnabled				=	'<?php echo @$Options[ 'nexo_soundfx' ];?>';
		if( ( SoundEnabled.length != 0 || SoundEnabled == 'enable' ) && SoundEnabled != 'disable' ) {
			var music = new buzz.sound( NexoSound + sound , {
				formats: [ "mp3" ]
			});
			music.play();
		}
	};
	
	/**
	 * Product Fetch Codebar
	 * @return void
	**/
	
	this.FetchCodebar					=	function(){			
		this.FetchCodebarWrapper	=	'#filter-wrapper';
		var wrapper					=	this.FetchCodebarWrapper;
		// Si le panel n'est pas ouvert
		if( ! $( wrapper ).data( 'is-open' ) || $( wrapper ).data( 'is-open' ) == 'false' ) {
			$( '#fetch_codebar' ).text( '<?php echo addslashes(__('Fermer La Liste', 'nexo'));?>' );
			$( wrapper ).data( 'is-open', 'true' );
			$( wrapper ).slideDown(500);
			this.__FetchCodebarLoading();
		} else { // Si le panel est ouvert
			$( '#fetch_codebar' ).text( '<?php echo addslashes(__('Afficher La Liste', 'nexo'));?>' );
			$( wrapper ).data( 'is-open', 'false' );
			$( wrapper ).slideUp(500);
			$( wrapper ).find( '#filter-list' ).html(''); // Nettoyage
		}
	}
	
	this.__FetchCodebarLoading			=	function(){
		$.ajax( '<?php echo site_url(array( 'nexo', 'item' ));?>',{
			dataType:"json",
			beforeSend: function(){
				$( '#filter-list' ).html( '<div class="col-lg-12"><span id="fetchcodebar_notice" style="line-height:40px;"><?php _e('Chargement...', 'nexo');?></span></div>' );
			},
			success: function( data ){
				if( data.length == 0 ) {
					$( '#fetchcodebar_notice' ).html( '<?php echo
            addslashes(sprintf(__('Aucun produit disponible. <a href="%s" class="btn btn-primary btn-xs">Créer un nouveau produit</a>', 'nexo'), site_url(array( 'dashboard', 'nexo', 'produits', 'add' ))));?>' );
				} else {
					$( '#fetchcodebar_notice' ).remove();
					_.each( data, function( value, key ) {
						var LatestClass					=	'';
						if( key + 1 == data.length ) {
							LatestClass		=	'border-right:solid 1px #DEDEDE';
						} 
						// Promotion Price
						var Product_Promo_Start_Obj		=	moment( value.SPECIAL_PRICE_START_DATE ).startOf( 'day' );
						var Product_Promo_End_Obj		=	moment( value.SPECIAL_PRICE_END_DATE ).endOf( 'day' );
						var RegularPrice				=	'';
						var PrixDeVente					=	parseInt( value.PRIX_DE_VENTE );
						var PrixRegulier				=	false
						
						if( Product_Promo_Start_Obj.isValid() ) {
							// if promo price is enabled
							if( Product_Promo_End_Obj.isAfter( Nexo_Server_Time, 'minutes' ) && Product_Promo_Start_Obj.isBefore( Nexo_Server_Time, 'minutes' ) ) {
								PrixDeVente				=	parseInt( value.PRIX_PROMOTIONEL );
								PrixRegulier			=	parseInt( value.PRIX_DE_VENTE );
								RegularPrice			=	'<small><strike><?php echo addslashes($this->Nexo_Misc->display_currency('before'));?> ' + 
								NexoAPI.Format( parseInt( value.PRIX_DE_VENTE ) )  + ' <?php echo addslashes($this->Nexo_Misc->display_currency('after'));?></strike></small>';
							}
						}
						
						// Quantité restante
						// On réduit la quantité restante moins celle déjà ajouté au panier
						
						var	added_to_cart	=	( typeof NexoCommandes.CommandCart[ value.CODEBAR ] != 'undefined' ) ? NexoCommandes.CommandCart[ value.CODEBAR ][0].ADDED_TO_CART : 0;
						if( Math.abs( parseInt( value.QUANTITE_RESTANTE ) - parseInt( added_to_cart ) )  > 0 ){
							$( '#filter-list' ).append( 
						'<div class="col-sm-5 col-md-3 col-xs-4" style="padding:5px; border-left: solid 1px #DEDEDE;border-bottom: solid 1px #DEDEDE;' + LatestClass + '">' +
							// '<div class="thumbnail">'+
							  '<img src="<?php echo upload_url();?>' + value.APERCU + '" style="max-height:120px;width:100%">'+
							  '<div class="caption" style="padding:2px;">'+
								'<strong>' + value.DESIGN + '</strong><br><span><?php echo addslashes($this->Nexo_Misc->display_currency('before'));?>' + 
								NexoAPI.Format( PrixDeVente )  + ' <?php echo addslashes($this->Nexo_Misc->display_currency('after'));?></span>' + RegularPrice + '<br><br>'+
								'<div class="btn-group btn-group-justified" role="group" aria-label="...">' +
									'<div class="btn-group">'+
										'<button class="btn btn-primary btn-sm filter-add-product" data-codebar="' + value.CODEBAR + '">'+
											'<?php _e('Ajouter', 'nexo');?>'+
										'</button> '+
									'</div>'+
									'<div class="btn-group">'+
										'<a href="<?php echo site_url(array( 'dashboard', 'nexo', 'produits', 'list', 'edit' ));?>/' + value.ID + '" class="btn btn-default btn-sm filter-product-details" data-codebar="' + value.CODEBAR + '">'+
											'<?php _e('Détails', 'nexo');?>'+
										'</a> '+
									'</div>'+
								'</div>'+
							// '</div>'+
						'</div>' );
						}
					});
					
					$('.filter-add-product[data-codebar]').bind( 'click', function(){
						NexoCommandes.FetchAndAddProduct( $(this).data( 'codebar' ) );
						NexoCommandes.__CloseFetchCodebarBox();						
					});
					
					/*$( '.filter-product-details[data-codebar]' ).bind( 'click', function(){
							
					});*/
				}
			}
		});
	}
	
	this.__CloseFetchCodebarBox			=	function(){
		$( '#fetch_codebar' ).trigger( 'click' );
	};
	
	/**
	 * Enter Codebar and Fetch
	**/
	
	this.FetchAndAddProduct				=	function( codebar ){
		$( '#codebar_field' ).val( codebar );
		$( '#submit_codebar_code' ).trigger( 'click' );
	}
	
	/**
	 * Creating a new clients
	**/
	
	this.CreateNewClientPopup			=	function(){
		bootbox.confirm( '<div id="NewClientPopup"/>', function( action ){
			if( action ) { // Si l'action vaut true				
				
				var content						=	NexoAPI.events.applyFilters( 'nexo_customer_fields_object', {} );
				
				// Do action
				var customserFieldValidation	=	NexoAPI.events.applyFilters( 'check_customer_fields', true );
				
				if( customserFieldValidation == false ) {
					return customserFieldValidation;
				}				
				
				$.ajax( '<?php echo site_url(array( 'nexo', 'customer' ));?>', {
					type:	"POST",
					data: 	content,
					dataType: "json",
					success: function( data ) {
						if( data.status == 'success' ) {
							// Notice
							tendoo.notify.success( 
								'<?php echo addslashes(__('Le client a été correctement crée', 'nexo'));?>',
								'<?php echo addslashes(__('Un nouveau client a été ajouté à la base de données', 'nexo'));?>'
							);
							//  Refresh Client List
							$.ajax( '<?php echo site_url(array( 'nexo', 'customer' ));?>', {
								success : function( clients ) {
									$( '#field-REF_CLIENT' ).html('');
									_.each( clients, function( value, key ) {
										$( '[name="REF_CLIENT"]' ).append( '<option value="' + value.ID + '">' + value.NOM + '</option>' );
									});
									$( '#field-REF_CLIENT' ).trigger( 'chosen:updated' );
								},
								dataType : 'json'
							});
						} else {
							bootbox.alert( '<?php echo addslashes(__('Une erreur s\'est produite durant la création du client', 'nexo'));?>' );
						}
					}
				});
			}
		});
		
		$( '[data-dismiss="modal"]' ).remove(); // fix input length bug		
		
		$( '#NewClientPopup' ).html( NexoAPI.events.applyFilters( 'nexo_customer_dom_popup', '' ) );
	}
	
	// Reset Cart
	this.ResetCart();
};
	
$(document).ready(function(e) {
	
	// Filter for Codebar 
	
	NexoAPI.events.addFilter( 'nexo_checkout_codebar_wrapper', function( dom ) {
		return '<div class="input-group input-group">' +
			'<span class="input-group-btn">' +
				'<button class="btn btn-primary " type="button" id="fetch_codebar" >' +
					'<?php _e('Afficher La Liste', 'nexo');?>' +
				'</button>' +
			'</span>' +
			'<input type="text" class="form-control" placeholder="<?php echo addslashes(__('Code de l\'article', 'nexo'));?>" aria-describedby="basic-addon1" id="codebar_field">' +
			'<span class="input-group-btn">' +
				'<button class="btn btn-primary " type="button" id="submit_codebar_code" >' +
					'<?php echo addslashes(__('Ajouter', 'nexo'));?>' +
				'</button>' +
			'</span>' +
		'</div>' + dom;
	});
	
    $('#codebar-wrapper').html(	NexoAPI.events.applyFilters( 'nexo_checkout_codebar_wrapper', '' )	);
	
	$( '#REF_CLIENT_field_box' ).append( '<button class="nexo_add_client btn btn-sm btn-primary" type="button" style="margin-top:10px;">' + '<?php echo addslashes(__('Enregistrer un nouveau client', 'nexo'));?>' + '</button>' );
	
	$( '.nexo_add_client' ).bind( 'click', function(){
		NexoCommandes.CreateNewClientPopup();
	});

	// Hide buttons
	$( '.buttons-box' ).hide();

	$( '#codebar_field' ).bind( 'focus', function(e){
		NexoCommandes.SubmitCodebar		=	true;
		$(this).closest( 'form' ).find( '[type="submit"]' ).each(function(){
			$(this).attr( 'type', 'hidden' );
		});
	})
	$( '#submit_codebar_code' ).bind( 'click', function(e){
		e.preventDefault();
		NexoCommandes.GetProduct( $('#codebar_field').val() );
		$('#codebar_field' ).val('');
		$('#codebar_field').focus();
	});
	$( '#codebar_field' ).bind( 'blur', function(e){
		NexoCommandes.SubmitCodebar		=	false;
		$(this).closest( 'form' ).find( '[type="hidden"]' ).each(function(){
			$(this).attr( 'type', 'submit' );
		});
	})
	$('#field-SOMME_PERCU' ).bind( 'keyup', function(){
		var val	=	$(this).val() != '' ? $(this).val() : 0;
		NexoCommandes.Received	=	parseInt( val ); // refresh receive amount
		NexoCommandes.RefreshCartValue();
	});
	$('#field-SOMME_PERCU' ).bind( 'blur', function(){
		var val	=	$(this).val() != '' ? $(this).val() : 0;
		NexoCommandes.Received	=	parseInt( val ); // refresh receive amount
		NexoCommandes.RefreshCartValue();
	});
	$('#checkout').bind( 'click', function(){
		// Get current Cart State
		var CartState		=	$( '#cart-price-list' );
		bootbox.confirm( '<h3 class="text-center"><?php echo _e('Souhaitez-vous confirmer cette commande ?', 'nexo');?></h3>' + $( CartState )[0].outerHTML, function( action ){
			if( action ) { // Si la confirm box est acceptée.
				NexoCommandes.SubmitOrder();
			}
		});
		NexoCommandes.Sound(2);
	});
	$('#field-REMISE').bind( 'keyup', function(){
		NexoCommandes.SetCharge( $(this).val() )
	});
	$('#field-REMISE').bind( 'blur', function(){
		NexoCommandes.SetCharge( $(this).val() )
	});
	
	$( '#fetch_codebar' ).bind( 'click', function() {
		NexoCommandes.FetchCodebar();
	})

	/**
	 * Gestion des Réduction automatique
	**/

	<?php
    global $Options;
    if (@$Options[ 'discount_type' ] != 'disable') {
        ?>

	$('[name="REF_CLIENT"]').bind( 'change', function(){
		NexoCommandes.CheckIfDiscountIsEnabled( $(this).val() );
	});

	<?php

    }
    ?>

	/**
	 * Fin gestion des réductions automatiques
	**/


	// Trigger Blur EveryWhere
	$( '[type="text"]' ).trigger( 'blur' );

	$(document).keypress(function(e) {
		if( e.which == 13 && NexoCommandes.SubmitCodebar == true ) {
			$('#submit_codebar_code' ).trigger( 'click' );
		}
		if( e.which == 13 && NexoCommandes.SubmitByEnterPress == true ) {
			$( '#checkout' ).trigger( 'click' );
		}
	});
	
	/**
	 * Désactivation de la soumissions des commandes en utilisant la touche entrée
	**/
	
	$( '#crudForm [type="text"]' ).bind('focus', function(){
		$(this).closest( 'form' ).find( '[type="submit"]' ).attr( 'type', 'pending_submit' );
		NexoCommandes.SubmitByEnterPress	=	true;
	});
	
	$( '#crudForm [type="text"]' ).bind( 'blur', function(){
		NexoCommandes.SubmitByEnterPress 	=	false;
	});
	
	// Fix bug for empty "SOMME_PERCU" field while submiting cart
	$(document).ajaxSuccess(function( event, xhr, settings ){
		if( xhr.responseText.length > '2' ) {
			var  content	=	JSON.parse( xhr.responseText );
			// Nous savons dès à présent que toutes les requêtes ont été effectuées. Nous pouvons reinitialiser le panier
			if( typeof content.insert_primary_key != 'undefined' ) {
				NexoCommandes.TreatSuccess();
			}
		}
	});
	
	// Prevent Close when a product is added
	$('a').on('click', function() { inFormOrLink = true; });
	$('form').on('submit', function() { inFormOrLink = true; });
	
	$(window).on("beforeunload", function() { 
		if( ( inFormOrLink && NexoCommandes.HasProducts() && NexoCommandes.RequireConfirm ) || ( NexoCommandes.HasProducts() && NexoCommandes.RequireConfirm ) ) {
			return "<?php echo addslashes(__('Le processus de commande à commencé. Si vous continuez, vous perdrez toutes les informations non enregistrées', 'nexo'));?>";
		}
	})
	
	/**
	 * Group user Management
	 *
	 * @since 2.5.5
	**/
	
	/**
	 * Applying filter for Customer Object
	 * @since 2.5.6
	**/
	
	// Add default field
	NexoAPI.events.addFilter( 'nexo_customer_fields_object', function( old_fields ) {
		var customer_name		=	$( '#NewClientPopup' ).find( '[name="customer_name"]' ).val();
		var customer_email		=	$( '#NewClientPopup' ).find( '[name="customer_email"]' ).val();
		var customer_tel		=	$( '#NewClientPopup' ).find( '[name="customer_tel"]' ).val();
		var customer_surname	=	$( '#NewClientPopup' ).find( '[name="customer_surname"]' ).val();
		var customer_ref_group	=	$( '[name="customer_group_id"]' ).val();
		var fields				=	_.object( 
			[ 'nom', 'email', 'tel', 'prenom', 'ref_group' ], 
			[ customer_name, customer_email, customer_tel, customer_surname, customer_ref_group ] 
		);
		// Return extended fields
		return _.extend( old_fields, fields );					
	});
	
	// if action is false, an error occured, we return previous error
	NexoAPI.events.addFilter( 'check_customer_fields', function( action ) {
		
		var customer_name		=	$( '#NewClientPopup' ).find( '[name="customer_name"]' ).val();
		
		if( action ) {
			if( customer_name.length == 0 ) {					
				bootbox.alert( '<?php echo addslashes(__('Vous devez fournir un nom pour le nouveau client', 'nexo'));?>' );
				return false;
			}
		}
		return action;
	});
	
	// Load groups
	
	$.ajax( '<?php echo site_url(array( 'nexo', 'customers_groups' ));?>', {
		success		:	function( groups ) {
			NexoAPI.events.addFilter( 'nexo_customer_dom_popup', function( value ) {
				var dom				=	$.parseHTML( value );
				var selectGroups	=	'<select name="customer_group_id" class="form-control">';
				var selectDom		=	'';
				
				selectGroups +=	'<option value=""><?php echo addslashes(__('Veuillez choisir un groupe', 'nexo'));?></option>';
				
				_.each( groups, function( group, group_key ) {
					selectGroups +=	'<option value="' + group.ID + '">' + group.NAME + '</option>';
				});
				
				selectGroups		+=	'</select>';
				
				selectDom			=	'<div class="form-group">'+
					'<div class="input-group">' +
					  '<span class="input-group-addon" id="basic-addon1"><?php echo addslashes(__('Affecter à un groupe', 'nexo'));?></span>'+
					  selectGroups +
					'</div>'+
				'</div>';
				
				$( dom ).find( '.form-group' ).last().after( selectDom );
				
				// alert( $( dom )[0].outerHTML );
				
				return $( dom )[0].outerHTML;
			});
		}
	});
	
	// Control user group field
	// if action is false, an error occured, we return previous error
	NexoAPI.events.addFilter( 'check_customer_fields', function( action ) {
		if( action ) {
			if( $( '#NewClientPopup' ).find( '[name="customer_group_id"]' ).val().length == 0 ) {					
				bootbox.alert( '<?php echo addslashes(__('Vous devez affecter le client à un groupe', 'nexo'));?>' );
				return false;
			}
		}
		return action;
	});
	
	// Fix chosen width
	$( '#field_REF_CLIENT_chosen' ).width( '100%' );
	$( '#field_PAYMENT_TYPE_chosen' ).width( '100%' );
	
	$( '#TYPE_field_box' ).remove();
	
	// Show
	<?php if (! $NexoEditScreen):?>
	// Disable when on edit screen, since this one already have his own system.
	$( '.content-wrapper .content' ).eq(0).css({
		'display' : 'inherit'
	});
	$( '#meta-produits' ).css({
		'display' : 'inherit'
	});
	$( '.content-header' ).css({
		'display' : 'inherit'
	});
	<?php endif;?>
});
</script>

<!-- Trigger Nexo Checkout Footer -->
<?php $this->events->do_action('nexo_checkout_footer');?>