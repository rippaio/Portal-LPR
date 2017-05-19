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
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">New Order</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            New Order
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <form role="form-inline">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <label>Client</label>
                                            <select class="form-control" id="ctypeSelect">
                                             <?php
                                                // 3. Use returned data (if any)
                                                while($subject_client = mysqli_fetch_assoc($result_client)) {
                                                    // output data from each row
                                            ?>
                                                    <option><?php echo $subject_client["client_name"]; ?></option>
                                            <?php
                                                }
                                            ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                        <label>School-Type</label>
                                            <select class="form-control" id="stypeSelect">
                                                <option>Select</option>
                                                <option>Elementary</option>
                                                <option>Middle</option>
                                                <option>High</option>
                                                <option>Other</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                        <label>School-Name</label>
                                            <select class="form-control" id="sSelect">
                                                <option>Select</option>
                                            </select>
                                        </div>
                                        <div id="studentdetails">
                                        <span>
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input class="form-control" placeholder="First Name">
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input class="form-control" placeholder="Last Name">
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label>Grade</label>
                                                <input class="form-control" placeholder="Enter Grade">
                                            </div>
                                            <div class="form-group">
                                                <label>Gender</label>
                                                <input class="form-control" placeholder="Enter Gender">
                                            </div>
                                            <div class="form-group">
                                            <label>Start Date</label>
                                            <div class="input-group date">
                                              
                                              <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                            </div>
                                            <div class="form-group">
                                            <label>End Date</label>
                                            <div class="input-group date">
                                            
                                              <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                            </div>
                                        </span>
                                        </div>
                                        <div class="form-group">
                                        <button type="button" id ="addstudent" class="btn btn-primary">Add Student</button>
                                        </div>
                                        <div class="form-group">
                                            <label>Days Needed</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Monday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Tuesday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Wednesday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Thursday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Friday
                                                </label>
                                            </div>
                                        </div>
                                        <h4>AM Trip</h4>
                                            <div class="form-group">
                                                <label>Pickup Location</label>
                                                <input class="form-control" placeholder="Enter Location">
                                            </div>
                                            <div class="form-group">
                                                <label>Pickup Time</label>
                                                <div class="input-group clockpicker">
                                                    <input type="text" class="form-control" value="18:00">
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Drop Location</label>
                                                <input class="form-control" placeholder="Enter Location">
                                            </div>
                                            <div class="form-group">
                                                <label>Drop Time</label>
                                                <div class="input-group clockpicker">
                                                    <input type="text" class="form-control" value="18:00">
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <h4>PM Trip</h4>
                                            <div class="form-group">
                                                <label>Pickup Location</label>
                                                <input class="form-control" placeholder="Enter Location">
                                            </div>
                                            <div class="form-group">
                                                <label>Pickup Time</label>
                                                <div class="input-group clockpicker">
                                                    <input type="text" class="form-control" value="18:00">
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Drop Location</label>
                                                <input class="form-control" placeholder="Enter Location">
                                            </div>
                                        
                                    
                                    </div>    
                                
                                
                                    <!-- /.col-lg-6 (nested) -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="control-label" for="inputSuccess">Residing Address</label>
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
                                          <h4>Parent Details</h4>
                                          <div class="form-group">
                                            <label>First Name</label>
                                            <input class="form-control" placeholder="First Name">
                                            <p class="help-block"></p>
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input class="form-control" placeholder="Last Name">
                                            <p class="help-block"></p>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input class="form-control" placeholder="Enter Phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Alternate Phone</label>
                                            <input class="form-control" placeholder="Enter Phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Add-ons</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Female Driver Only
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Ride Along
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Wheel Chair
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Additional Stop
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleTextarea">Internal Comment</label>
                                                <textarea class="form-control input-sm" id="exampleTextarea" rows="3"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleTextarea">Driver Comment</label>
                                                <textarea class="form-control input-sm" id="exampleTextarea" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Requested By</label>

                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Norfolk Public Schools (NPS)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Norfolk Public Schools Special Education (NSPED)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Norfolk Department of Human Services (NDHS)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Portsmouth Public Schools (PPS)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Portsmouth Public Schools Special Education (PSPED)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Chesapeake Public Schools Special Education (CSPED)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Hampton Public Schools (HPS)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Suffolk Public Schools (SPS)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Isle of Wight Public Schools (IWPS)</label>
                                            </div>
                                            <div class="radio">
                                              <label><input type="radio" name="optradio">Southampton County Public Schools (SCPS)</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="splitbill">Billing
                                                </label>
                                            </div>
                                                <div class ="splitbill box">
                                                    <h5>Select the type of billing</h5>
                                                <div class="form-group">
                                                <div class="radio">
                                                <label>
                                                    <input type="radio" value="inzone" name="billingradio">In Zone
                                                </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" value="outzone" name="billingradio">Out Zone
                                                    </label>
                                                </div>
                                                </div>
                                                <div class="splitcheckbox box">
                                                <label>
                                                    Split Bills
                                                </label>
                                                <div class ="split">
                                                    <h5>Select the cities where the bills needs to be split</h5>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="">Hampton
                                                            <input type="text" placeholder="">
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="">Virginia Beach
                                                            <input type="text" placeholder="">
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="">Chesapeake
                                                            <input type="text" placeholder="">
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="">Suffolk
                                                            <input type="text" placeholder="">
                                                        </label>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="">Portsmouth
                                                            <input type="text" placeholder="">
                                                        </label>
                                                    </div>
                                                </div>
                                                </div>
                                                </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Billable</label>
                                            <div class="input-group">
                                            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Driver</label>
                                            <input class="form-control typeahead" placeholder="">
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>Payable</label>
                                            <div class="input-group">
                                            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>

                                            </div>
                                        </div>
                                    
                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                </form>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
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

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <script src="./src/clockpicker.js"></script>
    <script src="../vendor/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="../vendor/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.js"></script>

        
    <script type="text/javascript">
        $('.clockpicker').clockpicker({
            placement: 'top',
            align: 'left',
            donetext: 'Done'
        });
        
        // $('input[type="checkbox"]').click(function(){
        //     if($(this).attr("value")=="split"){
        //         $(".split").toggle();
        //     }
            
        // });
        
        
        </script>

<?php
  require_once("./includes/footer.php");
?>
