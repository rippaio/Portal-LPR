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

	
	function insert_client($client_name,  $client_abr, $client_street, $client_address, $client_city, $client_state, $client_zip, $client_country, $client_contact) {
		global $connection;
		
		$query  = "INSERT INTO lpr_client ";
		$query .= "(client_name, client_abr, client_street, client_address, client_city, client_state, client_zip, client_country, client_contact) ";
		$query .= "VALUES ('$client_name',  '$client_abr', '$client_street', '$client_address', '$client_city', '$client_state', $client_zip, '$client_country', '$client_contact') ";
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
	function update_client($client_name,  $client_abr, $client_street, $client_address, $client_city, $client_state, $client_zip, $client_country, $client_contact, $client_id) {
		global $connection;
		
		$query  = "UPDATE lpr_client SET ";
		$query .= "client_name = '$client_name', client_abr = '$client_abr', client_street = '$client_street', client_address = '$client_address' , client_city = '$client_city', client_state = '$client_state', client_zip = $client_zip, client_country ='$client_country', client_contact ='$client_contact' ";
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
		//error_log("Inside query\n" . $query_client , 3, "C:/xampp/apache/logs/error.log");
		confirm_query($result_client);
		if($result = mysqli_fetch_assoc($result_client)) {
			return $result;
		} else {
			return null;
		}
	}

	function tripcost($zone_id,$item){
		global $connection;

		$query = "SELECT SUM(amount) FROM lpr_rates WHERE item IN ('$item') AND zone_id=$zone_id" ;
		error_log("Trip cost\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result_rate = mysqli_query($connection, $query);
		confirm_query($result_rate);
		if($result = mysqli_fetch_assoc($result_rate)) {
			return $result;
		} else {
			return null;
		}
	}

	function tripcost_outzone($zone_id,$zone_id2,$item){
		global $connection;

		$query = "SELECT SUM(amount) FROM lpr_rates WHERE item IN ('$item') AND zone_id=$zone_id OR zone_id=$zone_id2" ;
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
		$query = "INSERT INTO lpr_order(client_id, school_id, o_startdate, o_enddate, o_status, o_ampickloc, o_ampicktime, o_amdroploc, o_amdroptime, o_pmdroploc, o_pmpicktime, o_days, o_fd, o_ra, o_wc, o_as, driver_id, o_icomment, o_dcomment, o_billable, o_reqby, o_payable, o_tip) ";
		$query .= "VALUES ($client_id,  $school_id, '$o_startdate', '$o_enddate', '$o_status', '$o_ampickloc', '$o_ampicktime', '$o_amdroploc', '$o_amdroptime',  '$o_pmdroploc', '$o_pmpicktime', '$o_days', '$o_fd',  '$o_ra', '$o_wc', '$o_as', $driver_id, '$o_icomment', '$o_dcomment', $o_billable, $o_reqby, $o_payable, $o_tip) ";
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
			$amount = (int)$billsplitvalue[$i];
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
		$query = "SELECT driver_id AS value,CONCAT(driver_fname,' ', driver_lname) AS label FROM `lpr_driver` ";
		//error_log("Insert bill\n" . $query , 3, "C:/xampp/apache/logs/error.log");
		$result_client = mysqli_query($connection, $query);
		
		confirm_query($result_client);
		return $result_client;
	}


	/**  Functions by Girish For Manifest */
	function insert_driver($driver_fname,$driver_mname,$driver_lname,$driver_street,$driver_address,$driver_city,$driver_zip,$driver_contact_no,$driver_ssn,$driver_dl_no,$driver_state,$driver_emg_contact,	$driver_commision,$driver_dname,$dl_hiredate,$dl_termdate,$dl_carnumber,$dl_comments,$e_contact_name,$e_contact_reltion,$dl_state,$country){
        global $connection;
        $query  = "INSERT INTO lpr_driver ";
        $query .="(driver_fname,driver_mname,driver_lname,driver_street,driver_address,driver_city,driver_zip,driver_contact_no,driver_ssn,driver_dl_no,driver_state,driver_emg_contact,driver_commision,driver_dname,driver_hiredate,driver_termdate,driver_carnumber,comments,driver_emg_cname,driver_emgcontact_relationship,driver_dl_state,driver_country) ";
        $query.="VALUES ('$driver_fname','$driver_mname','$driver_lname','$driver_street','$driver_address','$driver_city','$driver_zip','$driver_contact_no',$driver_ssn,$driver_dl_no,'$driver_state','$driver_emg_contact',$driver_commision,'$driver_dname','$dl_hiredate','$dl_termdate','$dl_carnumber','$dl_comments','$e_contact_name','$e_contact_reltion','$dl_state','$country')";
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
    $query.="driver_fname='$driver_fname',driver_mname='$driver_mname',driver_lname='$driver_lname',driver_street='$driver_street',driver_address='$driver_address',driver_city='$driver_city',driver_zip='$driver_zip',driver_contact_no='$driver_contact_no',driver_ssn=$driver_ssn,driver_dl_no=$driver_dl_no,driver_state='$driver_state',driver_emg_contact='$driver_emg_contact',driver_commision=$driver_commision,driver_dname='$driver_dname',";
    $query.="driver_hiredate='$dl_hiredate',driver_termdate='$dl_termdate',driver_carnumber='$dl_carnumber',comments='$dl_comments',driver_emg_cname='$e_contact_name',driver_emgcontact_relationship='$e_contact_reltion',driver_dl_state='$dl_state',driver_country='$country'";
    $query .= "WHERE driver_id = $driver_id ";
    $result_id = mysqli_query($connection, $query);
    //error_log("Inside query\n" . $query , 3, "C:/xampp/apache/logs/error.log");
    confirm_query($result_id);
    redirect_to("drivers.php");
}

function  insert_trip($orderid,$clientid,$schoolid,$driverid,$s_id,$city,$time,$pickloc,$picktime,$droptime,$pax,$status,$current_date){
    global $connection;
    $trip_city=trim($city);
    $query  = "INSERT INTO lpr_triplog ";
    $query.="(`triplog_o_id`, `triplog_client_id`, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`,`triplog_city`, `triplog_time`, `triplog_pickloc`, `triplog_picktime`, `triplog_droptime`, `triplog_pax`, `triplog_status`, `triplog_date`) ";
    $query.="VALUES ('$orderid', '$clientid', '$schoolid', '$driverid', '$s_id', '$trip_city', '$time', '$pickloc', '$picktime', '$droptime', '$pax', '$status', '$current_date')";
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

function update_trip($orderid, $clientid, $schoolid, $driverid, $s_id, $city, $time, $pickloc, $droptime, $pax, $status, $current_date,$trip_id){
    global $connection;
    $city=trim($city);
    $query  = "UPDATE lpr_triplog SET ";
    $query.="triplog_client_id=$clientid,triplog_school_id=$schoolid,triplog_driver_id=$driverid,triplog_studentid=$s_id,triplog_city='$city',triplog_time='$time',triplog_pickloc='$pickloc',triplog_droptime='$droptime',triplog_pax='$pax',triplog_status='$status',triplog_o_id=$orderid ";
    $query .= "WHERE triplog_o_id = $orderid and triplog_date='$current_date' and triplog_tripid=$trip_id";
    $result_id = mysqli_query($connection, $query);
    error_log("Inside query\n" . $query , 3, "C:/xampp/apache/logs/error.log");
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
    $query = "SELECT driver_fname FROM lpr_driver where driver_id=$d_id";
    $result_drivername = mysqli_query($connection, $query);
    confirm_query($result_drivername);
    if($result = mysqli_fetch_assoc($result_drivername)) {
        return $result;
    } else {
        return null;
    }

}

?>