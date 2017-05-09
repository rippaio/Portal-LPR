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
                <h1 class="page-header">School Data</h1>
                    <div class="col-lg-4">
                        <!-- <h1 class="page-header">School Data</h1> -->
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                    Client Data
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                	   
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Client</th>
                                                    <th>Edit</th>
                                                    <th>Delete</th>
                                                    <th>Schools</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <?php
                                                // 3. Use returned data (if any)
                                                while($subject_client = mysqli_fetch_assoc($result_client)) {
                                                    // output data from each row
                                            ?>
                                                    <tr>
                                                    <td><?php echo $subject_client["client_abr"]; ?></td>
                                                    <td><span class="size2" style="color: #5cb85c;margin: auto;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></td>
                                                    <td><span class="size2" style="color: red;margin: auto;"><i class="fa fa-times-circle" aria-hidden="true"></i></span></td>
                                                    <td><span class="size2" style="color: #10c6da;margin: auto;"><i class="fa fa-caret-square-o-right" aria-hidden="true"></i></span></td>
                                                    </tr>
                                            <?php
                                                }
                                            ?>
                                                
                                                    <td>NPS</td>
                                                    <td><span class="size2" style="color: #5cb85c;margin: auto;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></td>
                                                    <td><span class="size2" style="color: red;margin: auto;"><i class="fa fa-times-circle" aria-hidden="true"></i></span></td>
                                                    <td><span class="size2" style="color: #10c6da;margin: auto;"><i class="fa fa-caret-square-o-right" aria-hidden="true"></i></span></td>
                                                
                                                <tr>
                                                    <td>VB</td>
                                                    <td>9:30 AM</td>
                                                    <td><button type="button" class="btn btn-warning">Pending</button></td>
                                                    <td><input type="checkbox" name="bill-checkbox" data-on-text="Edit" data-off-text="Save" checked></td>
                                                </tr>
                                                <tr>
                                                    <td>Ches</td>
                                                    <td>9:30 AM</td>
                                                    <td><button type="button" class="btn btn-success">Success</button></td>
                                                    <td><input type="checkbox" name="bill-checkbox" data-on-text="Edit" data-off-text="Save" checked></td>
                                                </tr>
                                                <tr>
                                                    <td>Nor</td>
                                                    <td>9:30 AM</td>
                                                    <td><button type="button" class="btn btn-primary">Cancelled</button></td>
                                                    <td><input type="checkbox" name="bill-checkbox" data-on-text="Edit" data-off-text="Save" checked></td>
                                                </tr>
                                                <tr>
                                                    <td>VB</td>
                                                    <td>9:30 AM</td>
                                                    <td><button type="button" class="btn btn-danger">No Show</button></td>
                                                    <td><input type="checkbox" name="bill-checkbox" data-on-text="Edit" data-off-text="Save" checked></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive --> 
                                </div>
                                <!-- /.panel-body -->
                            </div>
                        <div class="form-group">
                            <a href="addclient.php" class="btn btn-primary btn-lg btn-block" role="button">Add Client</a>
                        </div>
                            <!-- /.panel -->

                    </div>
                    <div class="col-lg-4">
                        <!-- <h1 class="page-header">School Data</h1> -->
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                    School Data
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                	  
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>
                                    <p>School Name</p>

                                </div>
                                <!-- /.panel-body -->
                            </div>
                        <div class="form-group">
                            <a href="addschool.html" class="btn btn-primary btn-lg btn-block" role="button">Add School</a>
                        </div>
                            <!-- /.panel -->

                    </div>
                    <div class="col-lg-4">
                        <!-- <h1 class="page-header">School Data</h1> -->
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                    All Rows
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                                                  	    
                                
                                </div>
                                <!-- /.panel-body -->
                            </div>
                        <div class="form-group">
                            <a href="addevent.html" class="btn btn-primary btn-lg btn-block" role="button">Add Data</a>
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
