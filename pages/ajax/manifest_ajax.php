<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];

if ($obj["mode"]=="insert_trip") {

$clientid = (int)$obj["clientid"];
$orderid = (int)$obj["orderid"];
$schoolid = (int)$obj["schoolid"];
$driverid = (int)$obj["driverid"];
$s_id = (int)$obj["s_id"];
$city = $obj["city"];
$time = $obj["time"];
$pickloc = $obj["pickloc"];
$picktime = $obj["picktime"];
$droptime = '00:00:00';
$pax = $obj["pax"];
$status = $obj["status"];
$current_date = $obj["current_date"];

$trip = insert_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$current_date);
print_r($trip['id']);
}

if ($obj["mode"]=="update_trip") {

$clientid = (int)$obj["clientid"];
$orderid = (int)$obj["orderid"];
$schoolid = (int)$obj["schoolid"];
$driverid = (int)$obj["driverid"];
$s_id = (int)$obj["s_id"];
$city = $obj["city"];
$time = $obj["time"];
$pickloc = $obj["pickloc"];
//$picktime = $obj["picktime"];
$droptime = $obj["droptime"];
$pax = $obj["pax"];
$status = $obj["status"];
$current_date = $obj["current_date"];
$trip_id = (int)$obj['trip_id'];

$trip = update_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$droptime,$pax,$status,$current_date,$trip_id);
//print_r($trip['id']);
}
?>