<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>





    <div class="dontprint">
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Ride Along Billing</h1>
                        <div class="btn-group form-group">

                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ra_myModal">
                                Filters
                            </button>


                            <button type="button" class="btn btn-primary btn-lg" onclick="printClientBill();">
                                Print
                            </button>

                        </div>
                        <!--Start Modal  -->
                        <div class="modal fade" id="ra_myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <form method="post" enctype="multipart/form-data" action="ralongbilling.php">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">Filters</h4>
                                        </div>

                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <select class="form-control" id="ra_name" name="ra_name">
                                                    <option value="">Select</option>
                                                </select>
                                            </div>
                                            <label>Start Date</label>
                                            <div class="input-group">
                                                <input type="text" name="ra_startdate" class="form-control date" id="from" required><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                            <label>End Date</label>
                                            <div class="input-group">
                                                <input type="text" name="ra_enddate" class="form-control date" id="to" required><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--End Modal  -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div style="display: inline-block">
                                    <h4>  Trips:</h4>
                                </div>
                                <div style="display: inline-block;padding-left: 10px" >
                                    <h4><?php echo $client_name; ?>  </h4>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table class="table table-fixed dataTab">
                                    <thead>
                                    <tr>
                                        <th  class="col-xs-1">Date</th>
                                        <th  class="col-xs-2">Student Name</th>
                                        <th  class="col-xs-2">Driver Name</th>
                                        <th  class="col-xs-2">Pick Up Time</th>
                                        <th class="col-xs-2">Pick Up Loc</th>
                                        <th  class="col-xs-2">Drop off Loc</th>
                                        <th  class="col-xs-1">Amount</th>
                                    </tr>

                                    </thead>
                                    <tbody>
                                    <?php
                                    // Use returned data (if any)
                                    if(isset($_POST['cb_ctypeSelect'])) {
                                        // Use returned data (if any)
                                        while ($cbill = mysqli_fetch_assoc($cb_details)) {
                                            ?>
                                            <tr>
                                                <td class="col-xs-1"><?php echo $cbill["triplog_date"]; ?></td>
                                                <td class="col-xs-2"><?php echo $cbill["s_name"]; ?></td>
                                                <td class="col-xs-2"><?php echo $cbill["d_name"]; ?></td>
                                                <td class="col-xs-2"><?php echo $cbill["triplog_time"]; ?></td>
                                                <td class="col-xs-2"><?php echo $cbill["pickloc"]; ?></td>
                                                <td class="col-xs-2"><?php echo $cbill["droploc"]; ?></td>
                                                <td class="col-xs-1"><?php echo $cbill["o_billable"]; ?></td>
                                            </tr>

                                        <?php }  } ?>
                                    </tbody>
                                </table>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                        <h3 class="page-header">Ride Along Billing Information</h3>
                        <div class="col-lg-4">

                            <div class="form-group">
                                <label>Total Trips</label>
                                <input class="form-control"  value="<?php echo $totaltrips; ?>">
                                <p class="help-block"></p>
                            </div>
                            <!-- <div class="form-group">
                                <label>Taxable Pay</label>
                                <input class="form-control" placeholder="34">
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group">
                                <label>Tips</label>
                                <input class="form-control" placeholder="67">
                            </div>
                            <div class="form-group">
                                <label>Total taxable</label>
                                <input class="form-control" placeholder="50">
                            </div>
                            <div class="form-group">
                                <label>Total Cash</label>
                                <input class="form-control" placeholder="00">
                            </div> -->
                            <div class="form-group">
                                <label>Total Payable</label>
                                <input class="form-control" value="<?php echo $totalpayable; ?>">
                            </div>

                        </div>
                        <div class="col-lg-8">
                            <!-- <div class="form-group">
                            <a href="adddriver.html" class="btn btn-primary btn-lg" role="button">Print</a>
                            </div> -->
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
    </div>


































<?php
require_once("./includes/footer.php");
?>