<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
$driver_payable=0;
$driver_tip = 0;
$driver_name="";
$additions="";
$fuel_advance="";
$toll="";
$advance="";
$other="";
$start_date="";
$end_date="";
$driver_id="";
?>
<?php
if(isset($_POST['driver_id'])) {
   $driver_id= $_POST['driver_id'];
   $start_date= $_POST['fstartdate'];
   $end_date= $_POST['fenddate'];
   $driver_name=$_POST['db_drivername'];
 // $driverTripsCount= getDriverTripCount($driver_id,$start_date,$end_date);
 // error_log("\nDriver Billing trips count" . $driverTripsCount['drivertripcount'] , 3, "C:/xampp/apache/logs/error.log");
//  $driverBillDetails= getDriverBillDetails($driver_id,$start_date,$end_date);
//while ($billDetails = mysqli_fetch_assoc($driverBillDetails)) {
//   $driver_tip += $billDetails['tripperorder']*$billDetails['o_tip'];
//   $driver_payable+=$billDetails['tripperorder']*$billDetails['o_payable'];
//}

  $driverBill=getDriverBill($driver_id,$start_date,$end_date);
  $d_print=getDriverBill($driver_id,$start_date,$end_date);
  $cashAdvanceDetails= getCashAdvance($driver_id,$start_date,$end_date);
  $advance=$cashAdvanceDetails['cashAdvance'];


}


?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<style type="text/css">
    ul.ui-autocomplete {
        z-index: 1100;
    }
    .ui-datepicker { position: relative; z-index: 10000 !important; }
    .toprint
    { display: none; }

</style>
<style type="text/css" media="print">
    .dontprint
    { display: none; }
    .toprint
    { display: inline; }
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
        margin: 0.5cm;  /* this affects the margin in the printer settings */
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


</style>

