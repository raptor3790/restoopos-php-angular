<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nexo_Restaurant_Kitchens extends CI_Model
{
    /**
     *  Get Kitchen
     *  @param int kitchen id
     *  @return array
    **/

    public function get( $id = null )
    {
        if( $id != null ) {
            $this->db->where( 'ID', $id );
        }

        $query =    $this->db->get( store_prefix() . 'nexo_restaurant_kitchens' );
        return $query->result_array();
    }

    /**
     *  Get Category Hierarchy
     *  @param int first category id
     *  @return array
    **/

    public function get_category_hierarchy( $catid )
    {
        $categories     =   [];
        // Category Hierarchy
        $category   =   $this->db->where( 'ID', $catid )->get( store_prefix() . 'nexo_categories' )->result_array();

        if( $category ) {
            $categories[]       =   $category[0];
            $categories         =   array_merge(
                $categories,
                $this->get_categories( $category[0][ 'ID' ]
            ) );
        }

        return $categories;
    }

    private function get_categories( $id )
    {
        $categories_ids     =   [];
        $categories         =   $this->db->where( 'PARENT_REF_ID', $id )
        ->get( store_prefix() . 'nexo_categories' )
        ->result_array();

        if( $categories ) {
            foreach( $categories as $category ) {
                $categories_ids[]       =   $category;
                $sub_categories_ids     =   $this->get_categories( $category[ 'ID' ] );

                if( $sub_categories_ids ) {
                    array_merge( $categories_ids, $sub_categories_ids );
                }
            }
        }

        return $categories_ids;
    }

    /** 
	 * Get Kitchens
	 * @param int/void kitchen id
	 * @return array
	**/
	
	public function get_kitchen( $id = null )
	{
		if( $id != null ){
			$this->db->where( 'ID', $id );
		}
		
		return $this->db->get( 'nexo_restaurant_kitchens' )
		->result_array();
	}
	
	/**
	 * Get Printer
	 *
	 * @return Array
	**/
	
	public function get_printer()
	{
		if( function_exists( 'printer_list' ) ) {
			
			// ob_start();
			
			$printers				=	printer_list( PRINTER_ENUM_LOCAL );
			
			$fake_printers			=	$printers;
		
			$printers_namespaces	=	array();
						
			if( is_array( $printers ) ) {
				foreach( $printers as $printer ) {
					$printers_namespaces[ $printer[ 'NAME' ] ] 	=	$printer[ 'NAME' ];
				}
			}

			return $printers_namespaces;
		}
		return array();
	}
}
