<?php
class auth_module_class extends CI_model
{
    public function __construct()
    {
        parent::__construct();

        $this->lang->load_lines(dirname(__FILE__) . '/inc/aauth_lang.php');

		// Load Model if tendoo is installed
        if ($this->setup->is_installed()) {
            $this->load->model('Users_Model', 'users');
        }

        // Events
        // change send administrator emails
        $this->events->add_action('after_app_init', array( $this, 'after_session_starts' ));
        // $this->events->add_action( 'is_connected' , array( $this , 'is_connected' ) );	deprecated
        $this->events->add_action('log_user_out', array( $this, 'log_user_out' ));
        $this->events->add_filter('user_id', array( $this, 'user_id' ));
        $this->events->add_filter('user_menu_card_avatar_alt', function () {
            return User::pseudo();
        });
        $this->events->add_filter('user_menu_card_avatar_src', array( $this, 'user_avatar_src' ));

        // Allow only admin user to access the dashboard
        $this->events->add_action('load_dashboard', array( $this, 'control_dashboard_access' ));
        // Tendoo Setup
    }

    public function user_avatar_src()
    {
        return User::get_gravatar_url();
    }

    public function user_id()
    {
        global $CurrentScreen;

        if ($this->users->is_connected() && $this->setup->is_installed() && ! in_array($CurrentScreen, array( 'do-setup', 'sign-in', 'sign-up' ))) {
            return User::get()->id;
        }
        return 0;
    }
    public function log_user_out()
    {
        if ($this->users->logout() == null) {
            if (($redir    =    riake('redirect', $_GET)) != false) {
                redirect(array( 'sign-in?redirect=' . urlencode($redir) ));
            } else {
                redirect(array( 'sign-in' ));
            }
        }
        // not trying to handle false since this controller require login.
        // While accessing this controller twice, a redirection will be made to login page from "tendoo_controller".
    }

    public function is_connected() // deprecated
    {
        if ($this->users->is_connected()) {
            redirect(array( $this->config->item('default_logout_route') . '?notice=logout-required&redirect='  . urlencode(current_url()) ));
        }
    }


    /**
     * After options init
     *
     * @return void
    **/

    public function after_session_starts()
    {
        // load user model
        // $this->load->model('users_model', 'users'); // We're migrating to use single class

        new User;

        // If there is no master user , redirect to master user creation if current controller isn't do-setup
        if (! $this->users->master_exists() && $this->uri->segment(1) !== 'do-setup') {
            redirect(array( 'do-setup', 'site' ));
        }
        // force user to be connected for certain controller
        if (in_array($this->uri->segment(1), $this->config->item('controllers_requiring_login')) && $this->setup->is_installed()) {
            if (! $this->users->is_connected() || ! User::get()) {
                redirect(array( $this->config->item('default_login_route') . '?notice=login-required&redirect=' . urlencode(current_url()) ));
            }
        }
    }

    /**
     * Check current use group access
    **/

    public function control_dashboard_access()
    {
        $Group    =    Group::get();
        if (! $Group[0]->is_admin) {
            redirect(array( 'page_403' ));
        }
    }
}
new auth_module_class;

require(LIBPATH . '/User.php');
require(LIBPATH . '/Group.php');
require(dirname(__FILE__) . '/inc/dashboard.php');
require(dirname(__FILE__) . '/inc/setup.php');
require(dirname(__FILE__) . '/inc/fields.php');
require(dirname(__FILE__) . '/inc/actions.php');
require(dirname(__FILE__) . '/inc/rules.php');
