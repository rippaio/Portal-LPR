
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
    <script src="../dist/js/functions.js"></script>


    <script type="text/javascript">
        $('.clockpicker').clockpicker({
            placement: 'top',
            align: 'left',
            donetext: 'Done'
        });
        
        $('input[type="checkbox"]').click(function(){
            if($(this).attr("value")=="split"){
                $(".split").toggle();
            }
            
        });

    $('input[type="checkbox"]').click(function(){
            if($(this).attr("value")=="splitbill"){
                $(".splitbill").toggle();
            }
            
        });

        $('input[type="radio"]').click(function(){
            if($('input[name="billingradio"]:checked').val()=="outzone"){
                $(".splitcheckbox").show();
            }
            if($('input[name="billingradio"]:checked').val()=="inzone"){
                $(".splitcheckbox").hide();
            }
            
        });

        $('.input-group.date').datepicker({

        });

        $("#addstudent").click(function () {
          $("#studentdetails").append('<span class="xbox" style="padding:0 0 0 0"><label>Additional Student</label><div class="form-group"> <label>First Name</label> <input class="form-control" placeholder="First Name"> <p class="help-block"></p> </div> <div class="form-group"> <label>Last Name</label> <input class="form-control" placeholder="Last Name"> <p class="help-block"></p> </div> <div class="form-group"> <label>Grade</label> <input class="form-control" placeholder="Enter Grade"> </div> <div class="form-group"> <label>Gender</label> <input class="form-control" placeholder="Enter Grade"> </div> <div class="form-group"><button type="button" id ="removestudent" class="btn btn-danger">Delete Student</button></div></span>'); });

        // function removestudent() {
        //     alert("remove");
        //     $(this).siblings('.p').remove(); 
        // }
        $('body').on('click', '#removestudent', function () {
            console.log($(this).parents('.xbox'));
            $(this).parents('.xbox').remove();
        });

        var aTags = ["Deidra Burchard ", "Paz Nealey ", "Katia Sartain ", "Mammie Baughman ", "Norbert Gularte ", "Romeo Saur ", "Bula Snelson ", "Reita Norden ", "Pete Beverly ", "Erik Esquilin ", "Oswaldo Porcaro ", "Josephina Kautz ", "Merlene Rhone ", "Mark Luckey ", "Rikki Weber ", "Gwyneth Tinajero ", "Lavonia Ryman ", "Emily Cornwall ", "Rolland Ledesma ", "Tawanda Mcnitt ", "Daniela Walford ", "Jennette Theberge ", "Jackson Holleman ", "Ezekiel Bouldin ", "Krishna Beedle ", "Bert Sandridge ", "Ines Abeyta ", "Rivka Seabolt ", "Cortney Gassett ", "Georgina Walts"];
        $( ".typeahead" ).autocomplete({
            source: aTags
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