<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
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
<?php
if(isset($_POST['driver_id'])&& !empty($_POST['driver_id'])) {
   $driver_id= $_POST['driver_id'];
   $start_date= $_POST['fstartdate'];
   $end_date= $_POST['fenddate'];

  $query ="SELECT * FROM lpr_payroll LEFT JOIN lpr_driver ON lpr_payroll.driver_id=lpr_driver.driver_id WHERE '$start_date' <= startdate AND '$end_date' >=enddate AND lpr_driver.driver_id=$driver_id ";

    error_log("\nChange Order" . $query , 3, "C:/xampp/apache/logs/error.log");
    $result = mysqli_query($connection, $query);

    confirm_query($result);


}
elseif (isset($_POST['fstartdate'],$_POST['fenddate'])) {
    $start_date= $_POST['fstartdate'];
    $end_date= $_POST['fenddate'];

    $query ="SELECT * FROM lpr_payroll LEFT JOIN lpr_driver ON lpr_payroll.driver_id=lpr_driver.driver_id WHERE '$start_date' <= startdate AND '$end_date' >=enddate ";

    error_log("\nChange Order" . $query , 3, "C:/xampp/apache/logs/error.log");
    $result = mysqli_query($connection, $query);

    confirm_query($result);
}
?>
<div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Payroll</h1>
                        <div class="btn-group form-group">

                                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                        Filters
                                    </button>


                                    <button type="button" class="btn btn-primary btn-lg">
                                        Print
                                    </button>


                                </div>
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                    Payroll
                                </div>
                                <!-- /.panel-heading -->
                                
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped dataTab">
                                            <thead>
                                                <tr>
                                                    <th>Driver Name</th>
                                                    <th>Start Date</th>
                                                    <th>End Date</th>
                                                    <th>Amount</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            <?php
                                            // Use returned data (if any)
                                            if(isset($_POST['fstartdate'])) {
                                            while($subject = mysqli_fetch_assoc($result)) {

                                            ?>
                                                <tr><?php if ($subject["driver_dname"] == NULL) { ?>
                                                    <td><?php echo $subject["driver_fname"]. " ".$subject["driver_lname"]; ?></td>
                                                    <?php } else {?>
                                                    <td><?php echo $subject["driver_dname"]; ?></td>
                                                    <?php } ?>
                                                    <td><?php echo $subject["startdate"]; ?></td>
                                                    <td><?php echo $subject["enddate"]; ?></td>
                                                    <td><?php echo $subject["amount"]; ?></td>
                                                    
                                                    
                                                    <td><button type="button" class="btn btn-danger" onclick="deletepay(this,<?php echo $subject["pl_id"]; ?>);">Delete</button></td>
                                                </tr>
                                            <?php } }?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
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
                                                <input id="drivername" name="db_drivername" class="form-control typeahead" placeholder="" style="width: 500px" >
                                                <input class="form-control" id="driver_id" name="driver_id" type="hidden">
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
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>

<?php
require_once("./includes/footer.php");
?>
