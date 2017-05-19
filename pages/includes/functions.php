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

	function select_schools($client_name,$school_type){
		global $connection;

		$query_client  = "SELECT * FROM lpr_client JOIN lpr_school ON lpr_client.client_id=lpr_school.client_id WHERE client_name='$client_name' AND school_type='$school_type'" ;
		$result_client = mysqli_query($connection, $query_client);
		confirm_query($result_client);
		return $result_client;
	}

	function select_school($school_id){
		global $connection;

		$query_client  = "SELECT * FROM lpr_school WHERE school_id = $school_id" ;
		$result_client = mysqli_query($connection, $query_client);
		error_log("Inside query\n" . $query_client , 3, "C:/xampp/apache/logs/error.log");
		confirm_query($result_client);
		if($result = mysqli_fetch_assoc($result_client)) {
			return $result;
		} else {
			return null;
		}
	}
?>