function log(val){
	console.log(val);
}

$('#stypeSelect').change(function(){
	//log("inside click");
	var sdata = {};
	sdata['client_name'] = $('#ctypeSelect').val();
	sdata['school_type'] = $('#stypeSelect').val().toLowerCase();
	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            var schoolObj = $.parseJSON(data);
            append_schools(schoolObj);
            //log(schoolObj);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call

});

function append_schools(myObj) {
	$("#sSelect").children().remove();
	for (var i = 0; i < myObj.length; i++) {
		$("#sSelect").append('<option value='+myObj[i].school_id+'>'+myObj[i].school_name+'</option>');
	}
	
}


$('#sSelect').change(function(){
	log("inside click");
	var sdata = {};
	sdata['school_name'] = $('#ctypeSelect').val();
	sdata['school_type'] = $('#stypeSelect').val().toLowerCase();
	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            var schoolObj = $.parseJSON(data);
            append_schools(schoolObj);
            //log(schoolObj);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call

});