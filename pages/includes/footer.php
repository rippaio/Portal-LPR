
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
    <script type="text/javascript">
        $('.clockpicker').clockpicker({
            placement: 'top',
            align: 'left',
            donetext: 'Done'
        });
        $(document).ready(function(){
            $('input[type="checkbox"]').click(function(){
                if($(this).attr("value")=="split"){
                    $(".split").toggle();
                }
                
            });
        });
        </script>

</body>

</html>
<!-- <?php
  // 5. Close database connection
  if (isset($connection)) {
	  mysqli_close($connection);
	}
?> -->