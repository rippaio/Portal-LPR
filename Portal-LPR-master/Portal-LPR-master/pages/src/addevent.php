<?php

session_start();
include("./includes/db_connection.php");
include("./includes/functions.php"); 



if(isset($_POST['action']) or isset($_GET['view'])) //show all events

{

    if(isset($_GET['view']))

    {

        header('Content-Type: application/json');

        $event_name = mysqli_real_escape_string($connection,$_GET["event_name"])

        $start_date = mysqli_real_escape_string($connection,$_GET["start_date"]);

        $end_date = mysqli_real_escape_string($connection,$_GET["end_date"]);

        

        $result = mysqli_query($connection,"SELECT event_id, event_name, start_date ,end_date FROM  lpr_calendar where (date(start_date) >= '$start_date' AND date(start_date) <= '$end_date')");

        while($row = mysqli_fetch_assoc($result))

        {

            $events[] = $row; 

        }

        echo json_encode($events); 

        exit;

    }

    elseif($_POST['action'] == "add") // add new event

    {   

        mysqli_query($connection,"INSERT INTO lpr_calendar (

                    event_name ,

                    start_date ,

                    end_date 

                    )

                    VALUES (

                    '".mysqli_real_escape_string($connection,$_POST["event_name"])."',

                    '".mysqli_real_escape_string($connection,date('Y-m-d H:i:s',strtotime($_POST["start_date"])))."',

                    '".mysqli_real_escape_string($connection,date('Y-m-d H:i:s',strtotime($_POST["end_date"])))."'

                    )");

        header('Content-Type: application/json');

        echo '{"event_id":"'.mysqli_insert_id($connection).'"}';

        exit;

    }

    elseif($_POST['action'] == "update")  // update event

    {

        mysqli_query($connection,"UPDATE lpr_calendar set 

            start_date = '".mysqli_real_escape_string($connection,date('Y-m-d H:i:s',strtotime($_POST["start_date"])))."', 

            end_date = '".mysqli_real_escape_string($connection,date('Y-m-d H:i:s',strtotime($_POST["end_date"])))."' ,

            event_name = '".mysqli_real_escape_string($connection,$_POST["event_name"])."'

            where event_id = '".mysqli_real_escape_string($connection,$_POST["event_id"])."'");

        exit;

    }

    elseif($_POST['action'] == "delete")  // remove event

    {

        mysqli_query($connection,"DELETE from events where event_id = '".mysqli_real_escape_string($connection,$_POST["event_id"])."'");

        if (mysqli_affected_rows($connection) > 0) {

            echo "1";

        }

        exit;

    }

}


?>


/*

if(!isset($_SESSION['event']))

{

  $_SESSION['event'] = session_id();

}

$event_id = $_SESSION['event'];          //SET YOUR EVENT ID SETTINGS
$type = $_SESSION['type']
$date = date('c', time());


if(isset($_POST['action']) or isset($_GET['view']))
{

	if(isset($_GET['view']))

	{              // View Events

		header('Content-Type: application/json');
	    $start = mysqli_real_escape_string($connection, $_GET["start"]);
	    $end = mysqli_real_escape_string($connection, $_GET["enchant_dict_get_error(dict)"]);

	    $result = mysqli_query($connection, "SELECT 'event_id', 'date', 'type' FROM 'lpr_calendar' where date = $date");


	    while($row = mysqli_fetch_assoc($result))

	    {

	    	$events[] = $row;



	    }

	    echo json_encode{$events};

	    exit;
	}
	elseif($_POST['action'] == "add")             // add event

	{

      mysqli_query($connection, "INSERT INTO  'lpr_calendar'('date', 'type', 'event_id')  VALUES ('".mysqli_real_escape_string($connection, $_POST["type"])."',

      '".mysqli_real_escape_string($connection, date('Y-m-d H:i:s',strtotime($_POST["date"])))."',
      '".mysqli_real_escape_string($connection, $event_id)."'


      )");

      header('Content-Type: application/json');
      echo  '("id": "'.mysqli_insert_id($connection).'")';
      exit;


	}
	elseif($_POST['action'] == "update")          //update event

       {

      mysqli_query($connection, " UPDATE 'lpr_calendar' set 
      'type' = 	'".mysqli_real_escape_string($connection, $_POST["type"])."',
      'date' =  ".mysqli_real_escape_string($connection, date('Y-m-d H:i:s',strtotime($_POST["date"])))."'
      where event_id = '".mysqli_real_escape_string($connection, $event_id)."'  and id = '".mysqli_real_escape_string($connection, $_POST["id"])."'");

      exit;
  }

  elseif($_POST['action' == "delete"])
  {

   mysqli_query($connection, "DELETE from 'lpr_calendar' where event_id = '".mysqli_real_escape_string($connection, $event_id). and "'id = '".mysqli_real_escape_string($connection, $_POST["id"])."'" );

   exit;

  }


      )");



}

*/