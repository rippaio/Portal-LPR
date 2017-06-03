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

            function manifestdata(num,id,thisattribute) {
//                alert(num);
//                alert(document.getElementById(id).value);
//                alert(document.getElementById("manifest").rows[num].cells.item(1).innerHTML);

                var status=document.getElementById(id).value;
                if(status=="Success" || status=="Cancel"){
                    var form = document.createElement("form");
                    var element1 = document.createElement("input");
                    var element2 = document.createElement("input");
                    var element3 = document.createElement("input");
                    var element4 = document.createElement("input");
                    var element5 = document.createElement("input");
                    var element9 = document.createElement("input");
                    var element6 = document.createElement("input");
                    var element7 = document.createElement("input");
                    var element8 = document.createElement("input");
                    var element10 = document.createElement("input");
                    var element11 = document.createElement("input");
                    var element12 = document.createElement("input");
                    var element13 = document.createElement("input");
                    var element14 = document.createElement("input");


                    form.method = "POST";
                    form.name="manifestform";

                    element1.value=document.getElementById("manifest").rows[num].cells.item(0).innerHTML;
                    element1.name="city";
                    element1.setAttribute("type","hidden");
                    form.appendChild(element1);

                    element2.value=document.getElementById("manifest").rows[num].cells.item(1).innerHTML;
                    element2.name="time";
                    element2.setAttribute("type","hidden");
                    form.appendChild(element2);

                    element3.value=document.getElementById("manifest").rows[num].cells.item(2).innerHTML;
                    element3.name="s_fname";
                    element3.setAttribute("type","hidden");
                    form.appendChild(element3);

                    element4.value=document.getElementById("manifest").rows[num].cells.item(3).innerHTML;
                    element4.name="driver_fname";
                    element4.setAttribute("type","hidden");
                    form.appendChild(element4);

                    element5.value=document.getElementById("manifest").rows[num].cells.item(4).innerHTML;
                    element5.name="pickloc";
                    element5.setAttribute("type","hidden");
                    form.appendChild(element5);

                    element6.value=thisattribute.getAttribute("data-picktime");
                    element6.name="picktime";
                    element6.setAttribute("type","hidden");
                    form.appendChild(element6);

                    element7.value=thisattribute.getAttribute("data-droptime");
                    element7.name="droptime";
                //    alert(element7.value);
                    element7.setAttribute("type","hidden");
                    form.appendChild(element7);

                    element8.value=document.getElementById("manifest").rows[num].cells.item(7).innerHTML;
                    element8.name="pax";
                    element8.setAttribute("type","hidden");
                    form.appendChild(element8);

                    element9.value=status;
                    element9.name="status";
                    element9.setAttribute("type","hidden");
                    form.appendChild(element9);

                    element10.value=thisattribute.getAttribute("data-orderid");
                    element10.name="orderid";
                    element10.setAttribute("type","hidden");
                    form.appendChild(element10);

                    element11.value=thisattribute.getAttribute("data-schoolid");
                    element11.name="schoolid";
                    element11.setAttribute("type","hidden");
                    form.appendChild(element11);

                    element12.value=thisattribute.getAttribute("data-driverid");
                    element12.name="driverid";
                    element12.setAttribute("type","hidden");
                    form.appendChild(element12);

                    element13.value=thisattribute.getAttribute("data-clientid");
                    element13.name="client_id";
                    element13.setAttribute("type","hidden");
                    form.appendChild(element13);

                    element14.value=thisattribute.getAttribute("data-sid");
                    element14.name="s_id";
                    element14.setAttribute("type","hidden");
                    form.appendChild(element14);

                    document.body.appendChild(form);

                    form.submit();

                }




            }

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