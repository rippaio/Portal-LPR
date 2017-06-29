<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];

if ($obj["mode"]=="typedropdown") {

$client_id = (int)$obj["client_id"];
$school_type = $obj["school_type"];
$return_obj = array();
$schools = select_schools($client_id,$school_type);
while($result = mysqli_fetch_assoc($schools)) {
	array_push($return_obj, $result);
}
echo json_encode($return_obj);
}
if ($obj["mode"]=="schooldropdown") {

$school_id = (int)$obj["school_id"];
//$return_obj = array();
$school = select_school($school_id);
echo json_encode($school);
}
if ($obj["mode"]=="tripcost") {

$client_id = (int)$obj["client_id"];
$type = $obj["type"];
$items = $obj["addons"];
//$return_obj = array();
$rate = tripcost($client_id,$type,$items);
print_r($rate['SUM(rate)']);
}
?>