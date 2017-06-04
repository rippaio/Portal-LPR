<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>




<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Client Billing</h1>
                <div class="btn-group form-group">

                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        Filters
                    </button>


                    <button type="button" class="btn btn-primary btn-lg">
                        Print
                    </button>

                </div>
                <!--Start Modal  -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    <label>Client</label>
                                    <select class="form-control">
                                        <option>Norfolk Public Schools (NPS)</option>
                                        <option>Norfolk Public Schools Special Education (NSPED)</option>
                                        <option>Norfolk Department of Human Services (NDHS)</option>
                                        <option>Portsmouth Public Schools (PPS)</option>
                                        <option>Portsmouth Public Schools Special Education (PSPED)</option>
                                        <option>Chesapeake Public Schools (CPS)</option>
                                        <option>Chesapeake Public Schools Special Education (CSPED)</option>
                                        <option>Hampton Public Schools (HPS)</option>
                                        <option>Suffolk Public Schools (SPS)</option>
                                        <option>Isle of Wight Public Schools (IWPS)</option>
                                        <option>Southampton County Public Schools (SCPS)</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>School-Type</label>
                                    <select class="form-control">
                                        <option>All</option>
                                        <option>Elementary School</option>
                                        <option>Middle School</option>
                                        <option>High School</option>
                                        <option>Other</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>School-Name</label>
                                    <select class="form-control">
                                        <option>NPS</option>
                                        <option>Chesapeake</option>
                                        <option>School-3</option>
                                        <option>School-4</option>
                                        <option>School-5</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Student</label>
                                    <input class="form-control typeahead" placeholder="">
                                </div>

                                <label>Start Date</label>
                                <div class="input-group date">

                                    <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                                <label>End Date</label>
                                <div class="input-group date">

                                    <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Modal  -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Trips
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Student Name</th>
                                    <th>Driver Name</th>
                                    <th>Pick Up Time</th>
                                    <th>Pick Up Loc</th>
                                    <th>Drop off Loc</th>
                                    <th>Rate</th>
                                    <th>Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>9:30 AM</td>
                                    <td>1049 2nd Street</td>
                                    <td>DCH</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>9:30 AM</td>
                                    <td>1049 2nd Street</td>
                                    <td>DCH</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>9:30 AM</td>
                                    <td>1049 2nd Street</td>
                                    <td>DCH</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>9:30 AM</td>
                                    <td>1049 2nd Street</td>
                                    <td>DCH</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>9:30 AM</td>
                                    <td>1049 2nd Street</td>
                                    <td>DCH</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
                <h3 class="page-header">Billing Information</h3>
                <div class="col-lg-4">

                    <div class="form-group">
                        <label>Total Trips</label>
                        <input class="form-control" placeholder="450">
                        <p class="help-block"></p>
                    </div>
                    <!-- <div class="form-group">
                        <label>Taxable Pay</label>
                        <input class="form-control" placeholder="34">
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group">
                        <label>Tips</label>
                        <input class="form-control" placeholder="67">
                    </div>
                    <div class="form-group">
                        <label>Total taxable</label>
                        <input class="form-control" placeholder="50">
                    </div>
                    <div class="form-group">
                        <label>Total Cash</label>
                        <input class="form-control" placeholder="00">
                    </div> -->
                    <div class="form-group">
                        <label>Total Payable</label>
                        <input class="form-control" placeholder="007">
                    </div>

                </div>
                <div class="col-lg-8">
                    <!-- <div class="form-group">
                    <a href="adddriver.html" class="btn btn-primary btn-lg" role="button">Print</a>
                    </div> -->
                </div>
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
