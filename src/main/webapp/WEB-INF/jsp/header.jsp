<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page import="com.charvikent.issuetracking.model.User"%>
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
	
	HttpSession sess = request.getSession(false);
	User userDesignation = (User)sess.getAttribute("userDesignationSession");
	if (userDesignation == null) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
	}
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Kumar Pumps Task Management System</title>
    <link rel="shortcut icon" href="${baseurl }/img/klogo.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${baseurl }/assets/css/styles.css">
    <link rel="stylesheet" href="${baseurl }/assets/css/animate.min.css">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
    <![endif]-->

    <!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/datatables/dataTables.css' />  --%>
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/css/styles.css' /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${baseurl }/assets/css/datepicker1.css" rel="stylesheet" type="text/css" />

<script type='text/javascript' src='${baseurl }/assets/js/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='${baseurl }/assets/js/jquery.printThis.js'></script>


<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
<link rel="stylesheet" href="${baseurl }/assets/css/select2.css">
<link href="https://fonts.googleapis.com/css?family=PT+Sans|Roboto+Condensed" rel="stylesheet">




<script type='text/javascript' src='${baseurl }/js/canvasjs.min.js'></script> 
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<link rel="stylesheet" href="${baseurl }/assets/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="${baseurl }/assets/css/jquery.dataTables.min.css">


<!--  for pie charts-->

<script src="${baseurl }/assets/js/amcharts.js"></script>
<script src="${baseurl }/assets/js/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="${baseurl }/assets/js/light.js"></script>


<script src="${baseurl }/assets/js/export.min.js"></script>
<link type="text/css" rel="stylesheet" href="${baseurl }/assets/css/export.css">
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<style type="text/css">

@media (max-width: 767px) {

nav.navbar .navbar-header {
    width: auto;
    margin-top: 32px;
}

}

.dataTables_wrapper .form-control
{
padding: 0px !important;
height: auto !important;
display: inline-block !important;
width: auto !important;
}

.panel-heading {
    font-size: 18px;
    border-bottom: 1px solid #dddddd;
    border-top-right-radius: 1px;
    border-top-left-radius: 1px;
    height: 40px;
    line-height: 2em;
}

#page-container, #page-content{min-height: auto;}
.control-label {
	text-align: right;
	margin-bottom: 0;
    padding-top: 8px;
}
.impColor{color:red;}

