<?php

	function confirm_query($result_set) {
		if (!$result_set) {
			die("Database query failed.");
		}
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
		// if($result_id) {
		// 	$_SESSION["message"] = "User Created";
		// 	return true;

		// } else {
		// 	$_SESSION["message"] = "Database Error";
		// 	return false;
		// }
		
	}

?>