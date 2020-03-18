<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Do_setup extends Tendoo_Controller
{

    /**
     * Registration Controller for Auth purpose
     *
     * Maps to the following URL
     * 		http://example.com/index.php/registration
     *	- or -
     * 		http://example.com/index.php/registration/index
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->library('notice');
        $this->load->library('form_validation'); // loading form_validation library

        /**
         * Load Language
        **/

        if (isset($_GET[ 'lang' ])) {
            if (in_array($_GET[ 'lang' ], array_keys(get_instance()->config->item('supported_languages')))) {
                get_instance()->config->set_item('site_language', $_GET[ 'lang' ]);
            }
        }

        Modules::load(MODULESPATH);
    }

    public function index()
    {
        // checks if tendoo is not installed
        if ($this->setup->is_installed()):
            redirect(array( 'init?notice=is-installed' ));
        endif;

        // set title
        Html::set_title(sprintf(__('Welcome Page &mdash; %s'), get('core_signature')));
        // $this->load->model( 'tendoo_setup' );
        $this->load->view('shared/header');
        $this->load->view('do-setup/index');
    }
    public function database()
    {
        // checks if tendoo is not installed
        if ($this->setup->is_installed()):
            redirect(array( 'init' ));
        endif;

        $this->form_validation->set_rules('_ht_name', __('Host Name'), 'required');
        $this->form_validation->set_rules('_uz_name', __('User Name'), 'required');
        $this->form_validation->set_rules('_db_name', __('Database Name'), 'required');
        $this->form_validation->set_rules('_db_driv', __('Database Driver'), 'required');
        $this->form_validation->set_rules('_db_pref', __('Database Prefix'), 'required');

        if ($this->form_validation->run()) {
            $exec    =    $this->setup->installation(
                $this->input->post('_ht_name'),
                $this->input->post('_uz_name'),
                $this->input->post('_uz_pwd'),
                $this->input->post('_db_name'),
                $this->input->post('_db_driv'),
                $this->input->post('_db_pref')
            );

            if ($exec == 'database-installed') {
                redirect(array( 'do-setup', 'site?notice=' . $exec . (riake('lang', $_GET) ? '&lang=' . $_GET[ 'lang' ] : '') ));
            }

            $this->notice->push_notice($this->lang->line($exec));
        }

        Html::set_title(sprintf(__('Database config &mdash; %s'), get('core_signature')));
        // $this->load->model( 'tendoo_setup' );
        $this->load->view('shared/header');
        $this->load->view('do-setup/database');
    }
    public function site()
    {
        // checks if tendoo is not installed
        if (! $this->setup->is_installed()):
            redirect(array( 'do-setup' . ( $_GET[ 'lang' ] ? '?lang=' . $_GET[ 'lang' ] : '') ));
        endif;

        // load database
        $this->load->database();

        $this->events->do_action('tendoo_setup');

        $this->form_validation->set_rules('site_name', __('Site Name'), 'required');

        if ($this->form_validation->run()) {
            $exec    =    $this->setup->final_configuration(
                $this->input->post('site_name')
            );

            if ($exec == 'tendoo-installed') {
                redirect(array( 'sign-in?redirect=dashboard/index&notice=' . $exec . ( @$_GET[ 'lang' ] ? '&lang=' . $_GET[ 'lang' ] : '') ));
            }

            $this->notice->push_notice($this->lang->line($exec));
        }

        // Outputing
        Html::set_title(sprintf(__('Site & Master account &mdash; %s'), get('core_signature')));
        $this->load->view('shared/header');
        $this->load->view('do-setup/site');
    }
}
