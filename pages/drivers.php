<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<?php
$query_client  = "SELECT * FROM lpr_driver";
$result_client = mysqli_query($connection, $query_client);
$counter=0;
confirm_query($result_client);
?>

<style>
    .table-fixed thead {
        width: 97%;
    }
    .table-fixed tbody {
        height: 500px;
        overflow-y: auto;
        width: 100%;
    }
    .table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
        display: block;
    }
    .table-fixed tbody td, .table-fixed thead > tr> th {
        float: left;
        border-bottom-width: 0;
    }



</style>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Drivers</h1>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        All Rows
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">

                            <table class="table table-fixed">
                                <thead>
                                <tr>
                                    <th class="col-xs-1">#</th>
                                    <th class="col-xs-2">Driver Name</th>
                                    <th class="col-xs-2">Mobile Number</th>
                                    <th class="col-xs-2" style="padding-left: 30px">City</th>
                                    <th class="col-xs-2">Commision</th>
                                    <th class="col-xs-1" style="text-align:left; padding-left: 45px;">Edit</th>
                                    <th class="col-xs-2" style="padding-left: 45px">State</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    // Use returned data (if any)
                                    while($subject_client = mysqli_fetch_assoc($result_client)) {
                                    // output data from each row
                                    ?>
                                    <tr>
                                        <td class="col-xs-1"><?php echo ++$counter; ?></td>
                                        <td class="col-xs-2"><?php echo $subject_client["driver_fname"]; ?></td>
                                        <td class="col-xs-2"><?php echo $subject_client["driver_contact_no"]; ?></td>
                                        <td class="col-xs-2"><?php echo $subject_client["driver_city"]; ?></td>
                                        <td class="col-xs-2"><?php echo $subject_client["driver_commision"]; ?></td>
                                        <td class="col-xs-1"><a href="<?php echo 'adddriver.php?driver_id=' . $subject_client['driver_id']; ?>" class="size2" style="color: #5cb85c;margin: inherit;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                        <td class="col-xs-2"><button type="button" class="btn btn-success">Active</button></td>
                                    </tr>

                                        <?php
                                    }
                                    ?>

                                </tbody>
                            </table>

                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <div class="form-group">
                    <a href="adddriver.php" class="btn btn-primary btn-lg btn-block" role="button">Add Driver</a>
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
