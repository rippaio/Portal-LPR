<?php
  include("./includes/db_connection.php");
  include("./includes/functions.php"); 
?>
<?php 
$query_client  = "SELECT * FROM lpr_client";
$result_client = mysqli_query($connection, $query_client);
$result_client2 = mysqli_query($connection, $query_client);
$result_client3 = mysqli_query($connection, $query_client);
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
                                <form role="form-inline" id="createorder">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <label>Client</label>
                                            <select class="form-control" id="ctypeSelect" name="ctypeSelect" required>
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
                                        <label>School-Type</label>
                                            <select class="form-control" id="stypeSelect" name="stypeSelect" required>
                                                <option value="">Select</option>
                                                <option>Elementary</option>
                                                <option>Preschool</option>
                                                <option>Middle</option>
                                                <option>Upper</option>
                                                <option>Special</option>
                                                <option>Alternative</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                        <label>School-Name</label>
                                            <select class="form-control" id="sSelect" name="sSelect" required>
                                                <option value="">Select</option>
                                            </select>
                                        </div>
                                        <div id="studentdetails">
                                        <span>
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input class="form-control" name="s_fname" placeholder="First Name" required>
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input class="form-control" name="s_lname" placeholder="Last Name" required>
                                                <p class="help-block"></p>
                                            </div>
                                            <div class="form-group">
                                                <label>Grade</label>
                                                <input class="form-control" name="s_grade" placeholder="Enter Grade" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Gender</label>
                                                <input class="form-control" name="s_gender" placeholder="Enter Gender" required>
                                            </div>
                                            <div class="form-group" >
                                            <label>Start Date</label>
                                            <div class="input-group">
                                              
                                              <input type="text" name="o_startdate" class="form-control" id="from" required><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                            </div>
                                            <div class="form-group">
                                            <label>End Date</label>
                                            <div class="input-group">
                                            
                                              <input type="text" name="o_enddate" class="form-control" id="to" required><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
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
                                                    <input type="checkbox" name="dayscheckbox" value="Monday">Monday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="dayscheckbox" value="Tuesday">Tuesday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="dayscheckbox" value="Wednesday">Wednesday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="dayscheckbox" value="Thursday">Thursday
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="dayscheckbox" value="Friday">Friday
                                                </label>
                                            </div>
                                        </div>
                                        <h4>AM Trip</h4>
                                            <div class="form-group">
                                                <label>Pickup Location</label>
                                                <input class="form-control" name="o_ampickloc" placeholder="Enter Location" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Pickup Time</label>
                                                <div class="input-group clockpicker">
                                                    <input type="text" class="form-control clockformat" name="o_ampicktime" value="18:00" required>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Drop Location</label>
                                                <input class="form-control" id="amDropLoc" name="o_amdroploc" placeholder="Enter Location" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Drop Time</label>
                                                <div class="input-group clockpicker">
                                                    <input type="text" class="form-control clockformat" name="o_amdroptime" value="18:00" required>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <h4>PM Trip</h4>
                                            <div class="form-group">
                                                <label>Pickup Location</label>
                                                <input class="form-control" id="pmDropLoc" name="o_pmpickloc" placeholder="Enter Location" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Pickup Time</label>
                                                <div class="input-group clockpicker">
                                                    <input type="text" class="form-control clockformat" name="o_pmpicktime" value="18:00" required>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Drop Location</label>
                                                <input class="form-control" placeholder="Enter Location" name="o_pmdroploc" required>
                                            </div>
                                        
                                    
                                    </div>    
                                
                                
                                    <!-- /.col-lg-6 (nested) -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="control-label" for="inputSuccess">Residing Address</label>
                                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter Street" name="street" required>
                                          </div>
                                          <div class="form-group">
                                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Addresss line 2" name="address" required>
                                          </div>
                                          <div class="form-group">
                                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="City" name="city" required>
                                          </div>
                                          <div class="form-group">
                                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="State / Province / Region" name="state" value="VA" required>
                                          </div>
                                          <div class="form-group">
                                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Postal / Zip Code" name="zipcode" required>
                                          </div>
                                          <div class="form-group">
                                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Country" name="country" value="United States" required>
                                          </div>
                                          <h4>Parent Details</h4>
                                          <div class="form-group">
                                            <label>First Name</label>
                                            <input class="form-control" placeholder="First Name" name="pfname" required>
                                            <p class="help-block"></p>
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input class="form-control" placeholder="Last Name" name="plname" required>
                                            <p class="help-block"></p>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input class="form-control" placeholder="Enter Phone" name="phone" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Alternate Phone</label>
                                            <input class="form-control" placeholder="Enter Phone" name="altphone" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Add-ons</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="o_fd" class="aocheckbox" value="femaledriver">Female Driver Only
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="o_ra" class="aocheckbox" value="ridealong">Ride Along
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="o_wc" class="aocheckbox" value="wheelchair">Wheel Chair
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="o_as" class="aocheckbox" value="addnlstop">Additional Stop
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleTextarea">Internal Comment</label>
                                                <textarea class="form-control input-sm" name="icomment" rows="3" value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleTextarea">Driver Comment</label>
                                                <textarea class="form-control input-sm" name="dcomment" rows="3" value=""></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Requested By</label>
                                             <?php
                                                // 3. Use returned data (if any)
                                                while($subject_client = mysqli_fetch_assoc($result_client2)) {
                                                    // output data from each row
                                            ?>
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" data-zone_id="<?php echo $subject_client["zone_id"]; ?>"  value="<?php echo $subject_client["client_id"]; ?>"><?php echo $subject_client["client_name"]; ?></label>
                                                </div>
                                            <?php
                                                }
                                            ?>
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
                                                    <input type="radio" data-value="inzone" value="inzone" name="billingradio" checked>In Zone</input>
                                                </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" data-value="outzone" value="outzone" name="billingradio">Out Zone</input>
                                                    </label>
                                                </div>
                                                </div>
                                                <div class="splitcheckbox box">
                                                <label>
                                                    Split Bills
                                                </label>
                                                <div class ="split">
                                                    <h5>Select the cities where the bills needs to be split</h5>
                                                <?php
                                                // 3. Use returned data (if any)
                                                    while($subject_client = mysqli_fetch_assoc($result_client3)) {
                                                    // output data from each row
                                                ?>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="billsplit" value="<?php echo $subject_client["client_id"]; ?>"><?php echo $subject_client["client_name"]; ?>
                                                            <input type="text" name="billsplitvalue" >
                                                        </label>
                                                    </div>
                                                <?php
                                                    }
                                                ?>
                                                </div>
                                                </div>
                                                </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Billable</label>
                                            <div class="input-group">
                                            <input type="text" id="billtext" name="o_billable" class="form-control" required><span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                                            </div>
                                            <p class="help-block"></p>
                                        </div>
                                        <div class="form-group">
                                            <label>Driver</label>
                                            <input class="form-control typeahead" placeholder="" required>
                                            <input class="form-control" name="driver_id" type="hidden" placeholder="">
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>Payable</label>
                                            <div class="input-group">
                                            <input type="text" name="o_payable" class="form-control" required><span class="input-group-addon" ><i class="glyphicon glyphicon-usd"></i></span>

                                            </div>
                                            <p class="help-block"></p>
                                        </div>
                                        <div class="form-group">
                                            <label>Tip</label>
                                            <div class="input-group">
                                            <input type="text" name="o_tip" class="form-control" required ><span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>

                                            </div>
                                        </div>
                                    
                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                    
                                </form>
                            </div>
                            <!-- /.row (nested) -->
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" form="createorder" id="submitcreateorder">Submit</button>
                            </div>
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

   

<?php
  require_once("./includes/footer.php");
?>