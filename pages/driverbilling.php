<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
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
                <h1 class="page-header">Contractors Settlement Record</h1>
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
                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Driver</label>
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
                        Settlement Record
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Student Name</th>
                                    <th>Driver Name</th>
                                    <th>Total</th>
                                    <th>Corp</th>
                                    <th>Advance</th>
                                    <th>Fuel Card</th>
                                    <th>Tip</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>9:30 AM</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>34</td>
                                    <td>31</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>9:30 AM</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>34</td>
                                    <td>31</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>9:30 AM</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>34</td>
                                    <td>31</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>9:30 AM</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>34</td>
                                    <td>31</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>08/07/2016</td>
                                    <td>9:30 AM</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>34</td>
                                    <td>31</td>
                                    <td>0</td>
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
                <h3 class="page-header">Contractors Settlement Summary</h3>
                <div class="col-lg-4">

                    <div class="form-group">

                        <label>Total Billing</label>
                        <p>450$</p>
                    </div>
                    <div class="form-group">
                        <select>
                            <option>0%</option>
                            <option>5%</option>
                            <option>10%</option>
                            <option>15%</option>
                            <option>20%</option>
                            <option>25%</option>
                            <option>30%</option>
                            <option>35%</option>
                            <option>40%</option>

                        </select>
                        <label>Pay To Contractors</label>
                        <p>50$</p>
                    </div>
                    <div class="form-group">
                        <label>Tips</label>
                        <p>25$</p>
                    </div>
                    <div class="form-group">
                        <label>Additions</label>
                        <p>00$</p>
                    </div>
                    <div class="form-group">
                        <label>Contactors Total</label>
                        <p>550$</p>
                    </div>

                </div>
                <div class="col-lg-4">

                    <div class="form-group">

                        <label>Fuel Advance</label>
                        <p>450$</p>
                    </div>
                    <div class="form-group">
                        <label>Tolls</label>
                        <p>50$</p>
                    </div>
                    <div class="form-group">
                        <select>
                            <option>5%</option>
                            <option>10%</option>
                            <option>15%</option>
                            <option>20%</option>
                            <option>25%</option>
                            <option>30%</option>
                            <option>35%</option>
                            <option>40%</option>

                        </select>
                        <label>Lease</label>
                        <p>50$</p>
                        <div class="form-group">
                            <label>Advances</label>
                            <p>25$</p>
                        </div>
                        <div class="form-group">
                            <label>Other</label>
                            <p>00$</p>
                        </div>


                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label>Total Settlement Check</label>
                        <p>590$</p>
                    </div>
                </div>
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
