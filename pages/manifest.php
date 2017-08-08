<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
$clck="AM";
$c=0;
$bydrivername="";
$daterequired=date("Y-m-d");
if(isset($_POST["searchByDriverName"])){
    $byBriverId= $_POST["driver_id"];
    $bydrivername=$_POST["bydriverName"];
    $daterequired=$_POST["o_startdate"];
    $clck=$_POST["clockt"];
}

if(isset($_POST["clock"])){
    $clck= $_POST["clock"];
}
if(isset($_POST["dateValue"])){
    $daterequired=$_POST["dateValue"];
}
$timestamp = strtotime($daterequired);
$day = date('l', $timestamp);
$query ="select * from  
 (select * from lpr_triplog where triplog_date='$daterequired' and triplog_clock='$clck')R1
  RIGHT outer join
 (select * from ( 
       (select t1.o_id,t1.o_status,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.s_city,t1.o_ampicktime as picktime,t1.o_ampickloc as pickloc,t1.o_amdroptime as droptime,'AM' as clockperiod, t1.o_days,t1.o_startdate,t1.o_enddate from ( 
           select lpr_order.o_id,lpr_order.o_status ,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_order.driver_id, lpr_school.school_city,lpr_order.o_ampicktime as time,CONCAT(lpr_student.s_fname,' ',lpr_student.s_lname) as s_fname,lpr_student.s_city,lpr_order.o_ampicktime,lpr_order.o_ampickloc,lpr_order.o_amdroptime, lpr_order.o_days,lpr_order.o_startdate,lpr_order.o_enddate from 
           lpr_order,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and o_ampickloc not like 'null' group by lpr_order.o_id)t1 )
        UNION 
       (select t1.o_id,t1.o_status,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.s_city,t1.picktime,t1.pickloc,t1.droptime,'PM' as clockperiod, t1.o_days,t1.o_startdate,t1.o_enddate  from 
          (select lpr_order.o_id,lpr_order.o_status,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_order.driver_id, lpr_school.school_city,lpr_order.o_pmpicktime as time,CONCAT(lpr_student.s_fname,' ',lpr_student.s_lname) as s_fname,lpr_student.s_city,lpr_order.o_pmpicktime as picktime,lpr_order.o_pmpickloc as pickloc,'NA' as droptime,lpr_order.o_days,lpr_order.o_startdate,lpr_order.o_enddate from 
           lpr_order,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and o_pmdroploc not like 'null' group by lpr_order.o_id)t1))R
  )R2  on  R1.triplog_o_id=R2.o_id
  left join
 (select lpr_student.o_id,COUNT(lpr_student.s_id) as pax from lpr_student group BY lpr_student.o_id)R3   
  on R2.o_id=R3.o_id 
  left join (select CONCAT(driver_fname,' ',driver_lname) as driver_name,driver_id from lpr_driver)R4
  on R2.driver_id=R4.driver_id
  where clockperiod='$clck' and o_startdate <='$daterequired' and o_enddate >='$daterequired' and o_days like '%$day%' and o_status not like 'inactive'";
if(!empty($byBriverId)){
    $query .=" and R2.driver_id=$byBriverId";
}
$query.=" ORDER BY time";
error_log("\nManifest" . $query , 3, "C:/xampp/apache/logs/error.log");
$result_triporder = mysqli_query($connection, $query);
confirm_query($result_triporder);
$result_triplogdata = getAllTripData();

