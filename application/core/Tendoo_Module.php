<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tendoo_Module extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        //Codeigniter : Write Less Do More
    }

    public function module_view( $namespace, $view, $params, $return )
    {
        return $this->load->module_view( $namespace, $view, $params, $return );
    }

}
