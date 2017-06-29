<?php
require_once('bdd.php');


$sql = "SELECT id, title, start, end, color FROM events";

$req = $bdd->prepare($sql);
$req->execute();

$events = $req->fetchAll();

?>
<!DOCTYPE html>

<html lang="en">

<head>


    <title>Calendar</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Full Calendar -->

    <link href="../css/fullcalendar.css"  rel="stylesheet"/>
    <link href="../vendor/fullcalendar/fullcalendar.print.css"  rel="stylesheet" media="print"/>
    <script type="text/javascript" src="../vendor/fullcalendar/lib/jquery.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar/lib/moment.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar/fullcalendar.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar/fullcalendar.min.js"></script>
    

    <link   href='../vendor/fullcalendar/fullcalendar.css' rel='stylesheet'/>
    <script type="text/javascript" src="../vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../vendor/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar/fullcalendar.min.js"></script>


    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
    <style>
    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    #calendar {
        max-width: 800px;
    }
    .col-centered{
        float: none;
        margin: 0 auto;
    }
    </style>


    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="../vendor/bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css">
    <link href="../vendor/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="blank.html">LPR</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="snapshot.html"><i class="fa fa-dashboard fa-fw"></i> Snapshot</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Orders<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="neworder.html">New Order</a>
                                </li>
                                <li>
                                    <a href="#">Change Order</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>Billing<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Schools</a>
                                </li>
                                <li>
                                    <a href="#">Drivers</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="manifest.html"><i class="fa fa-dashboard fa-fw"></i>Manifest</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>Data<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Schools</a>
                                </li>
                                <li>
                                    <a href="#">Rates</a>
                                </li>
                                <li>
                                    <a href="eventhandler.php">Calendar</a>
                                </li>
                                <li>
                                    <a href="#">Drivers</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->

        
        <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">
                <h1></h1>
                <p class="lead"></p>
                <div id="calendar" class="col-centered">
                </div>
            </div>
            
        </div>
        <!-- /.row -->
        
        <!-- Modal -->
        <div class="modal fade" id="ModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form class="form-horizontal" method="POST" action="addEvent.php">
            
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Add Event</h4>
              </div>
              <div class="modal-body">
                
                  <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Title</label>
                    <div class="col-sm-10">
                      <input type="text" name="title" class="form-control" id="title" placeholder="Title">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="color" class="col-sm-2 control-label">Client</label>
                    <div class="col-sm-10">
                      <select name="color" class="form-control" id="color">
                          <option value="">Choose</option>
                          <option style="color:#0071c5;" value="#0071c5">&#9724; Dark blue</option>
                          <option style="color:#40E0D0;" value="#40E0D0">&#9724; Turquoise</option>
                          <option style="color:#008000;" value="#008000">&#9724; Green</option>                       
                          <option style="color:#FFD700;" value="#FFD700">&#9724; Yellow</option>
                          <option style="color:#FF8C00;" value="#FF8C00">&#9724; Orange</option>
                          <option style="color:#FF0000;" value="#FF0000">&#9724; Red</option>
                          <option style="color:#000;" value="#000">&#9724; Black</option>
                          
                        </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="start" class="col-sm-2 control-label">Start date</label>
                    <div class="col-sm-10">
                      <input type="text" name="start" class="form-control" id="start" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="end" class="col-sm-2 control-label">End date</label>
                    <div class="col-sm-10">
                      <input type="text" name="end" class="form-control" id="end" readonly>
                    </div>
                  </div>
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
              </div>
            </form>
            </div>
          </div>
        </div>
        
        
        
        <!-- Modal -->
        <div class="modal fade" id="ModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form class="form-horizontal" method="POST" action="editEventTitle.php">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Event</h4>
              </div>
              <div class="modal-body">
                
                  <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Title</label>
                    <div class="col-sm-10">
                      <input type="text" name="title" class="form-control" id="title" placeholder="Title">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="color" class="col-sm-2 control-label">Color</label>
                    <div class="col-sm-10">
                      <select name="color" class="form-control" id="color">
                          <option value="">Choose</option>
                          <option style="color:#0071c5;" value="#0071c5">&#9724; Dark blue</option>
                          <option style="color:#40E0D0;" value="#40E0D0">&#9724; Turquoise</option>
                          <option style="color:#008000;" value="#008000">&#9724; Green</option>                       
                          <option style="color:#FFD700;" value="#FFD700">&#9724; Yellow</option>
                          <option style="color:#FF8C00;" value="#FF8C00">&#9724; Orange</option>
                          <option style="color:#FF0000;" value="#FF0000">&#9724; Red</option>
                          <option style="color:#000;" value="#000">&#9724; Black</option>
                          
                        </select>
                    </div>
                  </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                          <div class="checkbox">
                            <label class="text-danger"><input type="checkbox"  name="delete"> Delete event</label>
                          </div>
                        </div>
                    </div>
                  
                  <input type="hidden" name="id" class="form-control" id="id">
                
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
              </div>
            </form>
            </div>
          </div>
        </div>

    </div>
</div>

                            
                   
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->

    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <script src="../vendor/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="../vendor/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.js"></script>

    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    
    
    <!-- FullCalendar -->
    <script src='../js/moment.min.js'></script>
    <script src='../js/fullcalendar.min.js'></script>



    <script type="text/javascript">
    $(document).ready(function() {
        
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay'
            },
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            selectHelper: true,
            select: function(start, end) {
                
                $('#ModalAdd #start').val(moment(start).format('YYYY-MM-DD HH:mm:ss'));
                $('#ModalAdd #end').val(moment(end).format('YYYY-MM-DD HH:mm:ss'));
                $('#ModalAdd').modal('show');
            },
            eventRender: function(event, element) {
                element.bind('dblclick', function() {
                    $('#ModalEdit #id').val(event.id);
                    $('#ModalEdit #title').val(event.title);
                    $('#ModalEdit #color').val(event.color);
                    $('#ModalEdit').modal('show');
                });
            },
            eventDrop: function(event, delta, revertFunc) { // si changement de position

                edit(event);

            },
            eventResize: function(event,dayDelta,minuteDelta,revertFunc) { // si changement de longueur

                edit(event);

            },
            events: [
            <?php 

            foreach($events as $event): 
            
                $start = explode(" ", $event['start']);
                $end = explode(" ", $event['end']);
                if($start[1] == '00:00:00'){
                    $start = $start[0];
                }else{
                    $start = $event['start'];
                }
                if($end[1] == '00:00:00'){
                    $end = $end[0];
                }else{
                    $end = $event['end'];
                }
            ?>
                {
                    id: '<?php echo $event['id']; ?>',
                    title: '<?php echo $event['title']; ?>',
                    start: '<?php echo $start; ?>',
                    end: '<?php echo $end; ?>',
                    color: '<?php echo $event['color']; ?>',
                },
            <?php endforeach; ?>
            ]
        });
        
        function edit(event){
            start = event.start.format('YYYY-MM-DD HH:mm:ss');
            if(event.end){
                end = event.end.format('YYYY-MM-DD HH:mm:ss');
            }else{
                end = start;
            }
            
            id =  event.id;
            
            Event = [];
            Event[0] = id;
            Event[1] = start;
            Event[2] = end;
            
            $.ajax({
             url: 'editEventDate.php',
             type: "POST",
             data: {Event:Event},
             success: function(rep) {
                    if(rep == 'OK'){
                        alert('Saved');
                    }else{
                        alert('Could not be saved. try again.'); 
                    }
                }
            });
        }
        
    });

</script>
</body>

</html>
