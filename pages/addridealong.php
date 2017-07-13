<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
$update=false;
$ra_id="";
$first_name="";
$middle_name ="";
$last_name = "";
$contact_number ="";
$address ="";
if(isset($_POST['submitra'])) {
    $first_name = $_POST['ra_firstname'];
    $middle_name = $_POST['ra_middlename'];
    $last_name = $_POST['ra_lastname'];
    $contact_number = $_POST['ra_contactnumber'];
    $address = $_POST['ra_address'];
    insert_ra($first_name, $middle_name, $last_name, $contact_number, $address);
}

if(isset($_GET['ra_id'])) {
    $ra_id=$_GET['ra_id'];
    $update=true;
    $result_ra= getRalongdata($ra_id);
    $first_name = $result_ra['ra_fname'];
    $middle_name = $result_ra['ra_mname'];
    $last_name = $result_ra['ra_lname'];
    $contact_number = $result_ra['phone'];
    $address = $result_ra['address'];
}
if(isset($_POST['updatera'])) {
    $raid=$_POST['raid'];
    $first_name = $_POST['ra_firstname'];
    $middle_name = $_POST['ra_middlename'];
    $last_name = $_POST['ra_lastname'];
    $contact_number = $_POST['ra_contactnumber'];
    $address = $_POST['ra_address'];
    update_ra($raid,$first_name, $middle_name, $last_name, $contact_number, $address);
}
?>

<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>
<div id="page-wrapper">
    <div class="container-fluid">
        <form method="post" enctype="multipart/form-data" id="newRa" name="newRa">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">Ride Along</h1>
                    <div class="form-group row" >
                        <div class="col-md-6">
                            <label>First Name</label>
                            <input class="form-control" placeholder="First Name" name="ra_firstname" value="<?php echo $first_name; ?>" required >
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="form-group row" >
                        <div class="col-md-6">
                            <label>Middle Name</label>
                            <input class="form-control" placeholder="Middle Name" name="ra_middlename" value="<?php echo $middle_name; ?>">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label>Last Name</label>
                            <input class="form-control" placeholder="Last Name" name="ra_lastname" required value="<?php echo $last_name; ?>">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label>Phone</label>
                            <input class="form-control" placeholder="Enter Phone" name="ra_contactnumber" required value="<?php echo $contact_number; ?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label>Address</label>
                            <input class="form-control" placeholder="Enter Address" name="ra_address" required value="<?php echo $address; ?>">
                            <input class="form-control"  type="hidden" name="raid" required value="<?php echo $ra_id; ?>">
                        </div>
                    </div>

                </div>

                <!-- /.panel -->
            <?php
            if(!$update) {
                ?>
                <!-- /.col-lg-12 -->
                <div class="form-group">
                    <div class="col-md-12">
                        <button type="submit" name="submitra" class="btn btn-primary btn-lg" >Submit</button>
                    </div>
                </div>
                <?php
            }else{
                ?>
                <div class="form-group">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary btn-lg" name="updatera">Update</button>
                    </div>
                </div>
                <?php
            }
            ?>

            </div>

        </form>

    </div>
    <!-- /Container Fluid -->
</div>
<!-- /Page Wrapper -->
<?php
require_once("./includes/footer.php");
?>

