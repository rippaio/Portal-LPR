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
       (select t1.o_id,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.s_city,t1.o_ampicktime as picktime,t1.o_ampickloc as pickloc,t1.o_amdroptime as droptime,'AM' as clockperiod, t1.o_days,t1.o_startdate,t1.o_enddate from ( 
           select lpr_order.o_id,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_order.driver_id, lpr_school.school_city,lpr_order.o_ampicktime as time,CONCAT(lpr_student.s_fname,' ',lpr_student.s_lname) as s_fname,lpr_student.s_city,lpr_order.o_ampicktime,lpr_order.o_ampickloc,lpr_order.o_amdroptime, lpr_order.o_days,lpr_order.o_startdate,lpr_order.o_enddate from 
           lpr_order,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and o_ampickloc not like 'null' group by lpr_order.o_id)t1 )
        UNION 
       (select t1.o_id,t1.school_id,t1.driver_id,t1.client_id,t1.s_id,t1.school_city,t1.time,t1.s_fname,t1.s_city,t1.picktime,t1.pickloc,t1.droptime,'PM' as clockperiod, t1.o_days,t1.o_startdate,t1.o_enddate  from 
          (select lpr_order.o_id,lpr_school.school_id,lpr_order.client_id,lpr_student.s_id,lpr_order.driver_id, lpr_school.school_city,lpr_order.o_pmpicktime as time,CONCAT(lpr_student.s_fname,' ',lpr_student.s_lname) as s_fname,lpr_student.s_city,lpr_order.o_pmpicktime as picktime,lpr_order.o_pmpickloc as pickloc,'NA' as droptime,lpr_order.o_days,lpr_order.o_startdate,lpr_order.o_enddate from 
           lpr_order,lpr_school,lpr_student where lpr_order.o_id=lpr_student.o_id and lpr_order.school_id=lpr_school.school_id and o_pmdroploc not like 'null' group by lpr_order.o_id)t1))R
  )R2  on  R1.triplog_o_id=R2.o_id
  left join
 (select lpr_student.o_id,COUNT(lpr_student.s_id) as pax from lpr_student group BY lpr_student.o_id)R3   
  on R2.o_id=R3.o_id 
  left join (select CONCAT(driver_fname,' ',driver_lname) as driver_name,driver_id from lpr_driver)R4
  on R2.driver_id=R4.driver_id
  where clockperiod='$clck' and o_startdate <='$daterequired' and o_enddate >='$daterequired' and o_days like '%$day%'  ORDER BY time";


error_log("\nManifest" . $query , 3, "C:/xampp/apache/logs/error.log");
$result_triporder = mysqli_query($connection, $query);
confirm_query($result_triporder);
$result_triplogdata = getAllTripData();




$query_print="select * from
(select * from (SELECT lpr_order.o_id,lpr_order.o_startdate,lpr_order.o_enddate,lpr_order.o_ampickloc,lpr_order.o_ampicktime,lpr_order.o_amdroploc,lpr_order.o_amdroptime,lpr_order.o_pmpickloc,lpr_order.o_pmdroploc,lpr_order.o_pmpicktime,lpr_order.o_days,lpr_order.o_dcomment,lpr_client.client_name,lpr_client.client_street,lpr_client.client_address,lpr_client.client_city,lpr_client.client_state,lpr_client.client_zip,GROUP_CONCAT(concat(lpr_student.s_fname,' ',lpr_student.s_lname)) as student_name,concat(s_pfname,' ',s_plname) as s_pname,GROUP_CONCAT(CASE WHEN lpr_student.s_grade = '' THEN 'NA' else lpr_student.s_grade END) as student_grade,GROUP_CONCAT(lpr_student.s_gender) as student_gender,s_phone,s_altphone,s_street,s_address,s_city,s_state,s_zip
FROM lpr_order,lpr_client,lpr_student where lpr_order.client_id=lpr_client.client_id and lpr_order.o_id=lpr_student.o_id and o_startdate <='$daterequired' and o_enddate >='$daterequired' and o_days like '%$day%' and lpr_order.o_status in ('active') group by o_id) t1
left join
(select triplog_o_id,GROUP_CONCAT(triplog_status) as trip_status,GROUP_CONCAT(triplog_clock) as trip_period,triplog_date  from  lpr_triplog  group by triplog_o_id,triplog_date) t2 on t1.o_id=t2.triplog_o_id and t2.triplog_date='$daterequired') t3 
where trip_status is null or trip_status  not like '%cancel%cancel%'";
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
        padding-bottom: 8px;
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

