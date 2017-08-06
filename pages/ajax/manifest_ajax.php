<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];

if ($obj["mode"]=="insert_trip") {

//error_log("\nInside insert_trip", 3, "C:/xampp/apache/logs/error.log");

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
$driver_payable = (isset($obj['driver_payable'])? $obj["driver_payable"] : 'TRUE');
$client_payable = (isset($obj['client_payable'])? $obj["client_payable"] : 'TRUE');

$order=update_orderdriver($orderid,$driverid);
$trip = insert_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$trip_date,$clockperiod,$current_date,$driver_payable,$client_payable);
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
$driver_payable = (isset($obj['driver_payable'])? $obj["driver_payable"] : 'TRUE');
$client_payable = (isset($obj['client_payable'])? $obj["client_payable"] : 'TRUE');

$order=update_orderdriver($orderid,$driverid);
$trip = update_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$trip_date,$trip_id,$driver_payable,$client_payable);
//print_r($trip['id']);
}
if ($obj["mode"]=="savepayroll") {


$driver_id = (int)$obj["driver_id"];
$amount = (float)$obj["amount"];
$startdate = $obj["startdate"];
$enddate = $obj["enddate"];

$order=savepayroll($driver_id,$amount,$startdate,$enddate);
print_r($order);
}
if ($obj["mode"]=="deletepayroll") {

$id = (int)$obj["id"];

$order=deletepayroll($id);
}
?>