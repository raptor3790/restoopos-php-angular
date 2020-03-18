<?php
$this->Gui->col_width(1, 4);

$this->Gui->add_meta(array(
    'namespace'    =>    'livraisons',
    'type'        =>    'unwrapped',
    'col_id'    =>    1,
    'title'        =>    __('Gestion & Création des livraisons', 'nexo')
));

$this->Gui->add_item(array(
    'type'        =>    'dom',
    'content'    =>    $crud_content->output
), 'livraisons', 1);

$this->Gui->output();
