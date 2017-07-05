<?php

	function confirm_query($result_set) {
		if (!$result_set) {
			die("Database query failed.");
		}
	}

	function redirect_to($new_location) {
	  	header("Location: " . $new_location);
	  	exit;
	}

	function verify_input($data) {
		global $connection;
  		$data = htmlspecialchars($data);
  		$data = mysqli_real_escape_string($connection,$data);
  		return $data;
    }
    function verify_input_login($data) {
		global $connection;
  		$data = mysqli_real_escape_string($connection,$data);
  		return $data;
    }
	
	function verify_output($data) {

  		$data = stripcslashes($data);
  		$data = htmlspecialchars_decode($data);
  		return $data;
    }
    function verify_output_login($data) {

  		$data = stripcslashes($data);
  		return $data;
    }

	
	function insert_client($client_name,  $client_abr, $client_street, $client_address, $client_city, $client_state, $client_zip, $client_country, $client_contact,$client_zone) {
		global $connection;
		
		$query  = "INSERT INTO lpr_client ";
		$query .= "(client_name, client_abr, client_street, client_address, client_city, client_state, client_zip, client_country, client_contact, zone_id) ";
		$query .= "VALUES ('$client_name',  '$client_abr', '$client_street', '$client_address', '$client_city', '$client_state', $client_zip, '$client_country', '$client_contact', $client_zone) ";
		//echo $query;
		$result_id = mysqli_query($connection, $query);
		//error_log("Inside query\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		confirm_query($result_id);
		redirect_to("schooldata.php");
		// if($result_id) {
		// 	$_SESSION["message"] = "User Created";
		// 	return true;

		// } else {
		// 	$_SESSION["message"] = "Database Error";
		// 	return false;
		// }
		
	}
	function select_client($client_id){
		global $connection;

		$query_client  = "SELECT * FROM lpr_client WHERE client_id = $client_id" ;
		$result_client = mysqli_query($connection, $query_client);
		confirm_query($result_client);
		if($result = mysqli_fetch_assoc($result_client)) {
			return $result;
		} else {
			return null;
		}
	}
	function update_client($client_name,  $client_abr, $client_street, $client_address, $client_city, $client_state, $client_zip, $client_country, $client_contact, $client_id,$client_zone) {
		global $connection;
		
		$query  = "UPDATE lpr_client SET ";
		$query .= "client_name = '$client_name', client_abr = '$client_abr', client_street = '$client_street', client_address = '$client_address' , client_city = '$client_city', client_state = '$client_state', client_zip = $client_zip, client_country ='$client_country', client_contact ='$client_contact', zone_id= $client_zone ";
		$query .= "WHERE client_id = $client_id ";
		//echo $query;
		$result_id = mysqli_query($connection, $query);
		
		confirm_query($result_id);
		redirect_to("schooldata.php");

		
	}

	function select_schools($client_id,$school_type){
		global $connection;

		$query_client  = "SELECT * FROM lpr_client JOIN lpr_school ON lpr_client.client_id=lpr_school.client_id WHERE lpr_school.client_id=$client_id AND school_type='$school_type'" ;
		$result_client = mysqli_query($connection, $query_client);
		error_log("Inside query\n" . $query_client , 3, "C:/xampp/apache/logs/error.log");
		confirm_query($result_client);
		return $result_client;
	}

	function select_school($school_id){
		global $connection;

		$query_client  = "SELECT * FROM lpr_school WHERE school_id = $school_id" ;
		$result_client = mysqli_query($connection, $query_client);
		confirm_query($result_client);
		if($result = mysqli_fetch_assoc($result_client)) {
			return $result;
		} else {
			return null;
		}
	}

	function tripcost($zone_id,$item,$additems){
		global $connection;

		$query = "SELECT SUM(amount) FROM lpr_rates WHERE (item  ='$item' AND zone_id=$zone_id) OR item IN ('$additems') ";
		error_log("Trip cost\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result_rate = mysqli_query($connection, $query);
		confirm_query($result_rate);
		if($result = mysqli_fetch_assoc($result_rate)) {
			return $result;
		} else {
			return null;
		}
	}

	function tripcost_outzone($zone_id,$item,$additems){
		global $connection;

		$query = "SELECT SUM(amount) FROM lpr_rates WHERE (item IN ('$item') AND zone_id IN ($zone_id)) OR item IN ('$additems')" ;
		error_log("Trip ot cost\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result_rate = mysqli_query($connection, $query);
		confirm_query($result_rate);
		if($result = mysqli_fetch_assoc($result_rate)) {
			return $result;
		} else {
			return null;
		}
	}

	function createorder($client_id,$school_id,$o_startdate,$o_enddate,$o_status,$o_ampickloc,$o_ampicktime,$o_amdroploc,$o_amdroptime,$o_pmpickloc,$o_pmdroploc,$o_pmpicktime,$o_days,$o_fd,$o_ra,$o_wc,$o_as,$driver_id,$o_icomment,$o_dcomment,$o_billable,$o_reqby,$o_payable,$o_tip){

		global $connection;
		$query = "INSERT INTO lpr_order(client_id, school_id, o_startdate, o_enddate, o_status, o_ampickloc, o_ampicktime, o_amdroploc, o_amdroptime, o_pmpickloc, o_pmdroploc, o_pmpicktime, o_days, o_fd, o_ra, o_wc, o_as, driver_id, o_icomment, o_dcomment, o_billable, o_reqby, o_payable, o_tip) ";
		$query .= "VALUES ($client_id,  $school_id, '$o_startdate', '$o_enddate', '$o_status', '$o_ampickloc', '$o_ampicktime', '$o_amdroploc', '$o_amdroptime', '$o_pmpickloc', '$o_pmdroploc', '$o_pmpicktime', '$o_days', '$o_fd',  '$o_ra', '$o_wc', '$o_as', $driver_id, '$o_icomment', '$o_dcomment', $o_billable, $o_reqby, $o_payable, $o_tip) ";
		error_log("Insert order\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);
		$query_id = "SELECT LAST_INSERT_ID() AS o_id ";
		$result_id = mysqli_query($connection, $query_id);
		confirm_query($result_id);
		if($result_oid = mysqli_fetch_assoc($result_id)) {
			return $result_oid;
		} else {
			return null;
		}
		//redirect_to("schooldata.php");
	}
	function createstudnet($o_id, $s_fname, $s_lname, $s_grade, $s_gender, $s_pfname, $s_plname, $s_phone, $s_altphone, $s_street, $s_address, $s_city, $s_state, $s_zip, $s_country)
	{
		global $connection;

		if (is_array($s_fname)){
			for ($i=0; $i < sizeof($s_fname); $i++) {

			$fname = $s_fname[$i];
			$lname = $s_lname[$i];
			$grade = $s_grade[$i];
			$gender = $s_gender[$i];

			$query = "INSERT INTO lpr_student(o_id, s_fname, s_lname, s_grade, s_gender, s_pfname, s_plname, s_phone, s_altphone, s_street, s_address, s_city, s_state, s_zip, s_country) ";
			$query .= "VALUES ($o_id, '$fname', '$lname', '$grade', '$gender', '$s_pfname', '$s_plname', '$s_phone',  '$s_altphone', '$s_street', '$s_address', '$s_city',  '$s_state', '$s_zip', '$s_country') ";
			error_log("Insert student\n" . $query.sizeof($s_fname) , 3, "C:/xampp/apache/logs/error.log");
			$result = mysqli_query($connection, $query);
			
			confirm_query($result);
			}
		}
		else{

			$query = "INSERT INTO lpr_student(o_id, s_fname, s_lname, s_grade, s_gender, s_pfname, s_plname, s_phone, s_altphone, s_street, s_address, s_city, s_state, s_zip, s_country) ";
			$query .= "VALUES ($o_id, '$s_fname', '$s_lname', '$s_grade', '$s_gender', '$s_pfname', '$s_plname', '$s_phone',  '$s_altphone', '$s_street', '$s_address', '$s_city',  '$s_state', '$s_zip', '$s_country') ";
			error_log("Insert student\n" . $query.sizeof($s_fname) , 3, "C:/xampp/apache/logs/error.log");
			$result = mysqli_query($connection, $query);
			
			confirm_query($result);
		}
		
	}


	function insertbill_outzone($o_id,$billsplit,$billsplitvalue)
	{
		global $connection;
		$j = 0;
		for ($i=0; $i < sizeof($billsplitvalue); $i++) {
			if ((int)$billsplitvalue[$i] > 0) {
			 
			$client_id = (int)$billsplit[$j];
			$amount = (float)$billsplitvalue[$i];
			$query = "INSERT INTO lpr_billing(o_id, client_id, amount) VALUES ($o_id,$client_id,$amount) ";
			error_log("Insert bill\n" . $query , 3, "C:/xampp/apache/logs/error.log");
			$result = mysqli_query($connection, $query);
			
			confirm_query($result);
			$j = $j + 1;	
			}
		} 
	}

	function insertbill_inzone($o_id,$o_billable,$o_reqby)
	{
		global $connection;
		$query = "INSERT INTO lpr_billing(o_id, client_id, amount) VALUES ($o_id,$o_reqby,$o_billable) ";
		error_log("Insert bill\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);


	}


	function driverdetails()
	{
		global $connection;
		$query = "SELECT driver_id AS value,CASE WHEN driver_dname = ' ' THEN CONCAT(driver_fname,' ', driver_lname) ELSE CONCAT(driver_fname,' ', driver_lname,'(',driver_dname,')') END AS label FROM `lpr_driver` ";
		//error_log("Insert bill\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result_client = mysqli_query($connection, $query);
		
		confirm_query($result_client);
		return $result_client;
	}

	function update_orderdriver($orderid,$driverid)
	{
		global $connection;
		$query  = "UPDATE lpr_order SET ";
		$query .= "driver_id= $driverid ";
		$query .= "WHERE o_id = $orderid ";
		//echo $query;
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);
	}


	/**  Functions by Girish For Manifest */
	function insert_driver($driver_fname,$driver_mname,$driver_lname,$driver_street,$driver_address,$driver_city,$driver_zip,$driver_contact_no,$driver_ssn,$driver_dl_no,$driver_state,$driver_emg_contact,	$driver_commision,$driver_dname,$dl_hiredate,$dl_termdate,$dl_carnumber,$dl_comments,$e_contact_name,$e_contact_reltion,$dl_state,$country){
        global $connection;
        $query  = "INSERT INTO lpr_driver ";
        $query .="(driver_fname,driver_mname,driver_lname,driver_street,driver_address,driver_city,driver_zip,driver_contact_no,driver_ssn,driver_dl_no,driver_state,driver_emg_contact,driver_commision,driver_dname,driver_hiredate,driver_termdate,driver_carnumber,comments,driver_emg_cname,driver_emgcontact_relationship,driver_dl_state,driver_country) ";
        $query.="VALUES ('$driver_fname','$driver_mname','$driver_lname','$driver_street','$driver_address','$driver_city','$driver_zip','$driver_contact_no',$driver_ssn,'$driver_dl_no','$driver_state','$driver_emg_contact',$driver_commision,'$driver_dname','$dl_hiredate','$dl_termdate','$dl_carnumber','$dl_comments','$e_contact_name','$e_contact_reltion','$dl_state','$country')";
        $result_id = mysqli_query($connection, $query);
//        //echo $query;
//        //error_log("Inside query\n" . $query , 3, "C:/xampp/apache/logs/error.log");
        confirm_query($result_id);
        redirect_to("drivers.php");

    }


function select_driver($driver_id){
    global $connection;

    $query_client  = "SELECT * FROM lpr_driver WHERE driver_id = $driver_id" ;
    $result_client = mysqli_query($connection, $query_client);
    confirm_query($result_client);
    if($result = mysqli_fetch_assoc($result_client)) {
        return $result;
    } else {
        return null;
    }
}

function update_driver($driver_fname,$driver_mname,$driver_lname,$driver_street,$driver_address,$driver_city,$driver_zip,$driver_contact_no,$driver_ssn,$driver_dl_no,$driver_state,$driver_emg_contact,$driver_commision,$driver_dname,$dl_hiredate,$dl_termdate,$dl_carnumber,$dl_comments,$e_contact_name,$e_contact_reltion,$dl_state,$country,$driver_id){
    global $connection;
    $query  = "UPDATE lpr_driver SET ";
    $query.="driver_fname='$driver_fname',driver_mname='$driver_mname',driver_lname='$driver_lname',driver_street='$driver_street',driver_address='$driver_address',driver_city='$driver_city',driver_zip='$driver_zip',driver_contact_no='$driver_contact_no',driver_ssn=$driver_ssn,driver_dl_no='$driver_dl_no',driver_state='$driver_state',driver_emg_contact='$driver_emg_contact',driver_commision=$driver_commision,driver_dname='$driver_dname',";
    $query.="driver_hiredate='$dl_hiredate',driver_termdate='$dl_termdate',driver_carnumber='$dl_carnumber',comments='$dl_comments',driver_emg_cname='$e_contact_name',driver_emgcontact_relationship='$e_contact_reltion',driver_dl_state='$dl_state',driver_country='$country'";
    $query .= "WHERE driver_id = $driver_id ";
    $result_id = mysqli_query($connection, $query);
    //error_log("Inside query\n" . $query , 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result_id);
    redirect_to("drivers.php");
}

function  insert_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$trip_date,$clockperiod,$current_date,$driver_payable,$client_payable){
    global $connection;
    $trip_city=trim($city);
    $query  = "INSERT INTO lpr_triplog ";
    $query.="(`triplog_o_id`, `triplog_client_id`, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`,`triplog_city`, `triplog_time`, `triplog_pickloc`, `triplog_picktime`, `triplog_droptime`, `triplog_pax`, `triplog_status`, `triplog_date`, triplog_clock, triplog_date_updated, triplog_driver_payable, triplog_client_payable ) ";
    $query.="VALUES ('$orderid', '$clientid', '$schoolid', '$driverid', '$s_id', '$trip_city', '$time', '$pickloc', '$picktime', '$droptime', '$pax', '$status', '$trip_date', '$clockperiod', '$current_date', '$driver_payable', '$client_payable')";
     error_log("\nInside insert_trip" . $query , 3, "C:/xampp/apache/logs/error.log");
    $result_id = mysqli_query($connection, $query);
    confirm_query($result_id);
    
    //redirect_to("manifest.php");
    $query_id = "SELECT LAST_INSERT_ID() AS id ";
		$result_id = mysqli_query($connection, $query_id);
		confirm_query($result_id);
		if($result_oid = mysqli_fetch_assoc($result_id)) {
			return $result_oid;
		} else {
			return null;
		}
}

function update_trip($orderid, $clientid, $schoolid, $driverid, $s_id, $city, $time, $pickloc, $picktime, $droptime, $pax, $status, $trip_date,$trip_id,$driver_payable,$client_payable){
    global $connection;
    $city=trim($city);
    $query  = "UPDATE lpr_triplog SET ";
    $query.="triplog_client_id=$clientid,triplog_school_id=$schoolid,triplog_driver_id=$driverid,triplog_studentid=$s_id,triplog_city='$city',triplog_time='$time',triplog_pickloc='$pickloc',triplog_picktime='$picktime',triplog_droptime='$droptime',triplog_pax='$pax',triplog_status='$status',triplog_o_id=$orderid , triplog_driver_payable='$driver_payable' , triplog_client_payable = '$client_payable'";
    $query .= "WHERE triplog_o_id = $orderid and triplog_date='$trip_date' and triplog_tripid=$trip_id";
    $result_id = mysqli_query($connection, $query);
    error_log("\nInside query" . $query , 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result_id);
    //redirect_to("manifest.php");

}

function getAllTripData(){
    global $connection;
    $query_trip = "SELECT * FROM lpr_triplog";
    $result_trip = mysqli_query($connection, $query_trip);
    confirm_query($result_trip);
    return $result_trip;

}

function get_studentname($s_id){
    global $connection;
    $query = "SELECT s_fname FROM lpr_student where s_id=$s_id";
    $result_studentname = mysqli_query($connection, $query);
    confirm_query($result_studentname);
    if($result = mysqli_fetch_assoc($result_studentname)) {
        return $result;
    } else {
        return null;
    }
}

function get_drivername($d_id){
    global $connection;
    $query = "SELECT CONCAT(driver_fname,' ',driver_lname) as driver_name FROM lpr_driver where driver_id=$d_id";
    $result_drivername = mysqli_query($connection, $query);
    confirm_query($result_drivername);
    if($result = mysqli_fetch_assoc($result_drivername)) {
        return $result;
    } else {
        return null;
    }

}

//Changeorder

function changeorderstatus($o_id,$status){
	global $connection;
    $query = "UPDATE lpr_order SET o_status = '$status' WHERE o_id = $o_id";
    $result = mysqli_query($connection, $query);
    error_log("\nInside changeorderstatus" . $query , 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result);
    return $result;
}

	function updateorder($o_enddate,$o_status,$o_ampickloc,$o_ampicktime,$o_amdroploc,$o_amdroptime,$o_pmpickloc,$o_pmdroploc,$o_pmpicktime,$o_days,$o_fd,$o_ra,$o_wc,$o_as,$driver_id,$o_icomment,$o_dcomment,$o_billable,$o_reqby,$o_payable,$o_tip,$o_id){

		global $connection;
		$query = "UPDATE lpr_order SET o_enddate='$o_enddate', o_status='$o_status', o_ampickloc='$o_ampickloc', o_ampicktime='$o_ampicktime', o_amdroploc='$o_amdroploc', o_amdroptime='$o_amdroptime',o_pmpickloc='$o_pmpickloc', o_pmdroploc='$o_pmdroploc', o_pmpicktime='$o_pmpicktime', o_days='$o_days', o_fd='$o_fd', o_ra='$o_ra', o_wc='$o_wc', o_as='$o_as', driver_id=$driver_id, o_icomment='$o_icomment', o_dcomment='$o_dcomment', o_billable=$o_billable, o_reqby=$o_reqby, o_payable=$o_payable, o_tip= $o_tip WHERE o_id = $o_id";
		error_log("Insert order\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);
		$query_id = "SELECT LAST_INSERT_ID() AS o_id ";
		$result_id = mysqli_query($connection, $query_id);
		confirm_query($result_id);
		if($result_oid = mysqli_fetch_assoc($result_id)) {
			return $result_oid;
		} else {
			return null;
		}
		//redirect_to("schooldata.php");
	}
	function updatestudnet($o_id, $s_fname, $s_lname, $s_grade, $s_gender, $s_pfname, $s_plname, $s_phone, $s_altphone, $s_street, $s_address, $s_city, $s_state, $s_zip, $s_country)
	{
		global $connection;

		if (is_array($s_fname)){
			for ($i=0; $i < sizeof($s_fname); $i++) {

			$fname = $s_fname[$i];
			$lname = $s_lname[$i];
			$grade = $s_grade[$i];
			$gender = $s_gender[$i];

			$query = "UPDATE lpr_student SET s_fname='$fname', s_lname='$lname', s_grade='$grade', s_gender='$gender', s_pfname='$s_pfname', s_plname='$s_plname', s_phone='$s_phone', s_altphone='$s_altphone', s_street='$s_street', s_address='$s_address', s_city='$s_city', s_state='$s_state', s_zip='$s_zip', s_country='$s_country' WHERE o_id = $o_id";
			error_log("Insert student\n" . $query.sizeof($s_fname) , 3, "C:/xampp/apache/logs/error.log");
			$result = mysqli_query($connection, $query);
			
			confirm_query($result);
			}
		}
		else{

			$query = "UPDATE lpr_student SET s_fname='$s_fname', s_lname='$s_lname', s_grade='$s_grade', s_gender='$s_gender', s_pfname='$s_pfname', s_plname='$s_plname', s_phone='$s_phone', s_altphone='$s_altphone', s_street='$s_street', s_address='$s_address', s_city='$s_city', s_state='$s_state', s_zip='$s_zip', s_country='$s_country' WHERE o_id = $o_id";
			error_log("Insert student\n" . $query.sizeof($s_fname) , 3, "C:/xampp/apache/logs/error.log");
			$result = mysqli_query($connection, $query);
			
			confirm_query($result);
		}
		
	}


	function updatetbill_outzone($o_id,$billsplit,$billsplitvalue)
	{
		global $connection;

		$query_del = "DELETE FROM `lpr_billing` WHERE o_id = $o_id";
		error_log("Insert bill\n" . $query_del , 3, "C:/xampp/apache/logs/error.log");
		$result_del = mysqli_query($connection, $query_del);
		
		confirm_query($result_del);

		$j = 0;
		for ($i=0; $i < sizeof($billsplitvalue); $i++) {
			if ((int)$billsplitvalue[$i] > 0) {
			 
			$client_id = (int)$billsplit[$j];
			$amount = (float)$billsplitvalue[$i];
			$query = "INSERT INTO lpr_billing(o_id, client_id, amount) VALUES ($o_id,$client_id,$amount)" ;
			error_log("Insert bill\n" . $query , 3, "C:/xampp/apache/logs/error.log");
			$result = mysqli_query($connection, $query);
			
			confirm_query($result);
			$j = $j + 1;	
			}
		} 
	}

	function updatebill_inzone($o_id,$o_billable,$o_reqby)
	{
		global $connection;
		$query = "UPDATE lpr_billing SET client_id=$o_reqby, amount=$o_billable WHERE o_id = $o_id ";
		error_log("Insert bill\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);


	}

	//Calendar

	function insert_event($title, $startdate, $enddate, $client_id){
		global $connection;
		$query = "INSERT INTO lpr_dates(title,startdate,enddate,client_id) VALUES ('$title', '$startdate', '$enddate', '$client_id') ";
		error_log("Insert event\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);
	}

	function get_event(){
		global $connection;
		$query = "SELECT * FROM lpr_dates LEFT JOIN lpr_client ON lpr_dates.client_id LIKE lpr_client.client_id ";
		error_log("Insert event\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result = mysqli_query($connection, $query);
		
		confirm_query($result);
		return $result;
	}


	// Driver Billing rates and client billing



function  getDriverBill($driver_id,$start_date,$end_date){
    global $connection;
    $query = "(select triplog_date,o_payable,o_tip,CONCAT(s_lname,\" \",s_fname) s_name,triplog_clock from lpr_triplog,lpr_order,lpr_student  WHERE
     lpr_triplog.triplog_o_id=lpr_order.o_id and lpr_triplog.triplog_studentid=lpr_student.s_id and lpr_triplog.triplog_driver_id=$driver_id and triplog_date between '$start_date' and '$end_date' AND triplog_driver_payable in ('TRUE'))
    union
    (select ad_tripdate, ad_payable,ad_tip ,\"Additional Trip\" as s_name,'NA' as triplog_clock  from lpr_additnltrip where ad_driverid=$driver_id and ad_tripdate between '$start_date' and '$end_date')";
    error_log("\nDriver Billing query " . $query, 3, "C:/xampp/apache/logs/error.log");
    $result_bill = mysqli_query($connection, $query);
    confirm_query($result_bill);
    return $result_bill;

//    select triplog_date,o_payable,o_tip,CONCAT(s_lname,\" \",s_fname) s_name from lpr_triplog,lpr_order,lpr_student  WHERE
//lpr_triplog.triplog_o_id=lpr_order.o_id and lpr_triplog.triplog_studentid=lpr_student.s_id and lpr_triplog.triplog_driver_id=$driver_id and triplog_date between '$start_date' and '$end_date' AND triplog_status in ('success')
}

function insertCashAdvance($driver_id,$cash_advance,$type){
    global $connection;
    $query= "INSERT INTO lpr_cashadvance(`c_driverid`, `c_payable`, `c_Date`, `c_type`) VALUES ($driver_id,$cash_advance,CURRENT_DATE,'$type')";
    error_log("\ninsert Driver cash Advance  " . $query, 3, "C:/xampp/apache/logs/error.log");
    $result_id = mysqli_query($connection, $query);
    confirm_query($result_id);
}

function insert_additnlTrip($driverid,$ad_payable,$ad_tip,$ad_tripdate){
    global $connection;
    $query= "INSERT INTO lpr_additnltrip (ad_driverid, ad_payable, ad_tip, ad_tripdate) VALUES ($driverid,$ad_payable,$ad_tip,'$ad_tripdate')";
    error_log("\ninsert Driver additnal trip  " . $query, 3, "C:/xampp/apache/logs/error.log");
    $result_id = mysqli_query($connection, $query);
    confirm_query($result_id);
}

function  getCashAdvance($driver_id,$start_date,$end_date){
    global $connection;
    $query="select coalesce(t1.debit,0)-coalesce(t2.credit,0) as cashAdvance from
(SELECT sum(c_payable) as debit from lpr_cashadvance where c_driverid=$driver_id and c_type='debit' )t1,
(SELECT sum(c_payable) as credit from lpr_cashadvance where c_driverid=$driver_id and c_type='credit')t2";
    $result = mysqli_query($connection, $query);
    confirm_query($result);
    if($resultvalue = mysqli_fetch_assoc($result)) {
        return $resultvalue;
    } else {
        return 0;
    }

}

function getClientBill($cb_client,$cb_stypeSelect ,$cb_sSelect,$cb_sname,$cb_startdate,$cb_enddate){
    global $connection;
//    $query="SELECT `triplog_o_id`, `triplog_client_id`, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`,`triplog_time`, `triplog_pickloc`, `triplog_date`,o_billable,CONCAT(driver_lname,' ',driver_fname) as d_name,client_name,CONCAT(s_lname,' ',s_fname) as s_name,school_name, CASE WHEN triplog_clock='AM' then o_ampickloc else o_pmpickloc end pickloc, CASE WHEN triplog_clock='AM' then o_amdroploc else o_pmdroploc end as droploc FROM `lpr_triplog`,lpr_order,lpr_driver,lpr_student,lpr_client,lpr_school
// WHERE  triplog_o_id=lpr_order.o_id and  triplog_driver_id=lpr_driver.driver_id and triplog_studentid=lpr_student.s_id and  triplog_client_id=lpr_client.client_id and
// triplog_school_id=lpr_school.school_id and  triplog_client_id=$cb_client and triplog_date between '$cb_startdate' and '$cb_enddate' and triplog_client_payable in ('TRUE')";
    $query=" SELECT `triplog_o_id`, lpr_billing.client_id as triplog_client_id, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`,`triplog_time`, `triplog_pickloc`, `triplog_date`,lpr_billing.amount as o_billable,
 CONCAT(driver_lname,' ',driver_fname) as d_name,client_name,CONCAT(s_lname,' ',s_fname) as s_name,school_name, CASE WHEN triplog_clock='AM' then o_ampickloc else o_pmpickloc end pickloc,
 CASE WHEN triplog_clock='AM' then o_amdroploc else o_pmdroploc end as droploc 
 FROM `lpr_triplog`,lpr_order,lpr_driver,lpr_student,lpr_client,lpr_school,lpr_billing
 WHERE
 triplog_o_id=lpr_order.o_id and  triplog_driver_id=lpr_driver.driver_id and triplog_studentid=lpr_student.s_id
 and lpr_billing.o_id=triplog_o_id and lpr_billing.client_id=$cb_client and lpr_client.client_id=lpr_billing.client_id and
 triplog_school_id=lpr_school.school_id and triplog_date between '$cb_startdate' and '$cb_enddate' and
 triplog_client_payable in ('TRUE') and lpr_order.o_status in ('active')";
    if(!empty($cb_stypeSelect)){
        $query .=" and school_type='$cb_stypeSelect'";
    }
    if(!empty($cb_sSelect)){
        $query .=" and lpr_school.school_id=$cb_sSelect";
    }
    if(!empty($cb_sname)){
        $query .=" and s_fname='$cb_sname'";
    }
    $result = mysqli_query($connection, $query);
    error_log("\nClient Billing Query " . $query, 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result);
    return $result;
}

function getClientPayement($cb_client,$cb_stypeSelect ,$cb_sSelect,$cb_sname,$cb_startdate,$cb_enddate){
    global $connection;
//    $query="select count(triplog_o_id) as tripcount ,sum(amount)as totalbillable,client_name,client_street,client_address,client_city,client_state,client_zip from (SELECT `triplog_o_id`, `triplog_client_id`, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`,`triplog_time`, `triplog_pickloc`, `triplog_date`,lpr_billing.amount,CONCAT(driver_lname,' ',driver_fname) as d_name,client_name,client_street,client_address,client_city,client_state,client_zip,CONCAT(s_lname,' ',s_fname) as s_name,school_name, CASE WHEN triplog_clock='AM' then o_ampickloc else o_pmpickloc end pickloc, CASE WHEN triplog_clock='AM' then o_amdroploc else o_pmdroploc end as droploc FROM `lpr_triplog`,lpr_order,lpr_driver,lpr_student,lpr_client,lpr_school,lpr_billing
// WHERE  triplog_o_id=lpr_order.o_id and  triplog_driver_id=lpr_driver.driver_id and triplog_studentid=lpr_student.s_id and  triplog_client_id=lpr_client.client_id and lpr_billing.o_id=triplog_o_id and lpr_billing.client_id=$cb_client and
// triplog_school_id=lpr_school.school_id and  triplog_client_id=$cb_client and triplog_date between '$cb_startdate' and '$cb_enddate' and triplog_client_payable in ('TRUE') and lpr_order.o_status in ('active')";
    $query="select count(triplog_o_id) as tripcount ,sum(o_billable)as totalbillable,client_name,client_street,client_address,client_city,client_state,client_zip from
 ( SELECT `triplog_o_id`, lpr_billing.client_id as triplog_client_id, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`,`triplog_time`, `triplog_pickloc`, `triplog_date`,lpr_billing.amount as o_billable,
 CONCAT(driver_lname,' ',driver_fname) as d_name,client_name,client_street,client_address,client_city,client_state,client_zip,CONCAT(s_lname,' ',s_fname) as s_name,school_name,
 CASE WHEN triplog_clock='AM' then o_ampickloc else o_pmpickloc end pickloc,
 CASE WHEN triplog_clock='AM' then o_amdroploc else o_pmdroploc end as droploc 
 FROM `lpr_triplog`,lpr_order,lpr_driver,lpr_student,lpr_client,lpr_school,lpr_billing
 WHERE
 triplog_o_id=lpr_order.o_id and  triplog_driver_id=lpr_driver.driver_id and triplog_studentid=lpr_student.s_id
 and lpr_billing.o_id=triplog_o_id and lpr_billing.client_id=$cb_client and lpr_client.client_id=lpr_billing.client_id and
 triplog_school_id=lpr_school.school_id and triplog_date between '$cb_startdate' and '$cb_enddate' and
 triplog_client_payable in ('TRUE') and lpr_order.o_status in ('active')";
    if(!empty($cb_stypeSelect)){
        $query .=" and school_type='$cb_stypeSelect'";
    }
    if(!empty($cb_sSelect)){
        $query .=" and lpr_school.school_id=$cb_sSelect";
    }
    if(!empty($cb_sname)){
        $query .=" and s_fname='$cb_sname'";
    }
    $query.=")t1";
    $result = mysqli_query($connection, $query);
    error_log("\nClient Billing Payment Query " . $query, 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result);
    return $result;
}

function addZone($zone_loc){
    global $connection;
    $query= "INSERT INTO lpr_zones(zone_loc) VALUES ('$zone_loc')";
    error_log("\ninsert Zones " . $query, 3, "C:/xampp/apache/logs/error.log");
    $result = mysqli_query($connection, $query);
    confirm_query($result);
}

function insertRate($zoneid,$item,$amount){
    global $connection;
    $query= "INSERT INTO lpr_rates( zone_id, amount, item) VALUES ($zoneid,$amount,'$item')";
    error_log("\ninsert rates " . $query, 3, "C:/xampp/apache/logs/error.log");
    $result = mysqli_query($connection, $query);
    confirm_query($result);

}

function updateRate($rateId,$rate){
    global $connection;
    $query  = "UPDATE lpr_rates SET ";
    $query .= "amount =$rate WHERE rate_id = $rateId ";
    $result_id = mysqli_query($connection, $query);
    confirm_query($result_id);
}

function updateZone($zone_loc,$zone_id){
    global $connection;
    $query  = "UPDATE lpr_zones SET ";
    $query .= "zone_loc ='$zone_loc' WHERE zone_id = $zone_id ";
    $result_id = mysqli_query($connection, $query);
    confirm_query($result_id);
}

//driver_status change
function dr_changestatus($d_id,$status){
    global $connection;
    $query = "UPDATE lpr_driver SET driver_status = '$status' WHERE driver_id = $d_id";
    $result = mysqli_query($connection, $query);
    error_log("\nInside  driver changestatus" . $query , 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result);

}


?>