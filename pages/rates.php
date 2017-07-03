<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
$query_rate  = "SELECT lpr_zones.zone_id,amount,item,zone_loc FROM lpr_rates,lpr_zones where lpr_rates.zone_id=lpr_zones.zone_id order by zone_id  ";
$result_rate = mysqli_query($connection, $query_rate);
confirm_query($result_rate);

$query_zone="select * from lpr_zones";
$result_zone = mysqli_query($connection, $query_zone);
confirm_query($result_zone);
?>

<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">

            <!--Start Modal  -->
            <div class="modal fade" id="r_myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <form method="post" enctype="multipart/form-data">
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
                                    <label>Zone</label>
                                    <select class="form-control" id="r_zones" name="r_zones" required>
                                        <option value="">Select</option>
                                        <?php
                                        // 3. Use returned data (if any)
                                        while($subject_zone = mysqli_fetch_assoc($result_zone)) {
                                            // output data from each row
                                            ?>
                                            <option data-zone_id="<?php echo $subject_zone["zone_id"]; ?>" value="<?php echo $subject_zone["zone_id"]; ?>"><?php echo $subject_zone["zone_loc"]; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Item</label>
                                    <input class="form-control" placeholder="" name="r_items" id="r_items" value="wesfasd" type="text" required>
                                </div>
                                <div class="form-group">
                                    <label>Amount</label>
                                    <input class="form-control" placeholder="" name="r_amount" id="r_amount" type="number" step="any" required>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary"  onclick="add_rates()">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--End Modal  -->


            <h1 class="page-header">Rates</h1>
            <div class="col-lg-12">
                <!-- <h1 class="page-header">School Data</h1> -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        All Rates
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Zone</th>
                                    <th>item</th>
                                    <th>amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                // 3. Use returned data (if any)
                                while($subject_rate = mysqli_fetch_assoc($result_rate)) {
                                    // output data from each row
                                    ?>
                                    <tr>
                                        <td><?php echo $subject_rate["zone_loc"]; ?></td>
                                        <td><?php echo $subject_rate["item"]; ?></td>
                                        <td><?php echo $subject_rate["amount"]; ?></td>
                                    </tr>
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
                <div class="form-group">
                    <button  class="btn btn-primary btn-lg btn-block " id="add_rates" data-toggle="modal" data-target="#r_myModal">Add Rates</button>
                </div>
                <!-- /.panel -->


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