<div class="toprint">
    <div id="page-wrapper">
        <br><br><br>
        <div class="container-fluid" style="border-style: solid;">
            <br>
            <h5 style="text-align:center"><b>CONTRACTOR SETTLEMENT SUMMARY</b></h5>
                            <br>
                           <div class="to4Columns" >
                               <div >&nbsp;</div>
                               <div>&nbsp;</div>
                               <div><h6><b>SETTLEMENT PERIOD</b></h6></div>
                               <div>&nbsp;</div>
                           </div>
                           <div class="to2Columns">
                               <div>
                                   <b> <span>CONTRACTOR :</span></b>
                                   <span  style="padding-left: 4px" class="db_contractor">________</span>
                               </div>
                               <div>
                                   <span style="text-align: left">BEGINNING :</span>
                                   <span class="db_startdate" style="text-align: left">________</span>
                                   <span style="text-align: right;padding-left: 5px;">ENDING :</span>
                                   <span class="db_enddate" style="text-align: right">________</span>
                               </div>
                           </div>
            <br>
            <div class="to2Columns">
               <div style="text-align: left">
                   <b> <span>TOTAL BILLINGS FOR PERIOD :</b></span></b>
               </div>
                <div style="text-align: center">$<span class="db_beforeDeductions">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right">
                    <span>CONTRACTOR RATE:</span>
                </div>
                <div style="text-align: center"><span class="db_contractorRate">________</span>%</div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right">
                    <span>PAYABLE TO CONTRACTOR:</span>
                </div>
                <div style="text-align: center">$<span class="db_payable">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right"><span>ADDITIONAL FEES PAYABLE TO CONTRACTOR :</span></div>
                <div style="text-align: center">$<span class="db_additionalFee">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right"><span>CONTRACTOR TIP :</span></div>
                <div style="text-align: center">$<span class="db_tip">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right"><h5><b>CONTRACTOR'S TOTAL BEFORE DEDUCTIONS :</b></h5></div>
                <div style="text-align: center"><b>$<span class="db_totalBeforeDeductions">________</span></b></div>
            </div>
            <br>
            <div class="to2Columns">
                <div style="text-align: left">
                    <b> <span>CHARGEABLE TO CONTRACTOR :</b></span></b>
                </div>
                <div>&nbsp;</div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right">
                    <span>FUEL ADVANCE :</span>
                </div>
                <div style="text-align: center">$<span class="db_fuelAdvance">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right">
                    <span>TOLL ADVANCE :</span>
                </div>
                <div style="text-align: center">$<span class="db_tollAdvance">________</span></div>
            </div>
            <div class="to3Columns">
                <div style="text-align: right"><span>&nbsp</span></div>
                <div style="text-align: center">LEASE :<span style="padding-left:40px" class="db_leasePercentage">________</span>%</div>
                <div style="text-align: center;padding-right: 120px">$<span class="db_lease">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right"><span>COMMISSION ADVANCE:</span></div>
                <div style="text-align: center">$<span  class="db_commisionAdvance">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right"><span>OTHER:</span></div>
                <div style="text-align: center">$<span class="db_other">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right"><h5><b>TOTAL DUE FROM CONTRACTOR :</b></h5></div>
                <div style="text-align: center"><b>$<span class="db_totalDue">________</span></b></div>
            </div>
            <br>
            <div class="to2Columns">
                <div style="text-align: left">
                    <b> <span>TOTAL PAYABLE TO CONTRACTOR THIS PERIOD</b></span></b>
                </div>
                <div style="text-align: center;padding-left:150px"><b>$<span class="db_totalPayable">________</span></b></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right">
                    <span>CHECK :</span>
                </div>
                <div style="text-align: left">$<span class="db_check">________</span></div>
            </div>
            <div class="to2Columns">
                <div style="text-align: right">
                    <span>ISSUED :</span>
                </div>
                <div style="text-align: left"><span class="db_issuedDate">________</span></div>
            </div>
            <br>


        </div>
        <br><br>
        <table >
            <!--                    <col width="400">-->
            <!--                    <col width="200">-->
            <thead>
            <tr>
                <th style="padding-left:20px;text-align: center" class="col-xs-8"> <span>Description</span></th>
                <th style="padding-left:20px;text-align: center" class="col-xs-2"> <span>Amount</span></th>
                <th style="padding-left:20px;text-align: center" class="col-xs-2"> <span>Tip</span></th>
            </tr>
            </thead>
            <tbody>
            <?php
            // Use returned data (if any)
            // Use returned data (if any)
            if(isset($_POST['driver_id'])) {
            while ($cbill = mysqli_fetch_assoc($d_print)) {

                $originalDate = $cbill['triplog_date'];
                $newDate = date("F j, Y", strtotime($originalDate));
                ?>

                <tr>
                    <td style="padding-left:10px;padding-right:20px" class="col-xs-8">
                        <span><?php echo $newDate; ?>-</span>
                        <span><?php echo $cbill["s_name"]; ?></span>
                        <span><?php echo date ('H:i',strtotime($cbill["triplog_picktime"]))  ?>&nbsp;</span>
                        <?php if($cbill['triplog_clock']=='AM') {?>
                            <span>res to</span>
                            <span><?php echo  $cbill["school_abr"];?></span>
                        <?php } ?>
                        <?php if($cbill['triplog_clock']=='PM') {?>
                            <span><?php echo  $cbill["school_abr"];?></span>
                            <span>to res</span>
                        <?php } ?>
                    </td>
                    <td style="text-align: right" class="col-xs-2">
                        $<span ><?php echo $cbill["o_payable"]; ?></span>
                    </td>
                    <td style="text-align: right" class="col-xs-2">
                        $<span ><?php echo $cbill["o_tip"]; ?></span>
                    </td>
                </tr>
            <?php }}?>
            <tr style="height:40px">
                <td style="padding-left:20px"  class="col-xs-8"> It's been pleasure working with you!</td>
                <td style="padding-right:20px;text-align: center" colspan="2">Total:&nbsp;&nbsp;<span class="db_totalPayable"> </span></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Page Content -->