//$query_print="select * from
//(select * from (SELECT lpr_order.o_id,lpr_order.o_startdate,lpr_order.o_enddate,lpr_order.o_ampickloc,lpr_order.o_ampicktime,lpr_order.o_amdroploc,lpr_order.o_amdroptime,lpr_order.o_pmpickloc,lpr_order.o_pmdroploc,lpr_order.o_pmpicktime,lpr_order.o_days,lpr_order.o_dcomment,lpr_client.client_name,lpr_client.client_street,lpr_client.client_address,lpr_client.client_city,lpr_client.client_state,lpr_client.client_zip,GROUP_CONCAT(concat(lpr_student.s_fname,' ',lpr_student.s_lname)) as student_name,concat(s_pfname,' ',s_plname) as s_pname,GROUP_CONCAT(CASE WHEN lpr_student.s_grade = '' THEN 'NA' else lpr_student.s_grade END) as student_grade,GROUP_CONCAT(lpr_student.s_gender) as student_gender,s_phone,s_altphone,s_street,s_address,s_city,s_state,s_zip
//FROM lpr_order,lpr_client,lpr_student where lpr_order.client_id=lpr_client.client_id and lpr_order.o_id=lpr_student.o_id and o_startdate <='$daterequired' and o_enddate >='$daterequired' and o_days like '%$day%' and lpr_order.o_status in ('active') group by o_id) t1
//left join
//(select triplog_o_id,GROUP_CONCAT(triplog_status) as trip_status,GROUP_CONCAT(triplog_clock) as trip_period,triplog_date  from  lpr_triplog  group by triplog_o_id,triplog_date) t2 on t1.o_id=t2.triplog_o_id and t2.triplog_date='$daterequired') t3
//where trip_status is null or trip_status  not like '%cancel%cancel%'";

$query_print="select * from(select * from
(select * from (SELECT lpr_order.o_id,lpr_order.o_bs,lpr_order.driver_id,lpr_order.o_startdate,lpr_order.o_enddate,CASE WHEN '$clck' = 'AM' THEN o_ampickloc else o_pmpickloc END as pickloc,CASE WHEN '$clck' = 'AM' THEN o_ampicktime else o_pmpicktime END as picktime,CASE WHEN '$clck' = 'AM' THEN o_amdroploc else o_pmdroploc END as droploc,lpr_order.o_days,lpr_order.o_dcomment,lpr_order.o_icomment,lpr_order.o_payable,lpr_order.o_tip,lpr_order.o_ra,lpr_client.client_name,GROUP_CONCAT(concat(lpr_student.s_fname,' ',lpr_student.s_lname)) as student_name,concat(s_pfname,' ',s_plname) as s_pname,s_phone,s_altphone
FROM lpr_order,lpr_client,lpr_student where lpr_order.o_reqby=lpr_client.client_id and lpr_order.o_id=lpr_student.o_id  and o_startdate <='$daterequired' and o_enddate >='$daterequired' and o_days like '%$day%' and lpr_order.o_status in ('active') group by o_id ) t1
left join
(select triplog_o_id,triplog_date,triplog_status,triplog_clock,triplog_driver_id from  lpr_triplog  where triplog_clock='AM' group by triplog_o_id,triplog_date ) t2 on t1.o_id=t2.triplog_o_id and t2.triplog_date='$daterequired') t3 
where t3.triplog_status is null or t3.triplog_status not like '%cancel%' ) t4 where pickloc not like 'NULL' and droploc not like 'NULL'";
if(!empty($byBriverId)){
    $query_print .=" and t4.driver_id=$byBriverId";
}
$result_tripPrint = mysqli_query($connection, $query_print);
confirm_query($result_tripPrint);
error_log("\nManifest print query " . $query_print , 3, "C:/xampp/apache/logs/error.log");
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<!--SELECT lpr_order.o_id,lpr_order.o_startdate,lpr_order.o_enddate,lpr_order.o_ampickloc,lpr_order.o_ampicktime,lpr_order.o_amdroploc,lpr_order.o_amdroptime,lpr_order.o_pmpickloc,lpr_order.o_pmdroploc,lpr_order.o_pmpicktime,lpr_order.o_days,lpr_order.o_dcomment,lpr_client.client_name,lpr_client.client_street,lpr_client.client_address,lpr_client.client_city,lpr_client.client_state,lpr_client.client_zip,GROUP_CONCAT(concat(lpr_student.s_fname,' ',lpr_student.s_lname)) as student_name,concat(s_pfname,' ',s_plname) as s_pname,GROUP_CONCAT(concat(lpr_student.s_grade)) as student_grade,GROUP_CONCAT(concat(lpr_student.s_gender)) as student_gender,s_phone,s_altphone,s_street,s_address,s_city,s_state,s_zip-->
<!--FROM lpr_order,lpr_client,lpr_student where lpr_order.o_id=lpr_client.client_id and lpr_order.o_id=lpr_student.o_id-->
<!--group by o_id-->

