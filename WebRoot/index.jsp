<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
	<title>IScream</title>
	<meta charset="UTF-8">
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="css/datepicker.css" rel="stylesheet" media="screen">
	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/locales/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>
   	<script type="text/javascript">
    	$(function(){
    		$("[class='accordion-toggle']").click(function(){
    			$(this).children("[class~='icon-circle-arrow-down']").toggle();
    			$(this).children("[class~='icon-circle-arrow-up']").toggle();
    		});
    		$("#departments").click(function(){
    			$("#list").load("departmentservlet?action=querybycondition");
    		});
    		$("#posts").click(function(){
    			$("#list").load("postservlet?action=querybycondition");
    		});
    		$("#employees").click(function(){
    			$("#list").load("employeeservlet?action=querybycondition");
    		});
    		$("#mobilizedep").click(function(){
    			$("#list").load("mobilizedepservlet?action=querybycondition");
    		});
    		$("#mobilizepost").click(function(){
    			$("#list").load("mobilizepostservlet?action=querybycondition");
    		});
    		$("#probationary").click(function(){
    			$("#list").load("probationaryservlet?action=querybycondition");
    		});
    		$("#dimission").click(function(){
    			$("#list").load("dimissionservlet?action=querybycondition");
    		});
    		$("#talents").click(function(){
    			$("#list").load("talentservlet?action=querybycondition");
    		});
    	});
    </script>
    <c:if test="${sessionScope.manager==null}">
    <script type="text/javascript">
    	$(function(){
     		$("#loginmodal").modal({backdrop:'static'});
    	});
    </script>
    </c:if>
	<script>
		function launchFullscreen(element) {
			if (element.requestFullScreen) {
				element.requestFullScreen();
			} else if (element.mozRequestFullScreen) {
				element.mozRequestFullScreen();
			} else if (element.webkitRequestFullScreen) {
				element.webkitRequestFullScreen();
			}
		}
	
		function cancelFullscreen() {
			if (document.cancelFullScreen) {
				document.cancelFullScreen();
			} else if (document.mozCancelFullScreen) {
				document.mozCancelFullScreen();
			} else if (document.webkitCancelFullScreen) {
				document.webkitCancelFullScreen();
			}
		}
	
		function dumpFullscreen() {
			console.log("document.fullScreenElement is: ",
					document.fullScreenElement || document.mozFullScreenElement
							|| document.webkitFullScreenElement);
			console.log("document.fullScreenEnabled is: ",
					document.fullScreenEnabled || document.mozScreenEnabled
							|| document.webkitScreenEnabled);
		}
	
		// Events
		document.addEventListener("fullscreenchange", function(e) {
			console.log("fullscreenchange event! ", e);
		});
		document.addEventListener("mozfullscreenchange", function(e) {
			console.log("mozfullscreenchange event! ", e);
		});
		document.addEventListener("webkitfullscreenchange", function(e) {
			console.log("webkitfullscreenchange event! ", e);
		});
	
		// Add different events for fullscreen
	</script>
	<script type="text/javascript">
		$(function(){
			$("#fullscreen").click(function(){
				$('#head').slideUp('slow',launchFullscreen(document.documentElement));
			});
			$("#index").click(function(){
				$('#head').slideDown('slow',cancelFullscreen());
			});
		});
	</script>
</head>
<body>
	<div class="container-fluid" id="head">
		<div class="page-header well well-small"  style="background-color:white">
			<h1> 人事管理系统</h1>
			<h5><small> —— Power By IScream Team</small></h5>
		</div>
	</div>
	<div class="container-fluid">
		<div class="navbar navbar-inverse">
	  		<div class="navbar-inner">
	  			<a class="brand" id="fullscreen" >IScream</a>
		  		<ul class="nav pull-left">
		  			<li class="active">
		  				<a id="index">首页</a>
		  			</li>
				</ul>
		  		<ul class="nav pull-right">
		  			<li>
		  				<a href="managementservlet?action=logout"><i class="icon-off icon-white" ></i> 注销</a>
		  			</li>
				</ul>
	  		</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<div class="accordion" id="accordionMenu">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionMenu" href="#menu1">
								信息中心 <i class="icon-circle-arrow-up pull-right"></i><i class="icon-circle-arrow-down pull-right hide"></i>
      						</a>
						</div>
						<div id="menu1" class="accordion-body collapse in">
							<div class="accordion-inner">
								<button id="employees" class="btn btn-link" >员工信息</button>
					      	</div>
					      	<div class="accordion-inner">
								<button id="departments" class="btn btn-link" >部门信息</button>
					      	</div>
					      	<div class="accordion-inner">
								<button id="posts" class="btn btn-link" >岗位信息</button>
					      	</div>
					      	<div class="accordion-inner">
								<button id="talents" class="btn btn-link" >人才信息</button>
					      	</div>
					    </div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionMenu" href="#menu2">
								管理系统 <i class="icon-circle-arrow-down pull-right"></i><i class="icon-circle-arrow-up pull-right hide"></i>
      						</a>
						</div>
						<div id="menu2" class="accordion-body collapse">
							<div class="accordion-inner">
								<button id="mobilizedep" class="btn btn-link" >部门调动</i></button>
					      	</div>
					      	<div class="accordion-inner">
								<button id="mobilizepost" class="btn btn-link" >岗位调动</button>
					      	</div>
					      	<div class="accordion-inner">
								<button id="probationary" class="btn btn-link" >试用管理</button>
					      	</div>
					      	<div class="accordion-inner">
								<button id="dimission" class="btn btn-link" >离职管理</button>
					      	</div>
					    </div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionMenu" href="#menu3">
								报表统计 <i class="icon-circle-arrow-down pull-right"></i><i class="icon-circle-arrow-up pull-right hide"></i>
      						</a>
						</div>
						<div id="menu3" class="accordion-body collapse">
							<div class="accordion-inner">
								<button class="btn btn-link" >员工报表 </button>
					      	</div>
					      	<div class="accordion-inner">
								<button class="btn btn-link" >部门报表</button>
					      	</div>
					      	<div class="accordion-inner">
								<button class="btn btn-link" >岗位报表</button>
					      	</div>
					    </div>
					</div>
				</div>
			</div>
			<div class="span10" id="list">
				
			</div>
		</div>
	</div>
	<div class="modal hide fade" id="loginmodal">
		<form class="form-horizontal" action="managementservlet?action=login" method="post">
			<div class="modal-header">
				<h3>管理员</h3>
			</div>
			<div class="modal-body">
				<div class="control-group">
					<label class="control-label" for="inputManagername"> <i class="icon-user"></i>
					</label>
					<div class="controls">
						<input type="text" name="managername" id="inputManagername" placeholder="Manager"></div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword"> <i class="icon-lock"></i>
					</label>
					<div class="controls">
						<input type="password" name="password" id="inputPassword" placeholder="Password"></div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="reset" class="btn">重置</button>
				<button type="submit" class="btn btn-primary">登录</button>
			</div>
		</form>
	</div>
</body>
</html>