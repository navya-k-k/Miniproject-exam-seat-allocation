<?php
include '../connection.php';
session_start();
if(isset($_SESSION['stf']))
{
    $uid=$_SESSION['stf'];
    $sel_data=mysqli_query($dbcon,"select * from staf_data where stfif='$uid'");
    $rdata=mysqli_fetch_row($sel_data);    
}
 else {
header("location:../index.php");    
}
if(isset($_POST['eaid']))
{
    $eaid=$_POST['eaid'];
    $up=$_FILES['up']['tmp_name'];    
    date_default_timezone_set('UTC');
    require('XLSXReader.php');
    $xlsx = new XLSXReader($up);
    $sheetNames = $xlsx->getSheetNames();
    //print_r($sheetNames);
    $sheet = $xlsx->getSheet(1);
    $data=$sheet->getData();
    foreach($data as $row) {
        $ins=mysqli_query($dbcon,"INSERT INTO `exam_stud`(`eassign_id`, `studid`, `xamtyp`) VALUES ('$eaid','".escape($row[0])."','".escape($row[1])."')");
        }
        if($ins>0)
        {
            header("location:assignstud.php?eid=".$_GET['eid']);
        }
}
function array2Table($data) {
	
	foreach($data as $row) {
            echo escape($row[0]."<br >");
		//$ins=mysqli_query($dbcon,"INSERT INTO `po_details`(`po_dataid`, `srv_num`, `hsn_code`, `descr`, `descr_detail`, `unit`, `rate`, `tmp1`, `tmp2`, `tmp3`, `tmp4`, `st`) VALUES ('".url_decript($_GET['poid'])."','".escape($row[0])."','".escape($row[1])."','".escape($row[2])."','".escape($row[3])."','".escape($row[4])."','".escape($row[5])."','0','0','0','0','1')");
}
}
function debug($data) {
	echo '<pre>';
	print_r($data);
	echo '</pre>';
}

