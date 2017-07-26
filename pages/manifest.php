<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
$clck="AM";
$c=0;
if(isset($_POST["clock"])){
    $clck= $_POST["clock"];
}
$daterequired=date("Y-m-d");
if(isset($_POST["dateValue"])){
    $daterequired=$_POST["dateValue"];
}
$timestamp = strtotime($daterequired);
$day = date('l', $timestamp);
$query ="select * from  
 (select * from lpr_triplog where triplog_date='$daterequired' and triplog_clock='$clck')R1
  RIGHT outer join
 (select * from ( 
       (select t1.o_id,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.o_ampicktime as picktime,t1.o_ampickloc as pickloc,t1.o_amdroptime as droptime,'AM' as clockperiod, t1.o_days,t1.o_startdate,t1.o_enddate from ( 
           select lpr_order.o_id,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_order.driver_id, lpr_school.school_city,lpr_order.o_ampicktime as time,lpr_student.s_fname,lpr_order.o_ampicktime,lpr_order.o_ampickloc,lpr_order.o_amdroptime, lpr_order.o_days,lpr_order.o_startdate,lpr_order.o_enddate from 
           lpr_order,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and o_ampickloc not like 'null' group by lpr_order.o_id)t1 )
        UNION 
       (select t1.o_id,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.picktime,t1.pickloc,t1.droptime,'PM' as clockperiod, t1.o_days,t1.o_startdate,t1.o_enddate  from 
          (select lpr_order.o_id,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_order.driver_id, lpr_school.school_city,lpr_order.o_pmpicktime as time,lpr_student.s_fname,lpr_order.o_pmpicktime as picktime,lpr_order.o_pmpickloc as pickloc,'NA' as droptime,lpr_order.o_days,lpr_order.o_startdate,lpr_order.o_enddate from 
           lpr_order,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and o_pmdroploc not like 'null' group by lpr_order.o_id)t1))R
  )R2  on  R1.triplog_o_id=R2.o_id
  left join
 (select lpr_student.o_id,COUNT(lpr_student.s_id) as pax from lpr_student group BY lpr_student.o_id)R3   
  on R2.o_id=R3.o_id 
  left join (select CONCAT(driver_fname,' ',driver_lname) as driver_name,driver_id from lpr_driver)R4
  on R2.driver_id=R4.driver_id
  where clockperiod='$clck' and o_startdate <='$daterequired' and o_enddate >='$daterequired' and o_days like '%$day%'  ORDER BY time";

//error_log("\nManifest" . $query , 3, "C:/xampp/apache/logs/error.log");
$result_triporder = mysqli_query($connection, $query);

confirm_query($result_triporder);


