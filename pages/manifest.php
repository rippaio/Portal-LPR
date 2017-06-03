<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
$c=0;
$query ="(select t1.o_id,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.driver_fname,t1.o_ampicktime as picktime,t1.o_ampickloc as pickloc,t1.o_amdroptime as droptime,t2.pax from( ";
$query.="select lpr_order.o_id,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_driver.driver_id, lpr_school.school_city,lpr_order.o_ampicktime as time,lpr_student.s_fname,lpr_driver.driver_fname,lpr_order.o_ampicktime,lpr_order.o_ampickloc,lpr_order.o_amdroptime from";
$query.=" lpr_order,lpr_driver,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and lpr_order.driver_id=lpr_driver.driver_id and CURRENT_DATE between lpr_order.o_startdate and lpr_order.o_enddate group by lpr_order.o_id) t1 ";
$query.="left join (select lpr_student.o_id,COUNT(lpr_student.s_id) as pax from lpr_student group BY lpr_student.o_id)t2 ";
$query.="on t1.o_id=t2.o_id)";
$query.=" UNION ";
$query.="(select t1.o_id,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.driver_fname,t1.picktime,t1.droploc,t1.droptime,t2.pax from(select lpr_order.o_id,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_driver.driver_id, lpr_school.school_city,lpr_order.o_pmpicktime as time,lpr_student.s_fname,lpr_driver.driver_fname,lpr_order.o_pmpicktime as picktime,lpr_order.o_pmdroploc as droploc,'NA' as droptime from";
$query.=" lpr_order,lpr_driver,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and lpr_order.driver_id=lpr_driver.driver_id and CURRENT_DATE between lpr_order.o_startdate and lpr_order.o_enddate group by lpr_order.o_id) t1";
$query.=" left join (select lpr_student.o_id,COUNT(lpr_student.s_id) as pax from lpr_student group BY lpr_student.o_id)t2";
$query.=" on t1.o_id=t2.o_id)";
$result_triporder = mysqli_query($connection, $query);
$counter=0;
confirm_query($result_triporder);


$result_triplogdata = getAllTripData();
//$po =$_POST["city"];
//echo "<script type='text/javascript'>alert('$po ggg');</script>";
?>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $status =$_POST["status"];
  $city =$_POST["city"];
  $time =$_POST["time"];
  $s_fname =$_POST["s_fname"];
  $d_fname =$_POST["driver_fname"];
  $picktime =$_POST["picktime"];
  $pickloc =$_POST["pickloc"];
  $droptime =$_POST["droptime"];
  $pax =$_POST["pax"];
  $status =$_POST["status"];
  $orderid=$_POST["orderid"];
  $schoolid=$_POST["schoolid"];
  $driverid=$_POST["driverid"];
  $clientid=$_POST["client_id"];
  $s_id=$_POST["s_id"];
  $current_date=date("Y-m-d");
  echo "<script type='text/javascript'>alert('$city'+'dafd');</script>";
  $result_tripdata = getAllTripData();




  if($status=="Success" || $status=="Cancel" ) {

      $toinsert = true;
      //    echo "<script type='text/javascript'>alert('$toinsert'+'in');</script>";
      while ($subject_trip = mysqli_fetch_assoc($result_tripdata)) {
          $tripo_id = $subject_trip["triplog_o_id"];
          //    echo "<script type='text/javascript'>alert('$tripo_id'+'inOrder');</script>";
          if ($subject_trip["triplog_o_id"] == $orderid && $subject_trip["triplog_date"] == $current_date) {
              //     echo "<script type='text/javascript'>alert('$status'+'oo');</script>";
              update_trip($orderid, $clientid, $schoolid, $driverid, $s_id, $city, $time, $pickloc, $picktime, $droptime, $pax, $status, $current_date);
              $toinsert = false;
              break;
          }
      }

      if ($toinsert) {
        //  echo "<script type='text/javascript'>alert('innn');</script>";
          insert_trip($orderid, $clientid, $schoolid, $driverid, $s_id, $city, $time, $pickloc, $picktime, $droptime, $pax, $status, $current_date);
      }

  }
 }

