<?php
include("../includes/db_connection.php");
include("../includes/functions.php");
?>
<?php
$obj = $_POST['myData'];

if ($obj["mode"]=="changestatus") {

//error_log("\nInside insert_trip", 3, "C:/xampp/apache/logs/error.log");

$o_id = (int)$obj["o_id"];
$status = $obj["status"];
$return = changeorderstatus($o_id,$status);
echo $return;
}
if ($obj["mode"]=="update") {

// $client_id = (int)$obj["ctypeSelect"];
// $school_id = (int)$obj["sSelect"];
$o_startdate = $obj["o_startdate"];
$o_enddate = $obj["o_enddate"];
$o_status = "active";
$o_ampickloc = $obj["o_ampickloc"];
$o_ampicktime = $obj["o_ampicktime"];
$o_amdroploc = $obj["o_amdroploc"];
$o_amdroptime = $obj["o_amdroptime"];
$o_pmpickloc = $obj["o_pmpickloc"];
$o_pmdroploc = $obj["o_pmdroploc"];
$o_pmpicktime = $obj["o_pmpicktime"];
$o_days = $obj["o_days"];
$o_fd = (isset($obj["o_fd"]) ? 'TRUE' : 'FALSE');
$o_ra = (isset($obj["o_ra"]) ? 'TRUE' : 'FALSE');
$o_wc = (isset($obj["o_wc"]) ? 'TRUE' : 'FALSE');
$o_as = (isset($obj["o_as"]) ? 'TRUE' : 'FALSE');
$driver_id = ((int)$obj["driver_id"]==0? 'NULL' : (int)$obj["driver_id"]) ;
$o_icomment = $obj["icomment"];
$o_dcomment = $obj["dcomment"];
$o_billable = (float)$obj["o_billable"];
$o_reqby = (int)$obj["optradio"];
$o_payable = (float)$obj["o_payable"];
$o_tip = (float)$obj["o_tip"];
$o_id = (int)$obj['o_id'];
$ra_id = ((int)$obj["ra_id"]==0? 'NULL' : (int)$obj["ra_id"]) ;

$order = updateorder($o_enddate,$o_status,$o_ampickloc,$o_ampicktime,$o_amdroploc,$o_amdroptime,$o_pmpickloc,$o_pmdroploc,$o_pmpicktime,$o_days,$o_fd,$o_ra,$o_wc,$o_as,$driver_id,$o_icomment,$o_dcomment,$o_billable,$o_reqby,$o_payable,$o_tip,$o_id,$ra_id);



$s_fname = $obj['s_fname'];
$s_lname = $obj['s_lname'];
$s_grade = $obj['s_grade'];
$s_gender = $obj['s_gender'];
$s_pfname = $obj['pfname'];
$s_plname = $obj['plname'];
$s_phone = $obj['phone'];
$s_altphone = $obj['altphone'];
$s_street = $obj['street'];
$s_address = $obj['address'];
$s_city = $obj['city'];
$s_state = $obj['state'];
$s_zip = $obj['zipcode'];
$s_country = $obj['country'];


$student = updatestudnet($o_id, $s_fname, $s_lname, $s_grade, $s_gender, $s_pfname, $s_plname, $s_phone, $s_altphone, $s_street, $s_address, $s_city, $s_state, $s_zip, $s_country);

$billtype = $obj['billingradio'];

	if ($billtype=='outzone') {
		$billsplit = $obj['billsplit'];
		$billsplitvalue = $obj['billsplitvalue'];
		$billtable = updatetbill_outzone($o_id,$billsplit,$billsplitvalue);
		print_r($o_id);
	}
	if ($billtype=='inzone') {
		
		$billtable = updatebill_inzone($o_id,$o_billable,$o_reqby);
		print_r($o_id);
	}
}
?>