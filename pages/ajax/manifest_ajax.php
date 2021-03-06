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
$period = (isset($obj['period'])? $obj['period'] : 'NULL');

if (isset($obj['period'])){
$order=update_orderdriver($orderid,$driverid,$period,$trip_date);
}
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
$period = (isset($obj['period'])? $obj['period'] : 'NULL');
if (isset($obj['period'])){
$order=update_orderdriver($orderid,$driverid,$period,$trip_date);
}
$trip = update_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$trip_date,$trip_id,$driver_payable,$client_payable);
//print_r($trip['id']);
}
if ($obj["mode"]=="savepayroll") {
$driver_id = (int)$obj["driver_id"];
$amount =  number_format($obj["amount"], 2, '.', '');
$startdate = $obj["startdate"];
$enddate = $obj["enddate"];
$totalBilling=$obj["totalBilling"];
$payToContractorsPerc=$obj["payToContractorsPerc"];
$payToContractors  = $obj["payToContractors"];
$tips=$obj["tips"];
$additions=$obj["additions"];
$contractorsTotal=$obj["contractorsTotal"];
$fuelAdvance=$obj["fuelAdvance"];
$toll= $obj["toll"];
$leasePerc=$obj["leasePerc"];
$lease=$obj["lease"];
$others= $obj["others"];
$checkNumber=$obj["checkNumber"];
    error_log("\ntbill  payroll  " . $totalBilling, 3, "C:/xampp/apache/logs/error.log");
    var_dump($amount);
    error_log("\nSaving payroll amount " . $amount, 3, "C:/xampp/apache/logs/error.log");

$order=savepayroll($driver_id,$amount,$startdate,$enddate,$totalBilling,$payToContractorsPerc,$payToContractors,$tips,$additions,$contractorsTotal,$fuelAdvance,$toll,$leasePerc,$lease,$others,$checkNumber);
print_r($order);
}

// Client Bill Save
if ($obj["mode"]=="saveClientBill") {
    $c_id = $obj["c_id"];
    $enddate = $obj["enddate"];
    $startdate=$obj["startdate"];
    $totaltrips=$obj["totaltrips"];
    $totalbillable= $obj["totalbillable"];
    saveClientBill($c_id,$startdate,$enddate,$totaltrips,$totalbillable);
}

// Client Bill Update
if ($obj["mode"]=="UpdateClientBill") {
    $invoiceid= $obj["invoiceId"];
    $c_id = $obj["c_id"];
    $enddate = $obj["enddate"];
    $startdate=$obj["startdate"];
    $totaltrips=$obj["totaltrips"];
    $totalbillable= $obj["totalbillable"];
    updateClientBill($invoiceid,$totaltrips,$totalbillable);
}


if ($obj["mode"]=="deletepayroll") {

$id = (int)$obj["id"];

$order=deletepayroll($id);
}

//Delete Bill
if ($obj["mode"]=="deleteBill") {

    $id = (int)$obj["id"];

    $order=deleteBill($id);
}



//Update Payroll From Driver Billing System
if ($obj["mode"]=="updatepayroll") {
    $pay_id=$obj["pay_id"];
    $driver_id = (int)$obj["driver_id"];
    $amount = (float)$obj["amount"];
    $startdate = $obj["startdate"];
    $enddate = $obj["enddate"];
    $totalBilling=$obj["totalBilling"];
    $payToContractorsPerc=$obj["payToContractorsPerc"];
    $payToContractors  = $obj["payToContractors"];
    $tips=$obj["tips"];
    $additions=$obj["additions"];
    $contractorsTotal=$obj["contractorsTotal"];
    $fuelAdvance=$obj["fuelAdvance"];
    $toll= $obj["toll"];
    $leasePerc=$obj["leasePerc"];
    $lease=$obj["lease"];
    $others= $obj["others"];
    $checkNumber=$obj["checkNumber"];
    error_log("\nUpdate  payroll  " . $totalBilling, 3, "C:/xampp/apache/logs/error.log");

    $order=updatePayroll($pay_id,$amount,$startdate,$enddate,$payToContractorsPerc,$payToContractors,$additions,$contractorsTotal,$fuelAdvance,$toll,$leasePerc,$lease,$others,$checkNumber);
}
//Update Payroll From Driver Billing System ends

?>