<!--select * from (select * from (SELECT lpr_order.o_id,lpr_order.o_startdate,lpr_order.o_enddate,lpr_order.o_ampickloc,lpr_order.o_ampicktime,lpr_order.o_amdroploc,lpr_order.o_amdroptime,lpr_order.o_pmpickloc,lpr_order.o_pmdroploc,lpr_order.o_pmpicktime,lpr_order.o_days,lpr_order.o_dcomment,lpr_client.client_name,lpr_client.client_street,lpr_client.client_address,lpr_client.client_city,lpr_client.client_state,lpr_client.client_zip,GROUP_CONCAT(concat(lpr_student.s_fname,' ',lpr_student.s_lname)) as student_name,concat(s_pfname,' ',s_plname) as s_pname,GROUP_CONCAT(CASE WHEN lpr_student.s_grade = '' THEN 'NA' else lpr_student.s_grade END) as student_grade,GROUP_CONCAT(lpr_student.s_gender) as student_gender,s_phone,s_altphone,s_street,s_address,s_city,s_state,s_zip-->
<!--FROM lpr_order,lpr_client,lpr_student where lpr_order.o_id=lpr_client.client_id and lpr_order.o_id=lpr_student.o_id and o_startdate <='2017-07-25' and o_enddate >='2017-07-25' and o_days like '%Tuesday%' and lpr_order.o_status in ('active') group by o_id) t1-->
<!--left join (select triplog_o_id,GROUP_CONCAT(triplog_status) as trip_status,GROUP_CONCAT(triplog_clock) as trip_period,triplog_date  from  lpr_triplog  group by triplog_o_id) t2 on t1.o_id=t2.triplog_o_id and t2.triplog_date='2017-07-25') t3 where-->
<!--trip_status is null or trip_status  not like '%cancel%cancel'-->


<style type="text/css">
    .toprint
    { display: none; }
</style>

<style type="text/css" media="print">
    .dontprint
    { display: none; }
    .toprint
    { display: inline;
    }
    .to4Columns {
        -webkit-column-count: 4; /* Chrome, Safari, Opera */
        -moz-column-count: 4; /* Firefox */
        column-count: 4;
    }
    .to3Columns {
        -webkit-column-count: 3; /* Chrome, Safari, Opera */
        -moz-column-count: 3; /* Firefox */
        column-count: 3;
        -webkit-column-fill: balance; /* Chrome, Safari, Opera */
        -moz-column-fill: balance; /* Firefox */
        column-fill: balance;
    }
    .to2Columns {
        -webkit-column-count: 2; /* Chrome, Safari, Opera */
        -moz-column-count: 2; /* Firefox */
        column-count: 2;
    }
    .gap {
        -webkit-column-gap: 10px; /* Chrome, Safari, Opera */
        -moz-column-gap: 10px; /* Firefox */
        column-gap: 10px;
    }
    .gap2 {
        -webkit-column-gap: 30px; /* Chrome, Safari, Opera */
        -moz-column-gap: 30px; /* Firefox */
        column-gap: 30px;
    }
    @page {
        size: auto;   /* auto is the initial value */
        margin:.5cm;
        /* this affects the margin in the printer settings */
    }
    /*body { margin: 20mm 25mm 20mm 25mm; }*/
    table { page-break-inside:auto }
    tr    { page-break-inside:avoid; page-break-after:auto }
    thead { display:table-header-group }
    tfoot { display:table-footer-group }
    /*.print:last-child {*/
    /*page-break-after: auto;*/
    /*}*/
    table, th, td {
        border: 1px solid black;
    }
    .dinline{display:inline-block;}
    .hschool {
        line-height: 0;
        text-align: right;
    }
    .hspace{
        margin-top: 3px
    }
    .inborder{
        border-style: solid;
        padding-top: 10px;
      }
    .s2height{
        font-family: Georgia, "Times New Roman", Times, serif;
        line-height: 0.3em;
        padding-top: 5px;
        padding-bottom: 8px;
    }
    .s1height{
        line-height: 0.2em;
        font-family: Georgia, "Times New Roman", Times, serif;
        padding-bottom: 50px;
        text-align: center;
    }
    .s3height{
        padding-left: 15px;
        padding-bottom: 0;
        line-height: 0.2em;
    }
    .touppercase{
        text-transform: uppercase;
    }
    .elementleft{
      padding-left: 10px;
        padding-top: 0px;
  }
    .s_address{
        padding-left: 5px;
    }
    .s_border{
        border-top: 2px dotted;
    }
    .sheetf {
        font-family:  Arial, Helvetica, sans-serif;
        font-size: 14px !important;
    }

    .sheetText{
        display: table-cell;
        width: 50px;
    }
    .sheetUnderline{
        display: table-cell; border-bottom: 1px solid black; width:700px
    }

    .elementPadding{
        padding-bottom: 15px !important;
    }