.view, .edit, .delete, .activate, .deactivate {cursor: pointer;}
.edit {color: blue;}
.deactivate {color: blue;}
.activate {color: red;}

 .impFiled {color: blue;}
 .panel-success {background-color: #4CAF50 !important;}

span.has-error,span.hasError
{
  font-weight:normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}
.error{color: red; font-weight: bold;}

.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

.msgcss
{
/* 	width: 50% !important; */
/* 	font-weight: bold; */
	margin: auto;
	text-align: center;
	top: 3px !important;
	left:0;
	right:0;
	position: fixed;
	font-size: 14px;
	z-index:99999;
}
.msgcss1
{
/* 	width: 50% !important; */
/* 	font-weight: bold; */
	margin: auto;
	text-align: center;
	top: 3px !important;
	left:0;
	right:0;
	position: fixed;
	font-size: 14px;
	z-index:99999;
}
.select2
{
/* 	max-width: 100% !important; */
/* 	width: 100% !important; */
}
.fa {
color: inherit !important;
}

.navbar {
}

.navbar a {
    float: left;
    color:#FFFFFF;
    text-align: center;
    text-decoration: none;
}

.dropdown {
    float: left;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
	border-radius:10px;
    outline: none;
    color: white;
    background-color:#3366CC;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color:#3366FF;
    
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
   	width: 300px;
    z-index: 1;
	margin-left:-35px;
	right:-140px;
	height:200px;
	overflow-y:auto;
}

.dropdown-content a {
    float: none;
    color: black;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #f9f9f9;
}

.dropdown:hover .dropdown-content {
    display: block;
}
table.dataTable tfoot th, table.dataTable tfoot td {
    padding: 10px 18px 6px 18px;
    border-top: 1px solid #ccc !important; 
}

  	.table1{
		border:solid 1px;
		border-color:#CCCCCC;
		width:260px;
	}
	.tr1, .td1, .th1{
		border:solid 1px;
		border-color:#CCCCCC;
	}
	#passwordErrormsg {
		text-align:center;
	}
	#return-to-top {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: rgb(0, 0, 0);
    background: rgba(0, 0, 0, 0.7);
    width: 50px;
    height: 50px;
    display: block;
    text-decoration: none;
    -webkit-border-radius: 35px;
    -moz-border-radius: 35px;
    border-radius: 35px;
    display: none;
    -webkit-transition: all 0.3s linear;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top i {
    color: #fff;
    margin: 0;
    position: relative;
    left: 16px;
    top: 13px;
    font-size: 19px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top:hover {
    background: rgba(0, 0, 0, 0.9);
}
#return-to-top:hover i {
    color: #fff;
    top: 5px;
}
@media only screen and (max-width: 640px) and (min-width: 320px) {
#page-heading h1 {
    margin: 0;
    padding: 16px 1px 0px 20px;
    float: left;
    line-height: 25px;
    font-weight: 300;
    font-size: 27px;
    margin-bottom: 3px;
}
}
</style>
<script type="text/javascript">
	var isClick = 'No';
		window.setTimeout(function() {
		    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
		        $(this).remove(); 
		    });
		}, 5000);
		
		 $(document).ready(function(){
			
			 toolTips();
			 
			 getHeadersCounts();
			
			  /* var formData = new FormData();
		    
			$.fn.makeMultipartRequest('POST', 'getCount', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
				$("#unseentasks").text(jsonobj.unseentasks);
				
				$("#reopentaskscount").text(jsonobj.reopentaskscount);
				
//		 		var alldata = jsonobj.allOrders1;
//		 		console.log(jsonobj.allOrders1);
//		 		displayTable(alldata);
			});   */
		}); 
		
</script>


<script> 
function toolTips(){
	    $('.view').attr('data-toggle','tooltip');
		$('.view').attr('data-original-title','View');
		$('.edit').attr('data-toggle','tooltip');
		$('.edit').attr('data-original-title','Edit');
		$('.delete').attr('data-toggle','tooltip');
		$('.delete').attr('data-original-title','Delete');
		$('.activate').attr('data-toggle','tooltip');
		$('.activate').attr('data-original-title','Activate');
		$('.deactivate').attr('data-toggle','tooltip');
		$('.deactivate').attr('data-original-title','Deactivate');
		$('.comment').attr('data-toggle', 'tooltip');
		$('.comment').attr('data-original-title', 'Add Comment');
		$('.time').attr('data-toggle', 'tooltip');
		$('.time').attr('data-original-title', 'View Deadline');
		$('.history').attr('data-toggle','tooltip');
		$('.history').attr('data-original-title','History');
		$('.clone').attr('data-toggle','tooltip');
		$('.clone').attr('data-original-title','Clone');
		$('[data-toggle="tooltip"]').tooltip(); 
}


function getHeadersCounts(){
	
	 var formData = new FormData();
	    
		 $.fn.makeMultipartRequest('POST', 'getCount', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			$("#unseentasks").text(jsonobj.unseentasks);
			$("#reopentaskscount").text(jsonobj.reopentaskscount);
			
		});   

		
}





</script>
</head>

