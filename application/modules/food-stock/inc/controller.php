<?php

class Food_Stock_Manager_Controller extends Tendoo_Module
{

    /**
     * Crud Header
     * @return void
    **/

    public function lists(){
        $crud       =   $this->history_crud();
        $this->Gui->set_title( store_title( 'FoodStock', 'List') );

        $this->events->add_action( 'dashboard_footer', function(){
            get_instance()->load->module_view( 'food-stock', 'transfert.list_script' );
        });

        $this->load->module_view( 'food-stock', 'transfert.history-gui', compact( 'crud' ) );
    }

    public function addstock(){
        $this->Gui->set_title( store_title( 'Add Food Stock', 'food-stock' ) );

        $this->events->add_action( 'dashboard_footer', function(){
            get_instance()->load->module_view( 'food-stock', 'transfert.script' );
        });

        $data['page'] = 'add';
        return $this->load->module_view( 'food-stock', 'transfert.gui', $data );
    }

    public function edit($id){
        $this->Gui->set_title( store_title( 'Edit Food Stock', 'food-stock' ) );

        $this->events->add_action( 'dashboard_footer', function(){
            get_instance()->load->module_view( 'food-stock', 'transfert.script' );
        });

        $data['page'] = 'edit';
        $this->load->module_model( 'food-stock', 'stock_model' );
        $data['info'] = $this->stock_model->get($id);
        return $this->load->module_view( 'food-stock', 'transfert.gui', $data );
    }

    public function report(){
        $crud       =   $this->report_curd();
        $this->Gui->set_title( store_title( 'FoodStock', 'Report') );
        $this->load->module_view( 'food-stock', 'transfert.history-gui', compact( 'crud' ) );
    }

    public function report_curd(){
        /**
         * This feature is not more accessible on main site when
         * multistore is enabled
         **/

        $this->load->module_model( 'food-stock', 'report_model' );

        $crud = new grocery_CRUD();
        $crud->set_subject(__('Food Stock Report', 'nexo'));
        $crud->set_theme('bootstrap');
        // $crud->set_theme( 'bootstrap' );
        $crud->set_table( $this->db->dbprefix( 'food_stock_history' ) );

        // If Multi store is enabled
        // @since 2.8
        $columns					=	array( 'AUTHOR', 'STOCK_ID', 'QTY', 'DATE_MOD');

        $crud->columns( $columns );
        // $crud->fields( $fields );

        $crud->unset_add();
        //$crud->unset_delete();
        $crud->unset_edit();

        $crud->display_as('AUTHOR', __('AUTHOR', 'food-stock'));
        $crud->display_as('STOCK_ID', __('STOCK_ID', 'food-stock'));
        $crud->display_as('QTY', __('QTY', 'food-stock'));
        $crud->display_as('DATE_MOD', __('DATE_MOD', 'food-stock'));

        $crud->set_relation('AUTHOR', 'aauth_users', 'name');
        $crud->set_relation('STOCK_ID', 'food_stock', 'NAME');

        //$crud->add_action(__('Transfert Invoice', 'nexo'), '', site_url(array( 'dashboard', store_slug(), 'stock-transfert', 'history', 'report' )) . '/', 'btn btn-info fa fa-file');
        //$crud->add_action(__('Edit', 'nexo'), null, site_url([ 'dashboard', 'food-stock', 'edit/'] ), 'edit-icon fa fa-edit btn-default btn');

        //$crud->add_action( __( 'Delete', 'nexo' ), null, site_url([ 'dashboard', store_slug(), 'nexo', 'produits', 'stock_supply' ] ), 'fa fa-remove btn btn-danger');

        $this->events->add_filter('grocery_callback_insert', array( $this->grocerycrudcleaner, 'xss_clean' ));
        $this->events->add_filter('grocery_callback_update', array( $this->grocerycrudcleaner, 'xss_clean' ));

        $crud->order_by('DATE_MOD','desc');

        $crud->unset_jquery();
        $output = $crud->render();

        foreach ($output->js_files as $files) {
            $this->enqueue->js(substr($files, 0, -3), '');
        }
        foreach ($output->css_files as $files) {
            $this->enqueue->css(substr($files, 0, -4), '');
        }

        return $output;
    }

    public function history_crud()
    {
		/**
		 * This feature is not more accessible on main site when
		 * multistore is enabled
		**/

        $this->load->module_model( 'food-stock', 'stock_model' );
		
        $crud = new grocery_CRUD();
        $crud->set_subject(__('Food Stock List', 'nexo'));
        $crud->set_theme('bootstrap');
        // $crud->set_theme( 'bootstrap' );
        $crud->set_table( $this->db->dbprefix( 'food_stock' ) );
		
		// If Multi store is enabled
		// @since 2.8		
		$columns					=	array( 'NAME', 'CODE', 'UOM', 'COST', 'QTY', 'DATE_CREATION', 'DATE_MOD' );
		
		$crud->columns( $columns );
        // $crud->fields( $fields );
        
        $crud->unset_add();
        //$crud->unset_delete();
        $crud->unset_edit();
        
        $crud->display_as('NAME', __('Name', 'food-stock'));
        $crud->display_as('CODE', __('CODE', 'food-stock'));
        $crud->display_as('UOM', __('UOM', 'food-stock'));
        $crud->display_as('COST', __('COST', 'food-stock'));
        $crud->display_as('QTY', __('QTY', 'food-stock'));
        //$crud->display_as( 'AUTHOR', __('AUTHOR', 'food-stock'));
        $crud->display_as( 'DATE_CREATION', __('DATE_CREATION', 'food-stock'));
        $crud->display_as( 'DATE_MOD', __('DATE_MOD', 'food-stock'));

        //$crud->set_relation('AUTHOR', 'aauth_users', 'name');

        //$crud->add_action(__('Transfert Invoice', 'nexo'), '', site_url(array( 'dashboard', store_slug(), 'stock-transfert', 'history', 'report' )) . '/', 'btn btn-info fa fa-file');
        $crud->add_action(__('Edit', 'nexo'), null, site_url([ 'dashboard', 'food-stock', 'edit/'] ), 'edit-icon fa fa-edit btn-default btn');
        $crud->add_action(__('QtyMod', 'nexo'), null, site_url([ 'dashboard', 'food-stock', 'qty/'] ), 'edit-icon fa fa-plus btn-default btn');

        //$crud->add_action( __( 'Delete', 'nexo' ), null, site_url([ 'dashboard', store_slug(), 'nexo', 'produits', 'stock_supply' ] ), 'fa fa-remove btn btn-danger');

        $this->events->add_filter('grocery_callback_insert', array( $this->grocerycrudcleaner, 'xss_clean' ));
        $this->events->add_filter('grocery_callback_update', array( $this->grocerycrudcleaner, 'xss_clean' ));

        $crud->unset_jquery();
        $output = $crud->render();
        
        foreach ($output->js_files as $files) {
            $this->enqueue->js(substr($files, 0, -3), '');
        }
        foreach ($output->css_files as $files) {
            $this->enqueue->css(substr($files, 0, -4), '');
        }
        
        return $output;
    }

    /**
     * Settings Page for Transfert
     * @return void
    **/

    public function settings()
    {
        $this->Gui->set_title( store_title( __( 'Transfert Settings', 'food-stock' ) ) );
        $this->load->module_view( 'food-stock', 'settings.gui' );
    }
}