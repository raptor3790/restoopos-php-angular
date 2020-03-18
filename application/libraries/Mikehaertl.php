<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use Mike42\Escpos\Printer;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;

use Mike42\Escpos\EscposImage;
use mikehaertl\wkhtmlto\Image;

class Mikehaertl
{
    public function __construct()
    {
        require_once APPPATH . 'third_party/mikehaertl/autoload.php';
    }

    public function print_receipt($printer_id, $content_view){
        try {
            $connector = new WindowsPrintConnector($printer_id);
            $printer = new Printer($connector);

            $dest = tempnam(sys_get_temp_dir(), 'escpos') . ".png";
            $image = new Image($content_view->output->final_output);
            $image->binary = 'C:\Program Files\wkhtmltopdf\bin\wkhtmltoimage.exe';
            if (!$image->saveAs($dest)) {
                return false;
            }

            /* Load up the image */
            try {
                $img = EscposImage::load($dest);
            } catch (Exception $e) {
                unlink($dest);
                return false;
            }
            $printer -> bitImage($img); // bitImage() seems to allow larger images than graphics() on the TM-T20. bitImageColumnFormat() is another option.
            $printer -> cut();
            
            //unlink($dest);
            $printer->close();
            return true;
        } catch (Exception $e) {
            $printer->close();
            return false;
        }
    }
}
  
