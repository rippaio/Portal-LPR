<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];

if ($obj["mode"]=="insert_trip") {

error_log("\nInside insert_trip", 3, "C:/xampp/apache/logs/error.log");

$clientid = (int)$obj["clientid"];
$orderid = (int)$obj["orderid"];
$schoolid = (int)$obj["schoolid"];
$driverid = (int)$obj["driverid"];
$s_id = (int)$obj["s_id"];
$city = $obj["city"];
$time = $obj["time"];
$pickloc = $obj["pickloc"];
$picktime = $obj["picktime"];
$droptime = $obj["droptime"];
$pax = $obj["pax"];
$status = $obj["status"];
$current_date = $obj["current_date"];
$trip_date = $obj["trip_date"];
$clockperiod = $obj['clockperiod'];

$trip = insert_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$trip_date,$clockperiod,$current_date);
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
$picktime = $obj["picktime"];
$droptime = $obj["droptime"];
$pax = $obj["pax"];
$status = $obj["status"];
$trip_date = $obj["trip_date"];
$trip_id = (int)$obj['trip_id'];

$trip = update_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$trip_date,$trip_id);
//print_r($trip['id']);
}
?>