<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];
$client_name = $obj["client_name"];
$school_type = $obj["school_type"];
$return_obj = array();
$schools = select_schools($client_name,$school_type);
while($result = mysqli_fetch_assoc($schools)) {
	array_push($return_obj, $result);
}
echo json_encode($return_obj);
?>