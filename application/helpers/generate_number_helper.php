<?php defined('BASEPATH') OR exit('No direct access script allowed');    
        
function generateNumber($kodeid)
        {
        	$this2 =& get_instance();
        	$kodemmyy = date('my');
            if (!($kodeid) && !($kodemmyy)) {
                exit('invalid param!');
            }

            switch ($kodeid) {
                case '1':
                    $tabel  = "tb_hpp";
                    $kolom  = "quote_no";
                    break;
                case '2':
                	$tabel  = "tb_transaksi";
                    $kolom  = "no_invoice";
                	break;
            }

           $getMaxNumber = $this2->M_hpp->getMaxNumber($tabel,$kolom,$kodemmyy);
           $maxNumber = substr($getMaxNumber[0]['kode'], 2,3);


               $param1 = $kodeid;
               $param2 = 1;
               $param3 = str_pad($maxNumber+1, 3, 0, STR_PAD_LEFT);
               $param4 = $kodemmyy;

            $newNumber = $param1.$param2.$param3.$param4; return $newNumber;

        }