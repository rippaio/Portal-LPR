<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php

if(isset($_POST['sc_ctypeSelect'])) {
$sc_name=$_POST['sc_name'];
$sc_ctype=$_POST['sc_ctypeSelect'];
$sc_abr=$_POST['sc_abr'];
$sc_cnumber=$_POST['sc_cnumber'];
$sc_cname=$_POST['sc_cname'];
$sc_stype=$_POST['sc_sctypeSelect'];
$sc_steet =$_POST['sc_stret'];
$sc_addr=$_POST['sc_address'];
$sc_city=$_POST['sc_city'];
$sc_state=$_POST['sc_state'];
$sc_zip=$_POST['sc_zip'];
$sc_country=$_POST['sc_country'];
inserNewSchool($sc_name,$sc_ctype,$sc_abr,$sc_cnumber,$sc_cname,$sc_stype,$sc_steet,$sc_addr,$sc_city,$sc_state,$sc_zip,$sc_country);

}




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
                    <input class="form-control" placeholder="School Name" name="sc_name" required>
                    <p class="help-block"></p>
                </div>
                    <div class="form-group">
                        <label>Client</label>
                        <select class="form-control" id="add_typeSelect" name="sc_ctypeSelect" required>
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
                        <input type="text" class="form-control" id="exampleInputEmail3" name="sc_abr" placeholder="Enter Abbrevation" required>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputSuccess">School Contact Number</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" name="sc_cnumber" placeholder="Enter  Contact Number" required>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputSuccess">School Contact Name</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" name="sc_cname"  placeholder="Enter  Contact Name" required>
                    </div>
                    <div class="form-group">
                        <label>School-Type</label>
                        <select class="form-control" id="stypeSelect" name="sc_sctypeSelect" required>
                            <option value="">Select</option>
                            <option>Elementary</option>
                            <option>Preschool</option>
                            <option>Middle</option>
                            <option>High</option>
                            <option>Special</option>
                            <option>Alternative</option>
                            <option>pilot</option>
                        </select>
                    </div>
                <div class="form-group">
                        <label class="control-label" for="inputSuccess">Address</label>
                        <input type="text" class="form-control" id="exampleInputEmail3"  name="sc_stret" placeholder="Enter Street" required>
                    </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" name="sc_address" placeholder="Addresss line 2">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" name="sc_city"  placeholder="City" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" name="sc_state" placeholder="State / Province / Region" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" name="sc_zip" type="number" placeholder="Postal / Zip Code" >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="exampleInputEmail3" name="sc_country" placeholder="Country" value="United States">
                </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg" >Submit</button>
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
