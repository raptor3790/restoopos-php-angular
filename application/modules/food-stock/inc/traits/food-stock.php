<?php


trait Food_Stock_Trait
{
    /**
     * Stock Transfert
     * @return json response
    **/

    public function add_stock_post()
    {
        $date_now = date_now();
        $this->db->insert( $this->db->dbprefix . 'food_stock', [
            'NAME'                 =>  $this->post( 'name' ),
            'CODE'            =>  $this->post( 'code' ),
            'UOM'     =>  $this->post( 'uom' ),
            'COST'                  =>  $this->post( 'cost' ),
            'QTY'                  =>  $this->post( 'qty' ),
            'AUTHOR'                =>  User::id(),
            'DATE_CREATION'         =>  $date_now ,
            'DATE_MOD'              => $date_now
        ]);

        $stock_id                =   $this->db->insert_id();

        $this->db->insert($this->db->dbprefix . 'food_stock_history',[
            'AUTHOR'                 =>  User::id(),
            'STOCK_ID'            =>  $stock_id,
            'QTY'     =>  $this->post( 'qty' ),
            'DATE_MOD'                  =>  $date_now
        ]);

        $this->response([
            'transfert_id'  =>  $stock_id
        ], 200 );    
    }

    public function update_stock_post()
    {
        $date_now = date_now();
        $this->db->where('id', $this->post('id'));
        $this->db->update( $this->db->dbprefix . 'food_stock', [
            'NAME'                 =>  $this->post( 'name' ),
            'CODE'            =>  $this->post( 'code' ),
            'UOM'     =>  $this->post( 'uom' ),
            'COST'                  =>  $this->post( 'cost' ),
            'QTY'                  =>  $this->post( 'qty' ),
            'AUTHOR'                =>  User::id(),
            'DATE_MOD'         =>  date_now(),
        ]);

        $this->db->insert($this->db->dbprefix . 'food_stock_history',[
            'AUTHOR'                 =>  User::id(),
            'STOCK_ID'            =>  $this->post('id'),
            'QTY'     =>  $this->post( 'qty' ),
            'DATE_MOD'                  =>  $date_now
        ]);
    }

    public function increase_stock_post(){
        $this->load->module_model('food-stock', 'stock_model');
        $this->stock_model->increase_stock($this->post('id'), $this->post('qty'), User::id());
    }

    /*public function increase_stock_post(){
        $date_now = date_now();
        $this->db->where('id', $this->post('id'));
        $this->db->select('qty');
        $qty = $this->db->get($this->db->dbprefix('food_stock'))->result();
        if(sizeof($qty) > 0){
            $qty = $qty[0];
            $qty = $qty->qty;
        }
        $qty += $this->post('qty');

        $this->db->where('id', $this->post('id'));
        $this->db->update( $this->db->dbprefix . 'food_stock',
            ['QTY' => $qty, 'DATE_MOD' => $date_now]);

        $this->db->insert($this->db->dbprefix . 'food_stock_history',[
            'AUTHOR'                 =>  User::id(),
            'STOCK_ID'            =>  $this->post('id'),
            'QTY'     =>  $this->post( 'qty' ),
            'DATE_MOD'                  =>  $date_now
        ]);

        $this->response([
            'qty'  =>  $qty,
            'date_mod' => $date_now
        ], 200 );
    }*/
}