<div id="page-wrapper" class="dontprint">
    <div class="container-fluid">

        <div class="row" >
            <div class="col-lg-12">
                <h1 class="page-header">Contractors Settlement Record</h1>
                <div class="btn-group form-group">

                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        Filters
                    </button>


                    <button type="button" class="btn btn-primary btn-lg" onclick="printDriverBill();">
                        Print
                    </button>

                </div>
                <!--Start Modal  -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <form method="post" enctype="multipart/form-data" class="form-horizontal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="myModalLabel">Driver Bill</h4>
                            </div>

                            <div class="modal-body">
                                <label>Driver</label>
                                <div class="input-group">
                                    <input id="drivername" name="db_drivername" required class="form-control typeahead" placeholder="" style="width: 500px" >
                                    <input class="form-control" id="driver_id" name="driver_id" type="hidden" placeholder="">
                                </div>

                                <label>Start Date</label>
                                <div class="input-group">
                                    <input type="text" name="fstartdate" class="form-control date" id="from" required="true"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                                <label>End Date</label>
                                <div class="input-group">
                                    <input type="text" name="fenddate" class="form-control date" id="to" required><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" id="driverBillFilter" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <!--End Modal  -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div style="display: inline-block">
                            <span>Settlement Record : </span>

                        </div>
                        <div style="display: inline-block" >
                                <h4 id="db_drivername"><?php echo $driver_name; ?>  </h4>
                        </div>


                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-fixed dataTab">
                                <thead>
                                <tr>
                                    <th class="col-xs-1">Date</th>
                                    <th class="col-xs-2">Student Name</th>
                                    <th class="col-xs-2">Total</th>
                                    <th class="col-xs-1">Tip</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                // Use returned data (if any)
                                if(isset($_POST['driver_id'])) {
                                    // Use returned data (if any)
                                    while ($bill = mysqli_fetch_assoc($driverBill)) {
                                        // output data from each row
                                             $driver_tip += $bill['o_tip'];
                                             $driver_payable+=$bill['o_payable'];

                                        // output data from each row
                                        ?>
                                        <tr>
                                            <td class="col-xs-1"><?php echo $bill['triplog_date']; ?></td>
                                            <td class="col-xs-2"><?php echo $bill['s_name']; ?></td>
                                            <td class="col-xs-2"><?php echo $bill['o_payable']; ?></td>
                                            <td class="col-xs-1"><?php echo $bill['o_tip']; ?></td>
                                        </tr>

                                        <?php
                                    }
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
                <h3 class="page-header">Contractors Settlement Summary</h3>
                <div class="col-lg-4">
                    <input class="form-control" id="db_from"  type="hidden" placeholder="" value="<?php echo $start_date;?>">
                    <input class="form-control" id="db_to"  type="hidden" placeholder="" value="<?php echo $end_date;?>">
                    <input class="form-control" id="cashad_driverid"  type="hidden" placeholder="" value="<?php echo $driver_id;?>">
                    <input class="form-control" id="cashad_initial"  type="hidden" placeholder="" value="<?php echo $advance;?>">

                    <div class="form-group">
                            <label>Total Billing</label>
                            <p style="height:40px;">$<span id="d_payable"><?php echo $driver_payable; ?></span></p>
                    </div>
                    <div class="form-group">
                        <select id="d_contractorsPay">
                            <option value="5">5%</option>
                            <option value="10">10%</option>
                            <option value="15">15%</option>
                            <option value="20">20%</option>
                            <option value="25" selected>25%</option>
                            <option value="30">30%</option>
                            <option value="35">35%</option>
                            <option value="40">40%</option>
                        </select>
                        <label>Pay To Contractors</label>
                        <p>$<span id="d_pay"><?php echo $driver_payable*0.25; ?></span></p>
                    </div>
                    <div class="form-group">
                        <label>Tips</label>
                    <p style="height:25px;">$<span  id="d_tip"><?php echo $driver_tip; ?></span></p>
                    </div>
                    <div class="form-group">
                        <label>Additions</label>
                        <input class="form-control" name="d_additions" id="d_additions" type="number" value="<?php echo $additions; ?>" >
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group">
                        <label style="height:30px;">Contactors Total</label>
                        <p> $<span id="d_contractorTotal"><?php echo $driver_payable*0.25+$driver_tip; ?></span></p>
                    </div>

                </div>
                <div class="col-lg-4" id="d_deductions">

                    <div class="form-group">
                        <label>Fuel Advance($)</label>
                        <input class="form-control fuel_advance"  type="number" value="<?php echo $fuel_advance; ?>"/>
                    </div>
                    <div class="form-group">
                        <label>Tolls($)</label>
                        <input class="form-control d_tolls"  type="number" value="<?php echo $toll; ?>"/>
                    </div>
                    <div class="form-group">
                        <select class="d_leasepercentage">
                            <option value="0">0%</option>
                            <option value="5">5%</option>
                            <option value="10">10%</option>
                            <option value="15">15%</option>
                            <option value="20">20%</option>
                            <option value="25">25%</option>
                            <option value="30">30%</option>
                            <option value="35">35%</option>
                            <option value="40">40%</option>
                        </select>
                        <label>Lease</label>
                        <p>$<span class="d_lease">0</span></p>
                    </div>

                        <div class="form-group">
                            <label>Advances($)</label><br>
                            <input class="form-control cash_advance" style="width:200px;display: inline-block" type="number" value="<?php echo $advance; ?>"/>
                            <button type="button" class="btn btn-primary" style="display: inline-block" onclick="updateCashAdvance()">
                                Update
                            </button>
                            <p style="display: inline-block;color:crimson" class="advance_result"></p>
                        </div>
                        <div class="form-group">
                            <label>Other($)</label>
                            <input class="form-control d_others"  type="number" value="<?php echo $other; ?>"/>
                        </div>


                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label>Total Settlement Check</label><br>
                        <p style="display:inline-block;padding-right: 140px">$<span id="d_finalCheck"><?php echo $driver_payable*0.05+$driver_tip-$advance ?></span></p>
                        <button type="button" class="btn btn-primary" style="display: inline-block" onclick="setDriverBill()">
                            Calculate
                        </button>

                    </div>
                </div>
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
