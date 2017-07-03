<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];
$zoneid= $obj['zone'];
$item=$obj['item'];
$amount=$obj['amount'];
insertRate($zoneid,$item,$amount);
?>