?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Manifest</h1>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Striped Rows
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="manifest" class="table table-striped">
                                <thead>
                                <tr>
                                    <th>City</th>
                                    <th>Time</th>
                                    <th>Student Name</th>
                                    <th>Driver Name</th>
                                    <th>Pick Up Loc</th>
                                    <th>Pick Up Time</th>
                                    <th>Drop Off Time</th>
                                    <th>Pax</th>
                                    <th>Trip Status</th>
                                    <th>Edit Trip</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                // Use returned data (if any)
                                while($subject_client = mysqli_fetch_assoc($result_triporder)) {
                                    // output data from each row
                                    ++$c;
                                    $totriplogdata = false;
                                    $subject_tripdata=null;
                                //    echo "<script type='text/javascript'>alert('$totriplogdata'+'inOrder');</script>";
                                    while ($subject_data = mysqli_fetch_assoc($result_triplogdata)) {
                                        if ($subject_client["o_id"] == $subject_data["triplog_o_id"] && $subject_data["triplog_date"] == date("Y-m-d")) {
                                            $totriplogdata = true;
                                            $subject_tripdata=$subject_data;
                                            break;
                                        }
                                    }
                                      //  echo "<script type='text/javascript'>alert('$totriplogdata'+'inside');</script>";
                                        if ($totriplogdata) {
                                            $sname=get_studentname($subject_tripdata["triplog_studentid"]);
                                            $drivername=get_drivername($subject_tripdata["triplog_driver_id"]);

                                            ?>
                                            <tr id ="<?php echo $subject_data["triplog_o_id"]; ?>">
                                                <td class="col-xs-1" headers ="city">
                                                    <?php echo $subject_tripdata["triplog_city"]; ?>
                                                </td>
                                                <td class="col-xs-1" headers ="time"><?php echo $subject_tripdata["triplog_time"]; ?></td>
                                                <td class="col-xs-1"><?php echo $sname["s_fname"]; ?></td>
                                                <td class="col-xs-1"><?php echo $drivername["driver_fname"]; ?></td>
                                                <td class="col-xs-1" headers ="pickloc"><?php echo $subject_tripdata["triplog_pickloc"]; ?></td>
                                                <td class="col-xs-1" headers ="picktime"><?php echo $subject_tripdata["triplog_picktime"]; ?>
                                                    <span class="input-group-clock" style="color: #68ca1b;"
                                                          id="<?php echo $c.$c.$c.$c; ?>"><i
                                                            class="glyphicon glyphicon-time"></i></span></td>
                                                <td class="col-xs-1" headers ="droptime"><?php echo $subject_tripdata["triplog_droptime"]; ?>
                                                    <span class="input-group-clock" 
                                                      <?php if($subject_tripdata['triplog_status'] == 'pending'){?>
                                                          style="color: #bc2328;"
                                                          id="<?php echo $c.$c.$c.$c.$c; ?>"
                                                          onclick="setColor(event,id,this)" ;>
                                                      <?php } else { echo ('style="color: #68ca1b;" <i class="glyphicon glyphicon-time"></i>');}?>
                                                          
                                                    
                                                          <i class="glyphicon glyphicon-time"></i></span></td>
                                                <td class="col-xs-1" headers ="pax"><?php echo $subject_tripdata["triplog_pax"]; ?></td>
                                                <td class="col-xs-1">
                                                    <!-- <select class="form-control"
                                                            onchange="manifestdata(<?php echo $c; ?>,id,this)"
                                                            id="select<?php echo $c; ?>"
                                                            data-picktime="<?php echo $subject_tripdata["triplog_picktime"]; ?>"
                                                            data-droptime="<?php echo $subject_tripdata["triplog_droptime"]; ?>"
                                                            data-orderid="<?php echo $subject_tripdata["triplog_o_id"]; ?>"
                                                            data-schoolid="<?php echo $subject_tripdata["triplog_school_id"]; ?>"
                                                            data-driverid="<?php echo $subject_tripdata["triplog_driver_id"]; ?>"
                                                            data-clientid="<?php echo $subject_tripdata["triplog_client_id"]; ?>"
                                                            data-sid="<?php echo $subject_tripdata["triplog_studentid"]; ?>">
                                                        <option value="Pending"<?php if($subject_tripdata['triplog_status'] == 'Pending'): ?> selected="selected"<?php endif; ?>>Pending</option>
                                                        <option value="Success"<?php if($subject_tripdata['triplog_status'] == 'Success'): ?> selected="selected"<?php endif; ?>>Success</option>
                                                        <option value="Cancel"<?php if($subject_tripdata['triplog_status'] == 'Cancel'): ?> selected="selected"<?php endif; ?>>Cancel</option>
                                                    </select> -->
                                                    <?php if($subject_tripdata['triplog_status'] == 'success'){ ?>
                                                       <button type="button" class="btn btn-success">Success</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'pending'){?>
                                                        <button type="button" class="btn btn-warning">Pending</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'cancel'){?>
                                                        <button type="button" class="btn btn-primary">Cancelled</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'noshow'){ ?>
                                                        <button type="button" class="btn btn-danger">No Show</button> 
                                                      <?php } ?>
                                                </td>
                                                <td class="col-xs-1">
                                                    <button id="editbtn" class="btn btn-primary" type="checkbox">Edit
                                                    </button>
                                                    
                                                </td>
                                                <input type="hidden" name="" data-orderid="<?php echo $subject_tripdata["triplog_o_id"]; ?>" data-schoolid="<?php echo $subject_tripdata["triplog_school_id"]; ?>" data-driverid="<?php echo $subject_tripdata["triplog_driver_id"]; ?>" data-clientid="<?php echo $subject_tripdata["triplog_client_id"]; ?>" data-sid="<?php echo $subject_tripdata["triplog_studentid"]; ?>" data-updated="true" data-trip_id="<?php echo $subject_tripdata["triplog_tripid"]; ?>">
                                            </tr>



                                <?php        } else {    ?>

                                            <tr>
                                                <td class="col-xs-1" headers ="city">
                                                    <?php echo $subject_client["school_city"]; ?>
                                                </td>
                                                <td class="col-xs-1" headers ="time"><?php echo $subject_client["time"]; ?></td>
                                                <td class="col-xs-1"><?php echo $subject_client["s_fname"]; ?></td>
                                                <td class="col-xs-1"><?php echo $subject_client["driver_fname"]; ?></td>
                                                <td class="col-xs-1" headers ="pickloc"><?php echo $subject_client["pickloc"]; ?></td>
                                                <td class="col-xs-1" headers ="picktime" ><span><?php echo $subject_client["picktime"]; ?></span>
                                                    <span class="input-group-clock" style="color: #bc2328;"
                                                          id="<?php echo $c; ?>" data-updated="false"
                                                          onclick="setColor(event,id,this)" ;><i
                                                            class="glyphicon glyphicon-time"></i></span></td>
                                                <td class="col-xs-1" headers ="droptime"><span><?php echo $subject_client["droptime"]; ?></span>
                                                    <span class="input-group-clock" style="color: #bc2328;"
                                                          id="<?php echo $c.$c.$c; ?>"><i
                                                            class="glyphicon glyphicon-time"></i></span></td>
                                                <td class="col-xs-1" headers ="pax"><?php echo $subject_client["pax"]; ?></td>
                                                <td class="col-xs-1">
                                                     <button type="button" class="btn btn-warning">Pending</button>
                                                </td>
                                                <td class="col-xs-1">
                                                    <button id="editbtn" class="btn btn-primary" type="checkbox">Edit
                                                    </button>
                                                    
                                                </td>
                                                <input type="hidden" name="" data-orderid="<?php echo $subject_client["o_id"] ?>" data-schoolid="<?php echo $subject_client["school_id"]; ?>" data-driverid="<?php echo $subject_client["driver_id"];; ?>" data-clientid="<?php echo $subject_client["client_id"]; ?>" data-sid="<?php echo $subject_client["s_id"]; ?>" data-updated="false" data-trip_id="0">
                                            </tr>


                               <?php         }


                                        ?>


                                        <?php

                                }


                                ?>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->

            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

<?php
require_once("./includes/footer.php");
?>
