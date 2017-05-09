<?php
  include("./includes/db_connection.php");
  include("./includes/functions.php"); 
?>
<?php if(isset($_POST['addclient']))
{
    $client_name = $_POST['clientname'];
    $client_abr = $_POST['abbrevation'];
    $client_street = $_POST['street'];
    $client_address = $_POST['address'];
    $client_city = $_POST['city'];
    $client_state = $_POST['state'];
    $client_zip = $_POST['zipcode'];
    $client_country = $_POST['country'];
    $client_contact = $_POST['contact'];

insert_client($client_name, $client_abr, $client_street, $client_address, $client_city, $client_state, $client_zip, $client_country, $client_contact);
}
?>
<?php
  include("./includes/htmlheader.php");
  include("./includes/nav.php"); 
?>
       
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    <form method="post" enctype="multipart/form-data" id="newuser" class="form-horizontal">
                        <h1 class="page-header">Add Client</h1>
                            <div class="form-group">
                                <label>Client Name</label>
                                <input class="form-control" placeholder="Client Name" name="clientname">
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group">
                                <label>Abbrevation</label>
                                <input class="form-control" placeholder="Client Abbrevation" name="abbrevation">
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="inputSuccess">Address</label>
                                <input type="text" class="form-control"  placeholder="Enter Street" name="street">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Addresss line 2" name="address">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="City" name="city">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="State / Province / Region" name="state">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Postal / Zip Code" name="zipcode" >
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Country" name="country" value="United States">
                            </div>
                            <div class="form-group">
                                <label>Contact Number</label>
                                <input class="form-control" placeholder="Contact Number" name="contact">
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" name="addclient">Submit</button>
                            </div>
                        </form>
                    </div> <!-- /.col-lg-12 -->
                            <!-- /.panel -->


                    </div><!-- /.row -->
                   
                    
                </div><!-- /.container-fluid -->
        </div>
                 
        <!-- /#page-wrapper -->


<?php
  require_once("./includes/footer.php");
?>

