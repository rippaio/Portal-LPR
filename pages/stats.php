<?php
include("./includes/db_connection.php");
include("./includes/functions.php");
?>
<?php
include("./includes/htmlheader.php");
include("./includes/nav.php");
?>

<?php
$query_client  = "SELECT * FROM lpr_client";
$result_client = mysqli_query($connection, $query_client);
?>

<style type="text/css">
    ul.ui-autocomplete {
        z-index: 1100;
    }
    .ui-datepicker { position: relative; z-index: 10000 !important; }

</style>


<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Statistics</h1>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        Statistics
                    </div>
                    <div class="panel-body">
                    <!-- /.panel-heading -->
                    <form  class="form-horizontal">

                            <div class="form-group">
                                <label class="col-lg-1" style="text-align: center;padding-right: 40px" >Client :</label>
                                <select class="form-control col-lg-4" id="statsclient" name="statsclient" required style="width:300px">
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

                    </form>

                    <br>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label>Inzone:</label>
                            <span>NA</span>
                        </div>
                        <div class="form-group">
                            <label>Outzone Zone:</label>
                            <span>NA</span>
                        </div>
                        <div class="form-group">
                            <label>Special Education:</label>
                            <span>NA</span>
                        </div>

                        </div>




                    </div>     <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
                <!--Start Modal  -->

            <!--End Modal  -->
        </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->












<?php
require_once("./includes/footer.php");
?>
