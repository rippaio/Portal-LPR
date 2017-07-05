<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
$query_client  = "SELECT * FROM lpr_client";
$result_client = mysqli_query($connection, $query_client);
confirm_query($result_client);
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>




<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add School</h1>
                <form method="post" enctype="multipart/form-data" id="addnSchool" name="addnSchool" class="form-horizontal" >
                <div class="form-group">
                    <label>School Name</label>
                    <input class="form-control" placeholder="School Name">
                    <p class="help-block"></p>
                </div>
                    <div class="form-group">
                        <label>Client</label>
                        <select class="form-control" id="add_typeSelect" name="add_ctypeSelect" required>
                            <option value="">Select</option>
                            <?php
                            // 3. Use returned data (if any)
                            while($subject_client = mysqli_fetch_assoc($result_client)) {
                                // output data from each row
                                ?>
                                <option data-zone_id="<?php echo $subject_client["zone_id"]; ?>" value="<?php echo $subject_client["client_id"]; ?>"><?php echo $subject_client["client_name"]; ?></option>
                                <?php
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputSuccess">School Abr</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter Abbrevation">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputSuccess">School Contact Number</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter  Contact Number">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputSuccess">School Contact Name</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter  Contact Name">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputSuccess">School Type</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter  Contact Name">
                    </div>
                <div class="form-group">
                        <label class="control-label" for="inputSuccess">Address</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter Street">
                    </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Addresss line 2">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="City">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="State / Province / Region">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Postal / Zip Code">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Country">
                </div>

                    <div class="form-group">
                        <a href="adddriver.html" class="btn btn-primary btn-lg" role="button">Submit</a>
                    </div>
                </form>
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

</div>
<!-- /#wrapper -->





<?php
require_once("./includes/footer.php");
?>
