<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


function gmgetdate2($ts = null){
        $k = array('seconds','minutes','hours','mday',
                'wday','mon','year','yday','weekday','month',0);
        return(array_combine($k,explode(":",
                gmdate('s:i:G:j:w:n:Y:z:l:F:U',is_null($ts)?time():$ts))));
        }

$date = new DateTime();
$ts = $date->getTimestamp();

 var_dump(gmgetdate2($ts));

/* on Oct 25, 2019 this outputs:
array(11) { ["seconds"]=> string(2) "19" ["minutes"]=> string(2) "00" ["hours"]=> string(2) "14" ["mday"]=> string(2) "25" ["wday"]=> string(1) "5" ["mon"]=> string(2) "10" ["year"]=> string(4) "2019" ["yday"]=> string(3) "297" ["weekday"]=> string(6) "Friday" ["month"]=> string(7) "October" [0]=> string(10) "1572012019" }
*/

?>