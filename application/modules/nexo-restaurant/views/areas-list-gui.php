<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$this->Gui->col_width(1, 4);

$this->Gui->add_meta( array(
    'col_id'    =>  1,
    'namespace' =>  'nexo-restaurant',
    'type'      =>  'unwrapped'
) );

$this->Gui->add_item( array(
'type'        =>    'dom',
'content'    =>    $crud_content->output
), 'nexo-restaurant', 1 );

$this->Gui->output();