</style>


<?php    while($sheets = mysqli_fetch_assoc($result_tripPrint)) {  ?>
    <div class="toprint" style="page-break-before: always;">

        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h6 style="text-align: right;padding-right: 100px;padding-top: 20px"> <?php if(!empty($sheets['o_icomment'])){?> *<?php echo $sheets['o_icomment']; ?> *<?php }?>  </h6>
                        <img src="../images/bus1.jpg" alt="Bus" style="width:150px;height:100px;">
                        <h1 class="s1height"><span>LPR TRANSPORTATION</span></h1>
                    </div>
                </div>
                <div style="margin-left: 20px">
                <?php
                       $pieces_name= explode(",", $sheets['student_name']);
                       $Pax=count($pieces_name); ?>
                <div class="row" style="padding-bottom: 15px">
                   <span class="sheetText">Name:</span> <span class="sheetUnderline"><?php echo $sheets['student_name']; ?></span>
                </div>
                <div class="row" style="padding-bottom: 15px">
                    <span class="sheetText" style="width:100px ">Date Needed:</span><span  class="sheetUnderline"> <?php echo date("F j, Y", strtotime($daterequired));  ?></span>
                </div>
                <div class="row" style="padding-bottom: 15px">
                    <span class="sheetText" style="width:100px ">Time Needed:</span><span  class="sheetUnderline" style="width:300px "> <?php echo date ('H:i',strtotime($sheets['picktime'])) ;  ?></span>
                    <span class="sheetText" style="width:100px ">#Passengers:</span><span  class="sheetUnderline" style="width:300px "><?php echo $Pax;  ?></span>
                </div>
                <div class="row" style="padding-bottom: 15px">
                    <span class="sheetText" style="width:100px ">Phone:</span> <span  class="sheetUnderline"><span> <?php echo $sheets['s_pname']; ?></span><span> <?php echo $sheets['s_phone']; ?></span>/<span> <?php echo $sheets['s_altphone']; ?></span> </span>
                </div>
                <div class="row" style="padding-bottom: 25px">
                    <span class="sheetText" style="width:150px ">Pick up Address:</span> <span  class="sheetUnderline" ><?php echo $sheets['pickloc']; ?></span>
                </div>
                    <div class="row" style="padding-bottom: 25px">
                        <span  class="sheetUnderline" style="width:800px"></span>
                    </div>
                    <div class="row" style="padding-bottom: 35px">
                        <span  class="sheetUnderline" style="width:800px"></span>
                    </div>
                <div class="row" style="padding-bottom: 25px">
                    <span class="sheetText" style="width:150px ">Drop off Address:</span> <span  class="sheetUnderline"><?php echo $sheets['droploc']; ?></span>
                </div>
                    <div class="row" style="padding-bottom: 25px">
                        <span  class="sheetUnderline" style="width:800px"></span>
                    </div>
                    <div class="row" style="padding-bottom: 15px">
                        <span  class="sheetUnderline" style="width:800px"></span>
                    </div>
                <div class="row" style="padding-bottom: 25px">
                    <span class="sheetText" style="width:150px ">Special Instructions:</span><span  class="sheetUnderline"><?php echo $sheets['o_dcomment']; ?></span>
                </div>
                    <div class="row" style="padding-bottom: 25px">
                       <span  class="sheetUnderline" style="width:800px"></span>
                    </div>
                    <div class="row" style="padding-bottom: 70px">
                        <span  class="sheetUnderline" style="width:800px"></span>
                    </div>

                <?php
                $driver="";
                if(!empty($sheets['driver_id'])){
                    $driverName=get_drivername($sheets['driver_id']);
                    $driver=$driverName['driver_name'];

                } ?>

                <div class="row" style="padding-bottom: 15px">
                    <span class="sheetText" style="width:50px ">Rate:</span> <span  class="sheetUnderline" style="width:150px "><?php echo $sheets['o_payable']; ?></span>
                    <span class="sheetText" style="width:60px;padding-left: 100px;padding-right: 10px ">Driver:</span> <span  class="sheetUnderline" style="width:400px "><?php echo $driver; ?></span>
                </div>
                <div class="row" style="padding-bottom: 30px">
                    <span class="sheetText" style="width:50px ">Tip:</span> <span  class="sheetUnderline" style="width:150px "><?php echo $sheets['o_payable']; ?></span>
                    <span class="sheetText" style="width:60px;padding-left: 100px;padding-right: 10px ">Assign:</span><span  class="sheetUnderline" style="width:400px "><?php echo $sheets['client_name']; ?></span>
                </div>
                <div class="row" style="padding-bottom: 15px">
                    <span class="sheetText" style="width:300px ">Car/Booster Seat Required:</span> <span  class="sheetUnderline" style="width:200px;text-align: left "><?php if($sheets['o_bs']=="TRUE"){ echo 'YES';}else { echo 'NO';} ?></span>
                    <span class="sheetText" style="width:300px;padding-left: 20px ">Ride Along Required:</span><span  class="sheetUnderline" style="width:200px "><?php if($sheets['o_ra']=="TRUE"){ echo 'YES';}else { echo 'NO';} ?></span>
                </div>

            </div>
            </div>
        </div>




        <div style="page-break-after: always">


        </div>

    </div>

<?php  } ?>


