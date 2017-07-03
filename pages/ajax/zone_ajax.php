<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];
$zone_loc = $obj["zoneloc"];
addZone($zone_loc);

?>