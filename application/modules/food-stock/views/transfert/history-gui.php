<?php
$this->Gui->col_width(1, 4);

$this->Gui->add_meta(array(
    'type'			=>    'unwrapped',
    'col_id'		=>    1,
    'namespace'	=>    'foodstock_list'
));

$this->Gui->add_item( array(
    'type'          =>    'dom',
    'content'       =>    $crud->output
), 'foodstock_list', 1 );

$this->Gui->output();