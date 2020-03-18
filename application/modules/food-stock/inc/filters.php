<?php
class Food_Stock_Manager_Filters extends Tendoo_Module
{
    /**
     * Filter Admin Menus
     * @param array
     * @return array
    **/

    public function admin_menus( $menus )
    {
        if( User::in_group( 'shop_tester' ) || User::in_group( 'master' ) || User::in_group( 'administrator' ) ) {
            $menus          =   array_insert_after( 'arrivages', $menus, 'food-stock', [
                [
                    'title'     =>  __( 'Food Stock', 'food-stock' ),
                    'href'      =>  site_url([ 'dashboard', store_slug(), 'food-stock' ]),
                    'icon'      =>  'fa fa-exchange',
                    'disable'   =>  true
                ],
                [
                    'title'     =>  __( 'Food Stock List', 'food-stock' ),
                    'href'      =>  site_url([ 'dashboard', store_slug(), 'food-stock', 'lists' ]),
                ],
                [
                    'title'     =>  __( 'Add Food Stock', 'food-stock' ),
                    'href'      =>  site_url([ 'dashboard', store_slug(), 'food-stock', 'addstock' ]),
                ],
                [
                    'title'     =>  __( 'Report', 'food-stock' ),
                    'href'      =>  site_url([ 'dashboard', store_slug(), 'food-stock', 'report' ]),
                ]
            ]);
        }
        return $menus;
    }
}