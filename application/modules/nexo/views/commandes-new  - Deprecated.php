<?php
$this->Gui->col_width(1, 1);
$this->Gui->col_width(2, 3);
// var_dump( $crud_content );die;
$this->Gui->add_meta(array(
    'namespace'    =>    'produits',
    'type'        =>    'box',
    'col_id'    =>    1,
    'title'        =>    __('Nouvelle commande', 'nexo'),
    'meta_class'=>    array( 'product_box' )
));

$this->Gui->add_meta(array(
    'namespace'    =>    'produit_script',
    'type'        =>    'unwrapped',
    'col_id'    =>    2,
));

$this->Gui->add_item(array(
    'type'        =>    'dom',
    'content'    =>    $this->load->view('../modules/nexo/views/command-dom2', array(), true)
), 'produits', 1);

$this->Gui->add_item(array(
    'type'        =>    'dom',
    'content'    =>    $crud_content->output
), 'produits', 1);

$this->Gui->add_item(array(
    'type'        =>    'dom',
    'content'    =>    $this->load->view('../modules/nexo/views/commandes-dom', array(), true)
), 'produit_script', 2);

$this->Gui->add_item(array(
    'type'        =>    'dom',
    'content'    =>    $this->load->view('../modules/nexo/views/commandes-script', array(), true)
), 'produit_script', 2);

$this->Gui->output();