</style>


<?php    while($sheets = mysqli_fetch_assoc($result_tripPrint)) {  ?>
    <div class="toprint" style="page-break-before: always;">
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-12">
                        <h6 class="hschool"><b><span> <?php echo $sheets['client_name']; ?></span></b></h6>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-lg-12">
                        <h6 class="hschool hspace"><span> Transportation Department</span></h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <h6 class="hschool hspace"><span> <?php echo $sheets['client_address']; ?></span><span> <?php echo $sheets['client_street']; ?></span> </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <h6 class="hschool hspace" style="padding-bottom: 10px"><span> <?php echo $sheets['client_city']; ?>,</span><span>  <?php echo $sheets['client_state']; ?></span><span>  <?php echo $sheets['client_zip']; ?></span></h6>
                    </div>
                </div>
            </div>
            <div class="container-fluid inborder">
                <div class="row">
                    <div class="col-lg-12" style="text-align:center;">
                        <h3 class="s2height touppercase"><?php echo $sheets['client_name']; ?></h3>
                        <h4 class="s1height touppercase">Contractor Sheet</h4>
                        <h4 class="s1height touppercase">LPR Transportation
                            <?php $pieces_status= explode(",", $sheets['trip_status']);
                                  $pieces_period= explode(",", $sheets['trip_period']);
                                  $amtrip=false;
                                  $pmtrip=false;
                            foreach ($pieces_status as $status) {
                                  foreach ($pieces_period as $period) {
                                    if($status=='cancel' and $period=='AM'){
                                        $pmtrip=true;
                                        break;
                                    }
                                    else if($status='cancel' and $period=='PM'){
                                        $amtrip=true;
                                        break;
                                    }
                               }
                               if($pmtrip || $amtrip){
                                      break;
                               }
                            }
                            ?>
                            <?php if ($sheets['o_ampickloc']=='NULL' || $pmtrip){?>PM ONLY<?php }
                            ?>
                            <?php if ($sheets['o_pmdroploc']=='NULL' || $amtrip){?>AM ONLY<?php }?>  </h4>
                    </div>
                </div>
                <div class="row">
                    <div class="dinline">
                        <h6 class="sheetf" style="padding-left: 15px"> <b>  Date:</b></h6>
                    </div>
                    <div class="dinline sheetf" >
                     <h6 class="sheetf"> <b>  <?php echo date("F j, Y", strtotime($daterequired));  ?></b></h6>
                    </div>
                </div>
                <div class="row">
                    <?php $pieces_name= explode(",", $sheets['student_name']); ?>

                        <h6 class="s3height sheetf"> <b> Student:</b></h6>

                    <div class="col-lg-5 dinline" style="text-align:left;padding-top: 0;padding-left: 30px">
                        <?php
                        foreach ($pieces_name as $name) {
                        ?>
                            <h6 class="sheetf"><b><?php echo $name; ?></b></h6>
                            <?php
                        }
                        ?>
                    </div>
                    <?php $pieces_grade= explode(",", $sheets['student_grade']); ?>
                    <div class="col-lg-1 dinline">
                        <?php
                        foreach ($pieces_grade as $p_grade) {
                        ?>
                           <h6 class="sheetf"><b>Grade:</b></h6>
                        <?php  } ?>
                    </div>
                    <div class="col-lg-2 dinline">
                        <?php
                        foreach ($pieces_grade as $p_grade) {
                        ?>
                            <h6 class="sheetf"><b><?php echo $p_grade; ?></b></h6>
                        <?php } ?>
                    </div>
                    <?php $pieces_gender= explode(",", $sheets['student_gender']); ?>
                    <div class="col-lg-1 dinline">
                        <?php
                        foreach ($pieces_gender as $p_gender) {
                        ?>
                       <h6 class="sheetf"> <b >Gender:</b></h6 >
                        <?php  } ?>
                    </div>
                    <div class="col-lg-3 dinline">
                        <?php
                        foreach ($pieces_gender as $p_gender) {
                        ?>
                            <h6 class="sheetf" style="text-align: right"><b><?php echo $p_gender; ?></b></h6>
                        <?php  } ?>
                    </div>
                </div>
            <div class="row">
                <div class="col-lg-12 ">
                    <h6 class="sheetf"><b>Address:<span class="s_address sheetf"> <?php echo $sheets['s_street']; ?></span>
                            <span class="s_address sheetf"> <?php echo $sheets['s_address']; ?>,</span>
                            <span class="s_address sheetf"> <?php echo $sheets['s_city']; ?>,</span>
                            <span class="s_address sheetf"> <?php echo $sheets['s_state']; ?></span>
                            <span class="s_address sheetf"> <?php echo $sheets['s_zip']; ?></span></b></h6>
                </div>
            </div>
            <div class="row" style="padding-bottom: 10px">
                <div class="col-lg-5 dinline ">
                    <h6 class="sheetf"><b>Start date:<span>   <?php echo $sheets['o_startdate']; ?></span></b></h6>
                </div>
                <div class="col-lg-1 dinline ">
                </div>
                <div class="col-lg-6 dinline ">
                    <h6 style="text-align: center" class="sheetf"><b>Days Needed:<span class="s_address">   <?php echo $sheets['o_days']; ?></span></b></h6>
                </div>
            </div>
            <div class="row s_border ">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>AM pick up location:<span class="s_address"> <?php if ($sheets['o_ampickloc']!='NULL'){ echo $sheets['o_ampickloc'];} ?></span></h6>
                </div>
            </div>
            <div class="row" >
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>AM pick up time:<span class="s_address">  <?php if ($sheets['o_ampickloc']!='NULL'){echo date ('H:i',strtotime($sheets['o_ampicktime'])) ; }?></span></b></h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>AM drop off location:<span class="s_address">  <?php if ($sheets['o_ampickloc']!='NULL'){  echo $sheets['o_amdroploc'];} ?></span></b></h6>
                </div>
            </div>
            <div class="row" style="padding-bottom: 10px">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>AM drop off time:<span class="s_address">  <?php if ($sheets['o_ampickloc']!='NULL'){ echo date ('H:i',strtotime($sheets['o_amdroptime'])) ;} ?></span></b></h6>
                </div>
            </div>
            <div class="row s_border">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>PM pick up location:<span class="s_address">   <?php   if ($sheets['o_pmdroploc']!='NULL'){ echo $sheets['o_pmpickloc'];} ?></span></b></h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>PM pick up time:<span class="s_address">   <?php  if ($sheets['o_pmdroploc']!='NULL'){ echo date ('H:i',strtotime($sheets['o_pmpicktime'])) ; } ?></span></b></h6>
                </div>
            </div>
            <div class="row" style="padding-bottom: 10px">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>PM drop off location:<span class="s_address">  <?php if ($sheets['o_pmdroploc']!='NULL'){  echo $sheets['o_pmdroploc'];} ?></span></b></h6>
                </div>
            </div>
            <div class="row s_border">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>Parents Name:<span class="s_address">    <?php echo $sheets['s_pname']; ?></span></b></h6>
                </div>
            </div>
            <div class="row" style="padding-bottom: 10px">
                <div class="col-lg-12">
                    <h6 class="sheetf"><b>Phone Number:<span class="s_address">   <?php echo $sheets['s_phone']; ?>  <?php if(!empty($sheets['s_altphone'])) {?> - <?php echo $sheets['s_altphone']; }?></span></b></h6>
                </div>
            </div>
                <div class="row s_border">
                    <div class="col-lg-12">
                        <h6 style="padding-bottom: 10px" class="sheetf"><b>Comments:<span class="s_address">   <?php echo $sheets['o_dcomment']; ?></span></b></h6>
                    </div>
                </div>
                <br>
            <div class="row sheetf">
                <div class="col-lg-12">
                    <h5 style="text-align: center"><b>Requested By:</b></h5>
                    <h6 style="text-align: center;padding-bottom: 10px"> <b>    <span>  Department of Transportation</span></b></h6>
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
                <div>
                    <div class="container-fluid">
                        <div class="row">
                        <div class="col-lg-10" style="padding-left: 0">
                            <select class="form-control" id="clock" onchange="getdata(id,this)" style="width:100px;">
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