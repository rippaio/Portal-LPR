<?php
include("./includes/db_connection.php");
include("./includes/functions.php");

?>
<?php
$driver_name="";
if(isset($_POST['ca_submit'])) {
    $driver_id= $_POST['driver_id'];
    $driver_name=$_POST['ca_drivername'];
    $query_advance  = "SELECT * FROM lpr_cashadvance where c_driverid=$driver_id";
    $result_advance = mysqli_query($connection, $query_advance);
    confirm_query($result_advance);


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
    </style>


<div id="page-wrapper" class="dontprint">
    <div class="container-fluid">
        <div class="row" >
            <div class="col-lg-12">

                <h1 class="page-header">Advance Records</h1>
                <div class="btn-group form-group">
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#cashmodal">
                        Filters
                    </button>
                </div>
                <!--Start Modal  -->
                <div class="modal fade" id="cashmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <form method="post" enctype="multipart/form-data" class="form-horizontal">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">Select Driver</h4>
                                </div>

                                <div class="modal-body">
                                    <label>Driver</label>
                                    <div class="input-group">
                                        <input id="drivername" name="ca_drivername" required class="form-control typeahead" placeholder="" style="width: 500px" >
                                        <input class="form-control" id="driver_id" name="driver_id" type="hidden" placeholder="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" id="driverBillFilter" name="ca_submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="display: inline-block">
                        <span>Records : </span>

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
                                <th class="col-xs-3">Date</th>
                                <th class="col-xs-3">Amount($)</th>
                                <th class="col-xs-4">Transaction Type</th>
                                <th class="col-xs-2">Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            // Use returned data (if any)
                            if(isset($_POST['ca_submit'])) {
                                // Use returned data (if any)
                                while ($advance = mysqli_fetch_assoc($result_advance)) {
                                    ?>
                                    <tr>
                                        <td class="col-xs-3"><?php echo $advance['c_Date']; ?></td>
                                        <td class="col-xs-3"> <?php echo $advance['c_payable']; ?></td>
                                        <td class="col-xs-4"> <?php echo $advance['c_type']; ?></td>
                                        <td class="col-xs-2"> <button type="button" class="btn btn-danger dstatus" onclick="ca_delete(this);">Click to Delete</button></td>
                                        <input type="hidden" data-transid="<?php echo $advance['c_advanceid']; ?>">
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


            </div>
        </div>
    </div>














<?php
require_once("./includes/footer.php");
?>
