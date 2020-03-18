<?php
class stock_model extends Tendoo_Module
{
    /**
     * Food Stock
     * @param int stock id
     * @return array transfert array
    **/

    public function get( $id = null )
    {
        if( $id != null ) {
            $this->db->where( 'ID', $id );
        } 
        $stock  =   $this->db->get( $this->db->dbprefix . 'food_stock' )->result_array();
        return $stock;
    }

    /** 
     * Get Transfert Items
     * @param int transfert id
     * @return array
    **/

    public function get_with_items( $transfert_id ) 
    {
        return $this->db->where( 'REF_TRANSFER', $transfert_id )
        ->get( 'nexo_stock_transfert_items' )
        ->result_array();
    }

    /**
     * Update Transfert Status
     * @param int transfert id
     * @param int status 0: pending, 1: approuved, 2: rejected
     * @return void
    **/

    public function status( $transfert_id, $status ) 
    {
        $this->db->where( 'ID', $transfert_id )->update( 'nexo_stock_transfert', [
            'APPROUVED'     =>  $status,
            'APPROUVED_BY'  =>  User::id()
        ]);
    }

    public function increase_stock($id, $qty, $user_id){
        $date_now = date_now();
        $this->db->where('id', $id);
        if($qty > 0){
            $strQty = 'QTY+'.$qty;
        }else {
            $strQty = 'QTY' . $qty;
        }

        $this->db->set('QTY', $strQty, FALSE);
        $this->db->update($this->db->dbprefix . 'food_stock');

        $this->db->where('id', $id);
        $this->db->update( $this->db->dbprefix . 'food_stock',
            ['DATE_MOD' => $date_now]);

        $this->db->insert($this->db->dbprefix . 'food_stock_history',[
            'AUTHOR'                 =>  $user_id,
            'STOCK_ID'            =>  $id,
            'QTY'     =>  $qty,
            'DATE_MOD'                  =>  $date_now
        ]);
    }
}