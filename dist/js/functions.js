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

//For Manifest
function gettime() {
	var now = new Date(Date.now());
	var formatted = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
	return formatted;
}
function getday() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 
	return (yyyy+'-'+mm+'-'+dd);
}
function gclock() {
	var gClock = '<span class="input-group-clock" style="color: #68ca1b;" data-updated="false"><i class="glyphicon glyphicon-time"></i></span>';
	return gClock;
}
function timeToSeconds(time) {
    time = time.split(/:/);
    return time[0] * 3600 + time[1] * 60 + time[2];
}
 function setColor(event,id,th) {
 	//$(th).closest('td').html('<span>'+gettime()+'</span>'+gclock());
    // var an=th.getAttribute("data-updated");
    // property= event.target;
    // property.style.color = "#68ca1b";
    // th.setAttribute("data-updated","true");

    log($(th).parent().siblings('input').data());
    var id = $(th).attr('id');
    insupd(id);
    //$(th).closest('td').html('<span>'+gettime()+'</span>'+gclock());

    }

  function trip_status(time1,time2) {
  	log(time1,time2);
  	if ( (timeToSeconds(time2)-timeToSeconds(time2)) > (2*3600) ){
  		return "noshow";
  	}
  	else return "success";
  }

function insupd(id){



	var sdata = {};
	
    sdata['orderid'] = $('#'+id).parent().siblings('input').data('orderid');
    sdata['clientid'] = $('#'+id).parent().siblings('input').data('clientid');
    sdata['schoolid'] = $('#'+id).parent().siblings('input').data('schoolid');
    sdata['driverid'] = $('#'+id).parent().siblings('input').data('driverid');
    sdata['s_id'] = $('#'+id).parent().siblings('input').data('sid');
    sdata['clockperiod'] = $('#'+id).parent().siblings('input').data('trip_period');
    sdata['city'] = $('#'+id).parent().siblings("[headers='city']").text();
    sdata['time'] = $('#'+id).parent().siblings("[headers='time']").text();
    sdata['pickloc'] = $('#'+id).parent().siblings("[headers='pickloc']").text();
    sdata['picktime'] = gettime();
   	sdata['droptime'] = gettime();
    sdata['pax']= $('#'+id).parent().siblings("[headers='pax']").text();

    
    sdata['current_date'] = getday();
    log($('#'+id).parent().siblings('input').data('updated'));

    if ($('#'+id).parent().siblings('input').data('updated') == false){
    sdata['mode'] = "insert_trip";
    sdata['status'] = "pending";
    log(sdata['mode']);
    $.ajax({
        url: 'ajax/manifest_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            log(data);
        	$('#'+id).parent().siblings('input').attr('data-trip_id',data);
        	$('#'+id).parent().siblings('input').attr('data-updated',"true");
        	location.reload();  
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
    }

    if ($('#'+id).parent().siblings('input').data('updated') == true){
    sdata['mode'] = "update_trip";
    sdata['trip_id'] = $('#'+id).parent().siblings('input').data('trip_id');
    sdata['status'] = trip_status(sdata['time'],$('#'+id).parent().siblings("[headers='picktime']").children('span:first').text());
    log(sdata['mode']+sdata['trip_id']);
    $.ajax({
        url: 'ajax/manifest_ajax.php',
        type: 'post',
        data: {myData:sdata},
        success: function(data) {
            log(data);
            location.reload();
          
        },
        error: function(xhr, desc, err) {
          console.log(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
    }

}

$('.noshow').click(function(element){
	log(element.target);
	ele = element.target;
	log($(ele).parent().attr('id'));
	var id = $(ele).parent().attr('id');
	var sdata = {};
	
    sdata['orderid'] = $('#'+id).parent().siblings('input').data('orderid');
    sdata['clientid'] = $('#'+id).parent().siblings('input').data('clientid');
    sdata['schoolid'] = $('#'+id).parent().siblings('input').data('schoolid');
    sdata['driverid'] = $('#'+id).parent().siblings('input').data('driverid');
    sdata['s_id'] = $('#'+id).parent().siblings('input').data('sid');
    sdata['clockperiod'] = $('#'+id).parent().siblings('input').data('trip_period');
    sdata['city'] = $('#'+id).parent().siblings("[headers='city']").text();
    sdata['time'] = $('#'+id).parent().siblings("[headers='time']").text();
    sdata['pickloc'] = $('#'+id).parent().siblings("[headers='pickloc']").text();
    sdata['picktime'] = gettime();
   	sdata['droptime'] = gettime();
    sdata['pax']= $('#'+id).parent().siblings("[headers='pax']").text();

    
    sdata['current_date'] = getday();

	if ($('#'+id).parent().siblings('input').data('updated') == false){
		sdata['mode'] = "insert_trip";
	    sdata['status'] = "noshow";
	    log(sdata['mode']);
	    $.ajax({
	        url: 'ajax/manifest_ajax.php',
	        type: 'post',
	        data: {myData:sdata},
	        success: function(data) {
	            log(data);
	        	$('#'+id).parent().siblings('input').attr('data-trip_id',data);
	        	$('#'+id).parent().siblings('input').attr('data-updated',"true");
	        	location.reload();  
	        },
	        error: function(xhr, desc, err) {
	          console.log(xhr);
	          console.log("Details: " + desc + "\nError:" + err);
	        }
	      }); // end ajax call
		}

	if ($('#'+id).parent().siblings('input').data('updated') == true){
	    sdata['mode'] = "update_trip";
	    sdata['trip_id'] = $('#'+id).parent().siblings('input').data('trip_id');
	    sdata['status'] = "noshow";
	    log(sdata['mode']+sdata['trip_id']);
	    $.ajax({
	        url: 'ajax/manifest_ajax.php',
	        type: 'post',
	        data: {myData:sdata},
	        success: function(data) {
	            log(data);
	            location.reload();
	          
	        },
	        error: function(xhr, desc, err) {
	          console.log(xhr);
	          console.log("Details: " + desc + "\nError:" + err);
	        }
	      }); // end ajax call
    }


});
$('.cancel').click(function(element){
	log(element.target);
	ele = element.target;
	log($(ele).parent().attr('id'));
	var id = $(ele).parent().attr('id');
	var sdata = {};
	
    sdata['orderid'] = $('#'+id).parent().siblings('input').data('orderid');
    sdata['clientid'] = $('#'+id).parent().siblings('input').data('clientid');
    sdata['schoolid'] = $('#'+id).parent().siblings('input').data('schoolid');
    sdata['driverid'] = $('#'+id).parent().siblings('input').data('driverid');
    sdata['s_id'] = $('#'+id).parent().siblings('input').data('sid');
    sdata['clockperiod'] = $('#'+id).parent().siblings('input').data('trip_period');
    sdata['city'] = $('#'+id).parent().siblings("[headers='city']").text();
    sdata['time'] = $('#'+id).parent().siblings("[headers='time']").text();
    sdata['pickloc'] = $('#'+id).parent().siblings("[headers='pickloc']").text();
    sdata['picktime'] = gettime();
   	sdata['droptime'] = gettime();
    sdata['pax']= $('#'+id).parent().siblings("[headers='pax']").text();

    
    sdata['current_date'] = getday();

	if ($('#'+id).parent().siblings('input').data('updated') == false){
		sdata['mode'] = "insert_trip";
	    sdata['status'] = "cancel";
	    log(sdata['mode']);
	    $.ajax({
	        url: 'ajax/manifest_ajax.php',
	        type: 'post',
	        data: {myData:sdata},
	        success: function(data) {
	            log(data);
	        	$('#'+id).parent().siblings('input').attr('data-trip_id',data);
	        	$('#'+id).parent().siblings('input').attr('data-updated',"true");
	        	location.reload();  
	        },
	        error: function(xhr, desc, err) {
	          console.log(xhr);
	          console.log("Details: " + desc + "\nError:" + err);
	        }
	      }); // end ajax call
		}

	if ($('#'+id).parent().siblings('input').data('updated') == true){
	    sdata['mode'] = "update_trip";
	    sdata['trip_id'] = $('#'+id).parent().siblings('input').data('trip_id');
	    sdata['status'] = "cancel";
	    log(sdata['mode']+sdata['trip_id']);
	    $.ajax({
	        url: 'ajax/manifest_ajax.php',
	        type: 'post',
	        data: {myData:sdata},
	        success: function(data) {
	            log(data);
	            location.reload();
	          
	        },
	        error: function(xhr, desc, err) {
	          console.log(xhr);
	          console.log("Details: " + desc + "\nError:" + err);
	        }
	      }); // end ajax call
    }

});

$("[name='bill-checkbox']").bootstrapSwitch();
$("[name='bill-checkbox']").on('switchChange.bootstrapSwitch', function (event, state) {
	log(event.target+"with"+state);
	ele = event.target;
	//log($(ele).parent().attr('id'));
	var id = $(ele).closest('td');
	
	var sdata = {};
	if (state == true){
    sdata['orderid'] = $(id).siblings('input').data('orderid');
    sdata['clientid'] = $(id).siblings('input').data('clientid');
    sdata['schoolid'] = $(id).siblings('input').data('schoolid');
    sdata['driverid'] = $(id).siblings('input').data('driverid');
    sdata['s_id'] = $(id).siblings('input').data('sid');
    sdata['clockperiod'] = $(id).siblings('input').data('trip_period');
    sdata['city'] = $(id).siblings("[headers='city']").text();
    sdata['time'] = $(id).parent().siblings("[headers='time']").text();
    //sdata['pickloc'] = $('#'+id).parent().siblings("[headers='pickloc']").text();
    log(sdata);
	}
	if (state == false){
		log($(id).parents('tr').find('td'));
		$(id).parents('tr').find('td').eq(6).replaceWith('<td class="col-xs-1"><div class="input-group clockpicker" data-placement="left" data-align="top" data-autoclose="true"> <input type="text" class="form-control" value="09:00:00"> <span class="input-group-addon"> <span class="glyphicon glyphicon-time"></span> </span> </div></td>');
		$(id).parents('tr').find('td').eq(6).replaceWith('<td class="col-xs-1"><div class="input-group clockpicker" data-placement="left" data-align="top" data-autoclose="true"> <input type="text" class="form-control" value="09:00:00"> <span class="input-group-addon"> <span class="glyphicon glyphicon-time"></span> </span> </div></td>');
	}
});
 function  getdata(id,th){
     var clock=document.getElementById(id).value;
     var form = document.createElement("form");
     var element1 = document.createElement("input");
     form.method = "POST";
     form.name="manifestform";
     form.action="manifest.php";

     element1.value=clock
     element1.name="clock";
     element1.setAttribute("type","hidden");
     form.appendChild(element1);
     document.body.appendChild(form);
     form.submit();

 }
            function changetext(id){
             var butntext= document.getElementById(id).innerHTML;
             if(butntext=="Pending") {
                 document.getElementById(id).innerHTML = "Cancelled";
                 document.getElementById(id).className="btn btn-danger";
             }
             else if(butntext=="Cancelled") {
                 document.getElementById(id).innerHTML = "Success";
                 document.getElementById(id).className="btn btn-success";
             }
             else {
                 document.getElementById(id).innerHTML = "Pending";
                 document.getElementById(id).className="btn btn-warning";
             }


            }

            $(document).ready(function () {

                $('#editbtn').click(function () {
                    var currentTD = $(this).parents('tr').find('td');
                    if ($(this).html() == 'Edit') {
                        currentTD = $(this).parents('tr').find('td');
                        $.each(currentTD, function () {
                            $(this).prop('contenteditable', true)
                        });
                    } else {
                        $.each(currentTD, function () {
                            $(this).prop('contenteditable', false)
                        });
                    }

                    $(this).html($(this).html() == 'Edit' ? 'Save' : 'Edit')

                });

            });



$(document).ready(function() {
            $('#newDriver').bootstrapValidator({
//        live: 'disabled',
                message: 'This value is not valid',

                fields: {
                    dssn: {
                        validators: {
                            regexp: {
                                regexp: /^[0-9]*$/,
                                message: 'Please Enter numbers'
                            },
                        }
                    },
                    dlnumber: {
                        validators: {
                            regexp: {
                                regexp: /^[0-9]*$/,
                                message: 'Please Enter numbers'
                            },
                        }
                    }
//                    commision: {
//                        validators: {
//                            regexp: {
//                                regexp: /[+-]?([0-9]*[.])?[0-9]+/,
//                                message: 'Please Enter numbers'
//                            },
//                        }
//                    }


                }
            });
        })


        function validateForm() {
            if(document.forms["newDriver"]["dlnumber"].value==null || document.forms["newDriver"]["dlnumber"].value==""){
                document.forms["newDriver"]["dlnumber"].value=0;
            }

            return true;
        }