function escape($string) {
	return htmlspecialchars($string, ENT_QUOTES);
}
if(isset($_GET['delid']))
{
    $del=mysqli_query($dbcon,"delete from exam_stud where eassign_id='".$_GET['delid']."'");
    if($del>0)
    {
        header("location:assignstud.php?eid=".$_GET['eid']);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><?php echo $title ?></title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../admin_tmplate/assets/css/font-awesome.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../admin_tmplate/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../admin_tmplate/assets/css/ace-ie.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="../admin_tmplate/assets/js/ace-extra.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="../admin_tmplate/assets/js/html5shiv.js"></script>
		<script src="../admin_tmplate/assets/js/respond.js"></script>
		<![endif]-->
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-university"></i>
							<?php echo $hd ?>
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									4 Active Notifications
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#">
												Notification 1

												
											</a>
										</li>

										

										

										
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See All Notifications
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									8 New Complaints
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											From user
										</li>

										

										

										
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="complaints.php">
										See all Complaints
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                                            <img class="nav-user-photo" src="../admin/staff_pic/<?php echo $rdata[10] ?>" alt="Administrator" />
								<span class="user-info">
									<small>Welcome,</small>
									<?php echo $rdata[1] ?>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="settings.php">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>
								<li class="divider"></li>

								<li>
                                                                    <a href="../logout.php">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="">
						<a href="index.php">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>

						<b class="arrow"></b>
					</li>				
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-graduation-cap"></i>
							<span class="menu-text">
								Manage
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
                                                        <li class="">
								<a href="syllabus.php">
									<i class="menu-icon fa fa-caret-right"></i>
									Syllabus
								</a>

								<b class="arrow"></b>
							</li>
                                                   
							<li class="">
								<a href="student.php">
									<i class="menu-icon fa fa-caret-right"></i>
									Add Students
								</a>

								<b class="arrow"></b>
							</li>
                                                        <li class="">
								<a href="room.php">
									<i class="menu-icon fa fa-caret-right"></i>
									Manage Room
								</a>

								<b class="arrow"></b>
							</li>
                                                        <li class="">
								<a href="staff.php">
									<i class="menu-icon fa fa-caret-right"></i>
									Manage Staff
								</a>

								<b class="arrow"></b>
							</li>
                                                </ul>
					</li> 
                                        <li class="">
						<a href="upsem.php">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text">Update Semester</span>
						</a>

						<b class="arrow"></b>
                                        </li>     
                                        <li class="">
						<a href="exam.php">
							<i class="menu-icon fa fa-file"></i>
							<span class="menu-text">ADD Examination </span>
						</a>

						<b class="arrow"></b>
                                        </li>     
                                        <li class="active">
						<a href="assignstud.php">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text">Assign Students </span>
						</a>

						<b class="arrow"></b>
                                        </li>     
                                        <li class="">
						<a href="salocation.php">
							<i class="menu-icon fa fa-empire"></i>
							<span class="menu-text">Seat Allocation </span>
						</a>

						<b class="arrow"></b>
                                        </li>                                                                    
					
                                        <li class="">
                                            <a href="../logout.php">
							<i class="menu-icon fa fa-sign-out"></i>
							<span class="menu-text">Logout </span>
						</a>

						<b class="arrow"></b>
					</li>
                                    </ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<!-- /.breadcrumb -->
                                                <div style="padding: 5px; margin-left: 15px;"><b>AVAILABLE EXAMINATION</b></div>
						
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<!-- /.ace-settings-container -->

						<!-- /section:settings.box -->
						

						<div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="col-lg-2"></div>
                                                        <div class="col-lg-8">
                                                           <?php
                                                        $sel1=mysqli_query($dbcon,"select * from exam_data where st='1' order by id desc");
                                                        if(mysqli_num_rows($sel1)>0)
                                                        {
                                                            ?>
                                                        <table class="table table-bordered table-condensed table-hover table-striped">
                                                            <tr>
                                                                <td>#</td>
                                                                <td>Exam Title</td>
                                                                <td></td>
                                                            </tr>
                                                            <?php
                                                            $i=0;
                                                            while($re=mysqli_fetch_row($sel1))
                                                            {
                                                                $i++;
                                                                ?>
                                                            <tr>
                                                                <td><?php echo $i ?></td>
                                                                <td><?php echo $re[1] ?></td>
                                                                <td><a href="assignstud.php?eid=<?php echo $re[0] ?>"><span class="fa fa-arrow-circle-right" style="color: green" title="ASSIGN EXAMINATION"></span></a></td>
                                                            </tr>
                                                            <?php                                                                
                                                            }
                                                            ?>
                                                        </table>
                                                        <?php
                                                        }
                                                        ?>
                                                           
                                                        </div>
                                                        <div class="col-lg-4"></div>
                                                    </div><!-- /.col -->
						</div><!-- /.row -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <?php
                                                        if(isset($_GET['eid']))
                                                        {
                                                            $eid=$_GET['eid'];
                                                            $selc=mysqli_query($dbcon,"select distinct(crsid) from exam_assign where eid='$eid'");
                                                            if(mysqli_num_rows($selc)>0)
                                                            {
                                                                ?>
                                                        <table class="table table-bordered table-condensed table-hover table-striped">
                                                            <?php
                                                            $count=0;
                                                            while($rc=mysqli_fetch_row($selc))
                                                            {
                                                                $count++;
                                                                ?>
                                                            <tr>
                                                                <td colspan="5"><b><?php 
                                                                $selcn=mysqli_query($dbcon,"select * from crs_info where crsid='$rc[0]'");
                                                                $rcn=mysqli_fetch_row($selcn);
                                                                echo $rcn[1]; 
                                                                ?></b></td>
                                                            </tr>
                                                            <?php
                                                            $seld=mysqli_query($dbcon,"select distinct(depid) from exam_assign where eid='$eid' and crsid='$rc[0]'");
                                                            while($rd=mysqli_fetch_row($seld))
                                                            {
                                                                $count++;
                                                                ?>
                                                            <tr>
                                                                <td colspan="5"><?php 
                                                                $seldn=mysqli_query($dbcon,"select * from dep_info where depid='$rd[0]'");
                                                                $rdn=mysqli_fetch_row($seldn);
                                                                echo $rdn[2] ?></td>
                                                            </tr>
                                                            <?php
                                                            $selsem=mysqli_query($dbcon,"select distinct(sem) from exam_assign where eid='$eid' and crsid='$rc[0]' and depid='$rd[0]'");
                                                            while($rsem=mysqli_fetch_row($selsem))
                                                            {
                                                                $count++;
                                                                ?>
                                                            <tr>
                                                                <td colspan="5"><center>Semester <?php echo $rsem[0] ?></center></td>
                                                            </tr>
                                                            <?php
                                                            $selxam=mysqli_query($dbcon,"select * from exam_assign where eid='$eid' and crsid='$rc[0]' and depid='$rd[0]' and sem='$rsem[0]' order by dt asc");
                                                            $z=0;
                                                            while($rxam=mysqli_fetch_row($selxam))
                                                            {
                                                                $count++;
                                                                $z++;
                                                                ?>
                                                            <tr>
                                                                <td><?php echo $z ?></td>
                                                                <td><?php 
                                                                $sel_sn=mysqli_query($dbcon,"select * from syllabus_data where sub_id='$rxam[6]'");
                                                                $rsn=mysqli_fetch_row($sel_sn);
                                                                echo "$rsn[4] ($rxam[6])"; ?></td>
                                                                <td>
                                                                    <div id="d<?php echo $z ?>"><?php echo date('d-M-Y',strtotime($rxam[7])) ?></div>
                                                                </td>
                                                                <td>
                                                                    <div id="t<?php echo $z ?>"><?php echo $rxam[8] ?></div>
                                                                </td>
                                                                <td>
                                                                    <?php
                                                                    $chk=mysqli_query($dbcon,"select * from exam_stud where eassign_id='$rxam[0]'");
                                                                    if(mysqli_num_rows($chk)>0)
                                                                    {
                                                                        ?>
                                                                    <span class="fa fa-file" data-toggle="modal" data-target="#myModal<?php echo $count ?>"></span>
                                                                    <div id="myModal<?php echo $count ?>" class="modal fade" role="dialog">
                                                                    <div class="modal-dialog">

                                                                      <!-- Modal content-->
                                                                      <div class="modal-content">
                                                                        <div class="modal-header">
                                                                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                          <h4 class="modal-title">Modal Header</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <table class="table table-bordered table-condensed table-responsive">
                                                                                <tr>
                                                                                    <td colspan="5"><center><b>STUDENT LIST</b></center></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>#</td>
                                                                                    <td>Roll Number</td>
                                                                                    <td>Name</td>
                                                                                    <td>Exam Type</td>
                                                                                </tr>
                                                                                <?php
                                                                                $i=0;
                                                                          while($rchk=mysqli_fetch_row($chk))
                                                                          {
                                                                              $i++;
                                                                          ?>
                                                                                <tr>
                                                                                    <td><?php echo $i ?></td>
                                                                                    <td><?php echo $rchk[2] ?></td>
                                                                                    <td>
                                                                                        <?php
                                                                                        $selstud=mysqli_query($dbcon,"select * from student_data where admnum='$rchk[2]'");
                                                                                        if(mysqli_num_rows($selstud)>0)
                                                                                        {
                                                                                            $rstud=mysqli_fetch_row($selstud);
                                                                                            echo $rstud[6];
                                                                                        }
                                                                                        else{
                                                                                            echo"<font color='red'>No Data Available</font>";
                                                                                        }
                                                                                        ?>
                                                                                    </td>
                                                                                    <td>
                                                                                        <?php 
                                                                                        if($rchk[3]=="1")
                                                                                        {
                                                                                            echo"Regular";
                                                                                        }
                                                                                        else{
                                                                                            echo"Supplimentory";
                                                                                        }
                                                                                        ?>
                                                                                    </td>
                                                                                </tr>
                                                                                <?php
                                                                          }
                                                                          ?>
                                                                            </table>
                                                                          
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                        </div>
                                                                      </div>

                                                                    </div>
                                                                  </div>
                                                                    <a href="assignstud.php?eid=<?php echo $_GET['eid'] ?>&delid=<?php echo $rxam[0] ?>"><span class="fa fa-trash pull-right" style="color: red;" title="Clear List"></span></a>
                                                                    <?php
                                                                    }
                                                                    else
                                                                    {
                                                                    ?>
                                                                    <form method="post" id="a<?php echo $count ?>" enctype="multipart/form-data">
                                                                        <input type="hidden" name="eaid" value="<?php echo $rxam[0] ?>" />
                                                                        <span class="fa fa-upload" title="Upload Excel" onclick="openfile('<?php echo $count ?>')"></span>
                                                                        <input type="file" name="up" onchange="subfrm('<?php echo $count ?>')" style="display: none;" id="f<?php echo $count ?>" />
                                                                    </form>
                                                                    <?php
                                                                    }
                                                                    ?>
                                                                </td>
                                                            </tr>
                                                            <?php
                                                            }
                                                            }
                                                            }
                                                            }
                                                            ?>
                                                        </table>
                                                        <script>
                                                        function subfrm(x)
                                                        {
                                                            $("#a"+x).submit();
                                                        }
                                                        function openfile(x)
                                                        {
                                                            $("#f"+x).click();
                                                        }
                                                        </script>
                                                        <?php
                                                            }
                                                               else{
                                                                   echo"Exam Not Assigned to any Course ";
                                                               }     
                                                        }
                                                        ?>
                                                        <script>
                                                        function shoedit(i)
                                                        {
                                                            $("#d"+i).hide();
                                                            $("#dd"+i).show();
                                                            $("#t"+i).hide();
                                                            $("#tt"+i).show();
                                                        }
                                                        function chngdt(r,i,id)
                                                        {
                                                            var xmlhttp = new XMLHttpRequest();
                                                            xmlhttp.onreadystatechange = function() {
                                                                if (this.responseText == "1") {
                                                                    $("#dd"+i).hide();
                                                                    $("#d"+i).show();
                                                                    document.getElementById("d"+i).innerHTML=r;
                                                                }
                                                            };
                                                            xmlhttp.open("GET", "chngdt.php?r=" + r+"&id="+id, true);
                                                            xmlhttp.send();
                                                            
                                                        }
                                                        function chngtim(r,i,id)
                                                        {
                                                            var xmlhttp = new XMLHttpRequest();
                                                            xmlhttp.onreadystatechange = function() {
                                                                if (this.responseText == "1") {
                                                                    $("#tt"+i).hide();
                                                                    $("#t"+i).show();
                                                                    document.getElementById("t"+i).innerHTML=r;
                                                                }
                                                            };
                                                            xmlhttp.open("GET", "chngtim.php?r=" + r+"&id="+id, true);
                                                            xmlhttp.send();
                                                        }
                                                        </script>
                                                    </div>
                                                </div>
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<?php echo $footr ?>
						</span>

						
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../admin_tmplate/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../admin_tmplate/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="../admin_tmplate/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="../admin_tmplate/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="../admin_tmplate/assets/js/jquery-ui.custom.js"></script>
		<script src="../admin_tmplate/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="../admin_tmplate/assets/js/jquery.easypiechart.js"></script>
		<script src="../admin_tmplate/assets/js/jquery.sparkline.js"></script>
		<script src="../admin_tmplate/assets/js/flot/jquery.flot.js"></script>
		<script src="../admin_tmplate/assets/js/flot/jquery.flot.pie.js"></script>
		<script src="../admin_tmplate/assets/js/flot/jquery.flot.resize.js"></script>

		<!-- ace scripts -->
		<script src="../admin_tmplate/assets/js/ace/elements.scroller.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.colorpicker.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.fileinput.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.typeahead.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.spinner.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.treeview.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.wizard.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.aside.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.ajax-content.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.touch-drag.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.sidebar.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.widget-box.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.settings.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.settings-skin.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
			
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html',
									 {
										tagValuesAttribute:'data-values',
										type: 'bar',
										barColor: barColor ,
										chartRangeMin:$(this).data('min') || 0
									 });
				});
			
			
			  //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
			  //but sometimes it brings up errors with normal resize event handlers
			  $.resize.throttleWindow = false;
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "social networks",  data: 38.7, color: "#68BC31"},
				{ label: "search engines",  data: 24.5, color: "#2091CF"},
				{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
				{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
				{ label: "other",  data: 10, color: "#FEE074"}
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);
			
			 /**
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);
			
			
			  //pie chart tooltip example
			  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
				
			 });
			
				/////////////////////////////////////
				$(document).one('ajaxloadstart.page', function(e) {
					$tooltip.remove();
				});
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').ace_scroll({
					size: 300
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {
						//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
			
			
				//show the dropdowns on top or bottom depending on window height and menu position
				$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
					var offset = $(this).offset();
			
					var $w = $(window)
					if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
						$(this).addClass('dropup');
					else $(this).removeClass('dropup');
				});
			
			})
		</script>

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="../admin_tmplate/docs/assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="../admin_tmplate/assets/js/ace/elements.onpage-help.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.onpage-help.js"></script>
		<script src="../admin_tmplate/docs/assets/js/rainbow.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/generic.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/html.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/css.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/javascript.js"></script>
	</body>
</html>