<div class="dontprint">
<div id="page-wrapper">
    <div class="container-fluid">

    </div>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Manifest</h1>
                <form class="form-horizontal" action="manifest.php" method="post">
                <div>
                    <div class="container-fluid">
                        <div class="row">
                        <div class="col-lg-10" style="padding-left: 0">
                            <select name="clockt" class="form-control" id="clock" onchange="getdata(id,this)" style="width:100px;">
                                    <option value="AM" <?php if($clck == 'AM'): ?> selected="selected"<?php endif; ?> >AM</option>
                                    <option value="PM" <?php if($clck == 'PM'): ?> selected="selected"<?php endif; ?>>PM</option>
                            </select>
                        </div>
                            <div class="col-lg-2" style="padding-left:60px">
                            <button type="button" class="btn btn-primary btn-lg col-sm-6" onclick="printSheet();">
                                 Print All
                             </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group" style="width: 10%;" >
                    <div class="input-group" style="padding-left: 10px">
                        <input type="text" name="o_startdate" class="form-control" id="manifestdate" placeholder="Select Date" value="<?php echo $daterequired; ?>" required><span class="input-group-addon"><i class="glyphicon glyphicon-th" ></i></span>
                    </div>
                </div>
                <div>
                        <div class="form-group">
                            <label class="control-label col-sm-1" style="text-align: center">By Driver   :</label>
                            <div class="col-sm-3">
                                <div class="input-group"">
                                    <input id="drivername" name="bydriverName" required class="form-control typeahead" placeholder="" style="width: 400px;" value="<?php echo $bydrivername;?>">
                                    <input class="form-control" id="driver_id" name="driver_id" type="hidden" placeholder="">
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <button type="submit" id="driverSearch" name="searchByDriverName" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                </div>
                </form>
                <br>

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

                                                    <?php
                                                    if($clck=='AM') {
                                                        echo $subject_tripdata["s_city"];
                                                    }
                                                    if($clck=='PM'){
                                                         echo $subject_tripdata["school_city"];
                                                    }
                                                    ?>
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

            <div id="dialog-confirm2" title="Is client billable?" class="ui-helper-hidden">
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
</div>