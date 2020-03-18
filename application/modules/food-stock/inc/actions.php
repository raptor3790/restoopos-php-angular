<?php
include_once( dirname( __FILE__ ) . '/install.php' );

class Food_Stock_Manager_Actions extends Tendoo_Module
{
    public function __construct()
    {
        parent::__construct();

        $this->install      =   new Food_Stock_Manager_Install;
    }

    /**
     * Load Dashboard
     * @return void
    **/

    public function load_dashboard()
    {
        $this->Gui->register_page_object( 'food-stock', new Food_Stock_Manager_Controller );
        $this->events->add_filter( 'stores_controller_callback', function( $action ) {
            $action[ 'food-stock' ]     =   new Food_Stock_Manager_Controller;
            return $action;
        });
    }

    /**
     * Do Enable Module
     * @return void
    **/

    public function do_enable_module( $namespace )
    {
        if( $namespace == 'food-stock' && get_option( 'food-stock-installed' ) == null ) {
            set_option( 'food-stock-installed', true );

            $this->install->complete();
        }
    }

    /**
     * Install tables
     * @param string table prefix
     * @return void
    **/

    public function install_tables( $table_prefix )
    {
        $this->install->sql( $table_prefix );
    }

    /**
     * Uninstall
     * @return void
    **/

    public function do_remove_module( $namespace )
    {
        // retrait des tables Nexo
        if ( $namespace === 'food-stock' ) {
            $this->install->remove_all();
        }
    }

    /**
     * Delete tables
     * @param string table prefox
     * @return void
    **/

    public function remove_tables( $table_prefix )
    {
        $this->install->remove( $table_prefix );
    }
}