<body class="horizontal-nav ">
	<c:if test="${not empty msg}">
		<div class="msgcss row">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-${cssMsg} fadeIn animated">${msg}</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="msgcss1 row" style="visibility: hidden" >
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-success fadeIn animated" id="msg1"></div>
				</div>
			</div>
		</div>


    <header class="navbar navbar-inverse navbar-fixed-top" role="banner" style="background: #4f8edc;">
            <a class="navbar-brand" href="javascript:void(0);"><img src="${baseurl }/assets/img/klogo.png"  style ="width:auto;height:57px;" class="img-responsive hde"><img src="${baseurl }/assets/img/klogo1.png"  style ="width:auto;height:57px;" class="img-responsive hde0"></a>
            
		<div style="float:right;" class="masters">
	        <ul class="nav navbar-nav pull-right toolbar">
	        <li style="float:left;">
            <div style="box-shadow:none;" class="navbar">
  <div style="border-left:none; margin-right:10px;" class="dropdown">
    <diV style="color:#FFFFFF; background:#4f8edc; font-size:20px; margin-top:12px; margin-right:10px;" class="dropbtn"">    


    <i class="fa fa-list-alt"></i><!-- <span class="badge">5</span> -->
    </div>
     <c:if test="${not empty acknotification}">


    <div id="ack" class="dropdown-content">
      <a style="padding: 10px 16px;" href="#">
      
      	<table class="table1">
        	<thead>

            	<tr class="tr1" style="  background: #006699; color: #FFF;">               
                	<th class="th1">Task No.</th>
                	<th class="th1">Field</th>
                	<!-- <th>Change</th> -->
                </tr>
            </thead>
            <tbody>
             <c:forEach var="issue" items="${acknotification}">
            	<tr class="tr1">
                	<td class="td1">${issue.taskno}</td>
                    <td class="td1">${issue.kpfield}</td>
                   <%--  <td>${issue.kpchange}</td> --%>
                </tr>
               </c:forEach>
            	
            </tbody>
        </table>
        
      </a>
    </div>
    </c:if>
  </div> 
</div>
                </li> 
            <li style="float:left;">
            <div style="box-shadow:none; margin-right:10px;" class="navbar">
  <div style="border-left:none;" class="dropdown">
    <diV style="color:#FFFFFF; background:#4f8edc; font-size:20px; margin-top:12px;" class="dropbtn"">


      <i class="fa fa-bell-o"></i><!-- <span class="badge">5</span> -->
    </div>
    <c:if test="${not empty notifications}">
    <div class="dropdown-content">
      <a style="padding: 10px 16px;" href="#">
      
      	<table class="table1">
        	<thead>
            	<tr class="tr1" style="
    background: #006699;
    color: #FFF;
">
                	<th class="th1">Task No.</th>
                	<th class="th1">Field</th>
                	<th class="th1">Change</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="issue" items="${notifications}">
            	<tr class="tr1">
                	<td class="td1">${issue.taskno}</td>
                    <td class="td1">${issue.kpfield}</td>
                    <td class="td1">${issue.kpchange}</td>
                </tr>
                </c:forEach>
                
                
            	
            </tbody>
        </table>
      
      </a>
    </div>
      </c:if>
  </div> 
</div>
                </li>
	             <%-- <li style="float:left;margin-right:35px"><a href="${baseurl}/task" style="color:white;">Create Task</a></li> --%>
	            <li style="float:left; margin-right:5px; margin-top:3px;"><a href="${baseurl}/task#taskf" style="color:white;"><span id="ttop">Create Task</span></a></li>
	   
	            <li style=" margin-top:3px;" class="dropdown">
	                <a href="#" class="dropdown-toggle username" data-toggle="dropdown" style="color: white;"><span class="hidden-xs" > <%= userDesignation.getDesignationName() %> <i class="fa fa-caret-down"></i></span><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt="Dangerfield" /></a>
	                <ul class="dropdown-menu userinfo arrow">
	                    <li class="username">
	                        <a href="#">
	                            <div class="pull-left"><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt=""/></div>
	                            <div class="pull-right"><h5> hi ${pageContext.request.userPrincipal.name} !</h5><small>Logged in as <span><%= userDesignation.getDesignationName() %></span></small></div> 
	                        </a>
	                    </li>
	                    <li class="userlinks">
	                        <ul class="dropdown-menu">
	                            <!-- <li><a href="editProfile">Edit Profile <i class="pull-right fa fa-pencil" style="margin-left:85px;"></i></a></li> -->
	                            <li><a href="changePassword">Change Password <i class="pull-right fa fa-cog newcog"  style="margin-left:45px;"></i></a></li>
	                         <%--    <c:url value="${peContext.request.contextPath}/logout" var="logoutUrl" /> --%>
	
	                          <%--  <li><a href="<c:url value="${baseurl}/logOutKptms" />"> Sign Out</a></li> --%>
	                            <li><a href="<c:url value="${baseurl}/logout" />"> Sign Out</a></li>
	                         <%--   <li><a href="<c:url value="j_spring_security_logout" />" > Sign Out</a></li> --%>
	                            
	                         
	                        </ul>
	                        <li>Last LoginTime: </li>
	                        <li>${lastLoginTime}</li>
	                    </li>
	                </ul>
	            </li>
	        </ul>
        </div>
            <div class="clearfix"></div>
        </div>
    </header>
