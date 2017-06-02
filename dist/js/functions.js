function log(val){
	console.log(val);
}
$('#ctypeSelect').change(function(){
	var client = $('#ctypeSelect').val();
	$('input[name="optradio"]').filter(function (index){
	return $( this ).attr( "value" ) === client;
	}).attr('checked',true);
});

$('#stypeSelect').change(function(){
	//log("inside click");
	var sdata = {};
	sdata['mode'] = "typedropdown";
	sdata['client_id'] = $('#ctypeSelect').val();
	sdata['school_type'] = $('#stypeSelect').val().toLowerCase();
	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            var schoolObj = $.parseJSON(data);
            append_schools(schoolObj);
            log(schoolObj);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
	
});

function append_schools(myObj) {
	$("#sSelect").children().remove();
	$("#sSelect").append('<option value="">'+"Select"+'</option>');
	for (var i = 0; i < myObj.length; i++) {
		$("#sSelect").append('<option value='+myObj[i].school_id+'>'+myObj[i].school_name+'</option>');
	}
	
}


$('#sSelect').change(function(){
	//log("inside click");
	var sdata = {};
	sdata['mode'] = "schooldropdown";
	sdata['school_id'] = $('#sSelect').val();
	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            var schoolObj = $.parseJSON(data);
            fillLocation(schoolObj);
            log(schoolObj);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call

});

function fillLocation(data){
	$('#amDropLoc').val(data.school_street+","+data.school_address+","+data.school_city);
	$('#pmDropLoc').val(data.school_street+","+data.school_address+","+data.school_city);
}
$('.aocheckbox').click(function(){
	verifytrip();
});
$('#billtext').on('focus', function(){
	verifytrip();
});
$('input[name="optradio"]').click(function(){
	verifytrip();
});

function verifytrip() {
	var bill_zone_id = $('input[name="optradio"]').filter(":checked").data('zone_id');
	var dest_zone_id = $('#ctypeSelect').children("option").filter(":selected").data('zone_id');
	log(bill_zone_id,dest_zone_id);
	if (bill_zone_id==dest_zone_id) {
		tripcost();
	}
	if (bill_zone_id!=dest_zone_id) {
		tripcostOutzone();
	}
}	
function tripcost() {
	var sdata = {};
	sdata['mode'] = "tripcost";
	sdata['addons'] = $('.aocheckbox:checked').map(function() {
				    return this.value;
				}).get().join("','");
	sdata['addons'] = sdata['addons'] + "','standard";
	sdata['zone_id'] = $('input[name="optradio"]').filter(":checked").data('zone_id');
	sdata['type'] = $('input[name="billingradio"]:checked').val();

	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            $('#billtext').val(data);
            log(data);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
}
function tripcostOutzone() {
	var sdata = {};
	sdata['mode'] = "tripcost_outzone";
	sdata['addons'] = $('.aocheckbox:checked').map(function() {
				    return this.value;
				}).get().join("','");
	sdata['addons'] = sdata['addons'] + "','standard";
	sdata['zone_id'] = $('input[name="optradio"]').filter(":checked").data('zone_id');
	sdata['zone_id2'] = $('#ctypeSelect').children("option").filter(":selected").data('zone_id');
	sdata['type'] = $('input[name="billingradio"]:checked').val();

	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            $('#billtext').val(data);
            log(data);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
}
$( "#createorder" ).submit(function( event ) {
	var formData = $("#createorder").serializeObject();
	formData['o_days'] = $('input[name="dayscheckbox"]:checked').map(function() {
				    return this.value;
				}).get().join(",");
	formData['mode'] = "insert";
	formData['o_ampicktime'] = formData['o_ampicktime'] + ':00';
	formData['o_amdroptime'] = formData['o_amdroptime'] + ':00';
	formData['o_pmpicktime'] = formData['o_pmpicktime'] + ':00';
	event.preventDefault();
	log(formData);

	 if ((!matchsum(formData['billsplit'],formData['billsplitvalue'],formData["o_billable"],"billtext") )|| (!matchtotal(formData["o_billable"],formData["o_payable"],"o_payable") )){
	 	return false;
	 }
	 else {

	 
	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:formData},
        success: function(data) {
            //$('#billtext').val(data);
            log(data);
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
	}
});

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

$('.typeahead').click(function(){
	getdrivers();
});

function getdrivers() {

	var sdata = {};
	sdata['mode'] = "getdriver";
	$.ajax({
        url: 'ajax/neworder_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            var driverObj = $.parseJSON(data);
            log(data);

            $(".typeahead").autocomplete({
				source: driverObj,
				focus: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox
					$(this).val(ui.item.label);
				},
				select: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox and hidden field
					$(this).val(ui.item.label);
					$('input[name="driver_id"]').val(ui.item.value);
					log(ui.item.value);
				}
			});
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
}

$('input[name="o_ampickloc"]').on('focus', function(){
	if (this.value == ""||this.value == undefined) {
		this.value = $('input[name="street"]').val() +","+ $('input[name="address"]').val() +","+ $('input[name="city"]').val() +","+ $('input[name="zipcode"]').val();
	}
});

// Validations

function matchsum(billsplit,billsplitvalue,bill,id) {
	var amount=0;
	for (i=0; i < billsplitvalue.length; i++) {
		if (parseInt(billsplitvalue[i]) > 0) { 
			amount = amount + parseInt(billsplitvalue[i]);
		}
	}
    
	if(amount == parseInt(bill)){
		$( '#'+id ).parent().siblings('.help-block').html("");
	return true;
	}
	else {
		$( '#'+id ).parent().siblings('.help-block').html("Distribution not equal to billed amount");
	return false;
	}
}

function matchtotal(bill,payable,id) {

	if(parseInt(payable) > parseInt(bill)){
		$( 'input[name='+id+']').parent().siblings('.help-block').html("More than billed amount");
		return false;
	}
	else{
		$( 'input[name='+id+']').parent().siblings('.help-block').html("");
		return true;
	}

}