$result_triplogdata = getAllTripData();
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
    
    </div>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Manifest</h1>
                <div class="btn-group form-group">
                        
                        <select class="form-control" id="clock" onchange="getdata(id,this)">
                                    <option value="AM" <?php if($clck == 'AM'): ?> selected="selected"<?php endif; ?> >AM</option>
                                    <option value="PM" <?php if($clck == 'PM'): ?> selected="selected"<?php endif; ?>>PM</option>
                                </select> 
                        </div>
                <div class="form-group" style="width: 10%;" >
                    <div class="input-group">
                        <input type="text" name="o_startdate" class="form-control" id="manifestdate" placeholder="Select Date"  value="<?php echo $daterequired; ?>" required><span class="input-group-addon"><i class="glyphicon glyphicon-th" ></i></span>
                    </div>
                </div>


                <div class="panel panel-default">

                    <div class="panel-heading">
                        Striped Rows
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="manifest" class="table table-striped dataTab">
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
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                // Use returned data (if any)
                                while($subject_tripdata = mysqli_fetch_assoc($result_triporder)) {
                                    // output data from each row
                                    ++$c;
                                      if($subject_tripdata["picktime"]!= NULL && trim($subject_tripdata["picktime"])!=''){  
                                      //  echo "<script type='text/javascript'>alert('$totriplogdata'+'inside');</script>";
                                        if ($subject_tripdata['triplog_status'] != NULL) {
                                            // $sname=get_studentname($subject_tripdata["triplog_studentid"]);
                                            $drivername=get_drivername($subject_tripdata["triplog_driver_id"]);

                                            ?>
                                            <tr id ="<?php echo $subject_tripdata["triplog_o_id"]; ?>">
                                                <td class="col-xs-1" headers ="city">
                                                    <?php echo $subject_tripdata["triplog_city"]; ?>
                                                </td>
                                                <td class="col-xs-1" headers ="time"><?php echo $subject_tripdata["triplog_time"]; ?></td>
                                                <td class="col-xs-1"><?php echo $subject_tripdata["s_fname"]; ?></td>
                                                <td class="col-xs-1" headers ="dname"><?php echo $drivername["driver_name"]; ?></td>
                                                <td class="col-xs-1" headers ="pickloc"><?php echo $subject_tripdata["triplog_pickloc"]; ?></td>


<!--                                                 <td class="col-xs-1" headers ="picktime"><?php echo $subject_tripdata["triplog_picktime"]; ?>
                                                    <span class="input-group-clock" style="color: #68ca1b;"
                                                          id="<?php echo $c.$c.$c.$c; ?>"><i
                                                            class="glyphicon glyphicon-time"></i></span></td> -->

                                                <td class="col-xs-1" headers ="picktime"><span><?php echo $subject_tripdata["triplog_picktime"]; ?></span>
                                                    <span class="input-group-clock" 
                                                      <?php if($subject_tripdata['triplog_status'] != 'success' && $subject_tripdata['triplog_status'] != 'pending'){?>
                                                          style="color: #bc2328;"
                                                          id="<?php echo $c.$c.$c.$c; ?>"
                                                          onclick="setColor(event,id,this)" ;>
                                                      <?php } else { echo ('style="color: #68ca1b;" <i class="glyphicon glyphicon-time"></i>');}?>
                                                          <i class="glyphicon glyphicon-time"></i></span></td>

                                                <td class="col-xs-1" headers ="droptime"><span><?php echo $subject_tripdata["triplog_droptime"]; ?></span>
                                                    <span class="input-group-clock" 
                                                      <?php if($subject_tripdata['triplog_status'] != 'success'){?>
                                                          style="color: #bc2328;"
                                                          id="<?php echo $c.$c.$c.$c.$c; ?>"
                                                          onclick="setColor(event,id,this)" ;>
                                                      <?php } else { echo ('style="color: #68ca1b;" <i class="glyphicon glyphicon-time"></i>');}?>
                                                          <i class="glyphicon glyphicon-time"></i></span></td>



                                                <td class="col-xs-1" headers ="pax"><?php echo $subject_tripdata["triplog_pax"]; ?></td>
                                                <td class="col-xs-1">
                                                    <?php if($subject_tripdata['triplog_status'] == 'success'){ ?>
                                                       <button type="button" class="btn btn-success">Success</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'pending'){?>
                                                        <button type="button" class="btn btn-warning">Pending</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'cancel'){?>
                                                        <button type="button" class="btn btn-primary">Cancelled</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'noshow'){ ?>
                                                        <button type="button" class="btn btn-danger">No Show</button> 
                                                    <?php } if($subject_tripdata['triplog_status'] == 'none'){ ?>
                                                        <button type="button" class="btn btn-warning">Pending</button> 
                                                      <?php } ?>
                                                </td>
                                                <td class="col-xs-1">
                                                    <input type="checkbox" name="bill-checkbox" data-on-text="Edit" data-off-text="Save" checked>
                                                    
                                                </td>
                                                <td class="col-xs-1">
                                                <?php if($subject_tripdata['triplog_status'] == 'noshow'){ ?>
                                                <span class="noshow size2" style="color: #bc2328;" id ="<?php echo uniqid(); ?>"><i class="fa fa-male" aria-hidden="true"></i></span>
                                                <?php } else {?>
                                                <span class="noshow size2" id ="<?php echo uniqid(); ?>"><i class="fa fa-male" aria-hidden="true"></i></span>
                                                <?php } ?>

                                                <?php if($subject_tripdata['triplog_status'] == 'cancel'){ ?>
                                                <span class="cancel size2 pad" style="color: #bc2328;" id ="<?php echo uniqid(); ?>"><i class="fa fa-times-circle" aria-hidden="true"></i></span>
                                                <?php } else {?>
                                                <span class="cancel size2 pad" id ="<?php echo uniqid(); ?>"><i class="fa fa-times-circle" aria-hidden="true"></i></span></td>
                                                <?php } ?>
                                                </td>

                                                
                                                <input type="hidden" name="" data-orderid="<?php echo $subject_tripdata["triplog_o_id"]; ?>" data-schoolid="<?php echo $subject_tripdata["triplog_school_id"]; ?>" data-driverid="<?php echo $subject_tripdata["triplog_driver_id"]; ?>" data-clientid="<?php echo $subject_tripdata["triplog_client_id"]; ?>" data-sid="<?php echo $subject_tripdata["triplog_studentid"]; ?>" data-updated="true" data-trip_id="<?php echo $subject_tripdata["triplog_tripid"]; ?>" data-trip_period="<?php echo $subject_tripdata["clockperiod"]; ?>" data-trip_status = "<?php echo $subject_tripdata["triplog_status"]; ?>" data-trip_date="<?php echo $daterequired; ?>" >
                                            </tr>



                                <?php        } else {    
                                                    //error_log("\nInside else" . $subject_tripdata["o_id"] , 3, "C:/xampp/apache/logs/error.log");
                                                    ?>

                                            <tr>
                                                <td class="col-xs-1" headers ="city">
                                                    <?php echo $subject_tripdata["school_city"]; ?>
                                                </td>
                                                <td class="col-xs-1" headers ="time"><?php echo $subject_tripdata["time"]; ?></td>
                                                <td class="col-xs-1"><?php echo $subject_tripdata["s_fname"]; ?></td>
                                                <td class="col-xs-1" headers ="dname"><?php echo $subject_tripdata["driver_name"]; ?></td>
                                                <td class="col-xs-1" headers ="pickloc"><?php echo $subject_tripdata["pickloc"]; ?></td>
                                                <td class="col-xs-1" headers ="picktime" ><span><?php echo $subject_tripdata["picktime"]; ?></span>
                                                    <span class="input-group-clock" style="color: #bc2328;"
                                                          id="<?php echo $c; ?>" data-updated="false"
                                                          onclick="setColor(event,id,this)" ;><i
                                                            class="glyphicon glyphicon-time"></i></span></td>
                                                <td class="col-xs-1" headers ="droptime"><span><?php echo $subject_tripdata["droptime"]; ?></span>
                                                    <span class="input-group-clock" style="color: #bc2328;"
                                                          id="<?php echo $c.$c.$c; ?>"><i
                                                            class="glyphicon glyphicon-time"></i></span></td>
                                                <td class="col-xs-1" headers ="pax"><?php echo $subject_tripdata["pax"]; ?></td>
                                                <td class="col-xs-1">
                                                     <button type="button" class="btn btn-warning">Pending</button>
                                                </td>
                                                <td class="col-xs-1">
                                                    <input type="checkbox" name="bill-checkbox" data-on-text="Edit" data-off-text="Save" checked>
                                                    
                                                </td>
                                                <td class="col-xs-1"><span class="noshow size2" id ="<?php echo uniqid(); ?>"><i class="fa fa-male" aria-hidden="true"></i></span><span class="cancel size2 pad" id ="<?php echo uniqid(); ?>"><i class="fa fa-times-circle" aria-hidden="true"></i></span></td>
                                                <input type="hidden" name="" data-orderid="<?php echo $subject_tripdata["o_id"] ?>" data-schoolid="<?php echo $subject_tripdata["school_id"]; ?>" data-driverid="<?php echo $subject_tripdata["driver_id"]; ?>" data-clientid="<?php echo $subject_tripdata["client_id"]; ?>" data-sid="<?php echo $subject_tripdata["s_id"]; ?>" data-updated="false" data-trip_id="0" data-trip_period="<?php echo $subject_tripdata["clockperiod"]; ?>" data-trip_status ="none" data-trip_date="<?php echo $daterequired; ?>">
                                            </tr>


                               <?php         }
                             }


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
            <div id="dialog-confirm" title="Is driver payable?">
                <div>

            <div id="dialog-confirm2" title="Please select the preferences" class="ui-helper-hidden">
                <div class="checkbox">
              <label><input type="checkbox" name="check_driver" value="">Driver Payable</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" name="check_client" value="">Client Billable</label>
            </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

<?php
require_once("./includes/footer.php");
?>
