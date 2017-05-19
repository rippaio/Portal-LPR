<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];

if ($obj["mode"]=="typedropdown") {

$client_name = $obj["client_name"];
$school_type = $obj["school_type"];
$return_obj = array();
$schools = select_schools($client_name,$school_type);
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
?>