<div class="clearfix"></div>
    <nav class="navbar navbar-default yamm top20" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <i class="fa fa-bars"></i>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse" id="horizontal-navbar">
            <ul class="nav navbar-nav">
            
            <li class="dashBoard mobi"><a href="${baseurl }/dashBoard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
             <security:authorize access="hasRole('ROLE_MASTERADMIN')">
              <li class="org mobi"><a href="${baseurl }/kporg"><i class="fa fa-building"></i><span>Organization</span></a></li>
            </security:authorize>
            <security:authorize access="hasRole('ROLE_ADMIN')">
            <li class="dept mobi"><a href="${baseurl }/dept"><i class="fa fa-american-sign-language-interpreting"></i> <span>Department</span></a></li>
              <%-- <li class="desig mobi"><a href="${baseurl }/desig"><i class="fa fa-plane"></i> <span>Designation</span></a></li> --%>
             <li class="orgDept mobi"><a href="${baseurl }/orgDept"><i class="fa fa-sitemap"></i> <span>Hierarchical</span></a></li>
              <li class="cate mobi"><a href="${baseurl }/cate"><i class="fa fa-black-tie"></i> <span>Task Category</span></a></li>
             <%--  <li class="category"><a href="${baseurl }/category"><i class="fa fa-black-tie"></i> <span>Product Category</span></a></li>
             <li class="product"><a href="${baseurl }/product"><i class="fa fa-black-tie"></i> <span>Product Model</span></a></li> --%>
             	
             	
             	<li class="employee mobi"><a href="${baseurl }/employee"><i class="fa fa-users"></i> <span>Employees</span></a></li>
              </security:authorize>
              <li class="task mobi"><a href="${baseurl }/task"><i class="fa fa-tasks"></i> <span>Task</span></a></li>
			  <li class="empchart"><a href="${baseurl }/orgemployee"><i class="fa fa-sitemap"></i> <span>EmployesChart</span></a></li>
			<security:authorize access="hasRole('ROLE_ADMIN')">
			 <%-- <li class="taskreports"><a href="${baseurl }/taskReports"><i class="fa fa-calendar"></i> <span>Reports</span></a></li> --%>
			 <li class="taskfilter"><a href="${baseurl }/taskfilter"><i class="fa fa-filter"></i> <span>ViewTasks</span></a></li>
			</security:authorize> 
			</ul>
		</div>
    </nav>
<div class="clearfix bot"></div>
    <div id="page-container">
    	<div id="page-content" style="min-height: auto;">
    		<div id="wrap">
	        <div id="page-heading" class="row">
	        	<div class="col-md-6">
					<h1 id="pageName">Dashboard</h1>
				</div>
				<div class="btn-toolbar pull-right">
		                    <a href="#" class="btn btn-danger "><span id="unseentasks"> </span><br>Unread Tasks</a>
		                    <a href="#" class="btn btn-warning"><span id="reopentaskscount"></span><br>Reopen Tasks</a>
		                    <!-- <a href="#" class="btn btn-info"><span id="totalGas1">27956</span><br>Gas in Kgs</a> -->
		                </div>
	        </div>
	        </div>