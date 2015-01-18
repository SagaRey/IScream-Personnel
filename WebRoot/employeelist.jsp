<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="accordion" id="accordionTool">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionTool" href="#advancedsearch"> <i class="icon-search"></i>
				搜索
			</a>
		</div>
		<div id="advancedsearch" class="accordion-body collapse in">
			<div class="accordion-inner">
				<form class="form-inline">
					<div class="controls controls-row">
						<input type="text" id="sempid" class="span3" pattern="[0-9]{8}" placeholder="EmployeeID" value="${param.empid}">
						<input type="text" id="sname" class="span3" placeholder="EmployeeName" value="${param.name}">
						<input type="text" class="span3" data-date-format="yyyy-mm-dd" id="startdate" placeholder="StartDate" >
						<input type="text" class="span3" data-date-format="yyyy-mm-dd" id="enddate" placeholder="EndDate" >
					</div>
					<div class="controls controls-row">
						<br />
						<select class="span3" id="stype">
							<option value="-1">员工类型</option>
							<option value="0">正式员工</option>
							<option value="1">临时员工</option>
						</select>
						<input type="text" id="sdepid" class="span3" pattern="[0-9]{4}" placeholder="DepartmentID" value="${param.depid}">
						<input type="text" id="spostid" class="span3" pattern="[0-9]{4}" placeholder="PostID" value="${param.postid}">
						<span class="span1"></span>
						<button type="reset" class="btn span1">重置</button>
						<button type="button" class="btn btn-primary span1 " id="search">搜索</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionTool" href="#listrow"> <i class="icon-list"></i>
				工具
			</a>
		</div>
		<div id="listrow" class="accordion-body collapse">
			<div class="accordion-inner">
				<label class="checkbox inline">显示列表:</label>
				<label class="checkbox inline">
					<input type="checkbox" value="empid" checked>员工编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="name" checked>员工姓名</label>
				<label class="checkbox inline">
					<input type="checkbox" value="type" checked>员工类型</label>
				<label class="checkbox inline">
					<input type="checkbox" value="birthday" checked>生日</label>
				<label class="checkbox inline">
					<input type="checkbox" value="depid" checked>部门编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="depname" checked>部门名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="postid" checked>岗位编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="postname" checked>岗位名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="hiredate" checked>入职日期</label>
				<label class="checkbox inline">
					<input type="checkbox" value="phone" checked>电话</label>
				<label class="checkbox inline">
					<input type="checkbox" value="email" checked>邮箱</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
				<label class="checkbox inline">
					<button type="button" class="btn btn-small" id="operation">操作</button></label>
				<label class="checkbox inline">
					<a class="btn btn-small btn-info" href="toexcelservlet?action=emp" target="_blank">导出</a></label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="empid">员工编号</th>
		<th name="name">员工姓名</th>
		<th name="type">员工类型</th>
		<th name="birthday">生日</th>
		<th name="depid">部门编号</th>
		<th name="depname">部门名称</th>
		<th name="postid">岗位编号</th>
		<th name="postname">岗位名称</th>
		<th name="hiredate">入职日期</th>
		<th name="phone">电话</th>
		<th name="email">邮箱</th>
		<th name="operation" class="hide">操作</th>
	</tr>
	<c:forEach var="emp" items="${sessionScope.employeeinfolist}" >
	<tr>
		<td name="empid">${emp.empid}</td>
		<td name="name">${emp.name}</td>
		<td name="type">${emp.type==1?"临时员工":"正式员工"}</td>
		<td name="birthday">${emp.birthday}</td>
		<td name="depid">${emp.depid}</td>
		<td name="depname">${emp.depname}</td>
		<td name="postid">${emp.postid}</td>
		<td name="postname">${emp.postname}</td>
		<td name="hiredate">${emp.hiredate}</td>
		<td name="phone">${emp.phone}</td>
		<td name="email">${emp.email}</td>
		<td name="operation" class="hide">
			<button class="btn btn-mini btn-danger hide" name="modify">确定</button>
			<button class="btn btn-mini hide" name="cancel" >取消</button>
			<button class="btn btn-mini" name="modifybutton" >修改</button>
			<button class="btn btn-mini btn-danger" name="remove">删除</button>
		</td>
	</tr>
	</c:forEach>
</table>
<div class="navbar navbar-fixed-bottom">
	<div class="container-fluid">
		<div class="pagination pagination-right">
			<ul >
				<li class="previous">
					<a id="prevpage">«</a>
				</li>
				<c:forEach var="i" begin="1" end="${sessionScope.employeePagingUtil.totalPages}" step="1" >
					<li>
						<a name="page">${i}</a>
					</li>
				</c:forEach>
				<li class="next">
					<a id="nextpage" >»</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="modal hide fade" id="addmodal">
	<form class="form-horizontal" id="addform" action="" method="post" target="hide">
		<div class="modal-header">
			 <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close"><i class="icon-off"></i></button>
			<h3>新员工</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="name"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="name" placeholder="员工姓名" autofocus="autofocus" title="必须填写员工姓名" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="type"><i class="icon-tags"></i>
				</label>
				<div class="controls">
					<select id="type">
						<option value="-1" >员工类型</option>
						<option value="0" >正式员工</option>
						<option value="1" >临时员工</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="birthday"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="birthday" placeholder="生日" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="depid"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="depid" placeholder="部门编号" pattern="[0-9]{4}" title="正确的部门编号"></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="postid"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="postid" placeholder="岗位编号" pattern="[0-9]{4}" title="正确的岗位编号"></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="hiredate"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="hiredate" placeholder="入职日期" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phone"><i class="icon-bell"></i>
				</label>
				<div class="controls">
					<input type="text" id="phone" placeholder="电话号码" pattern="[0-9-+]{7,16}" title="正确的电话号码"></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email"><i class="icon-envelope"></i>
				</label>
				<div class="controls">
					<input type="email" id="email" placeholder="邮箱" ></div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="reset" class="btn">重置</button>
			<button type="submit" class="btn btn-primary" >确定</button>
		</div>
	</form>
</div>
<iframe style="display:none;" name="hide"></iframe>
<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			$("#list").load("employeeservlet?action=querybycondition",{
				empid:$("#sempid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("employeeservlet?method=a&action=querybycondition&reqpage=${sessionScope.employeePagingUtil.pervPage}",{
				empid:$("#sempid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("employeeservlet?method=a&action=querybycondition&reqpage=${sessionScope.employeePagingUtil.nextPage}",{
				empid:$("#sempid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("employeeservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				empid:$("#sempid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$("[type='checkbox']").click(function(){
			$("[name="+$(this).val()+"]").toggle();
		});
		$("#operation").click(function(){
			$("[name='operation']").toggle();
		});
		$("#add").click(function(){
			date = new Date();
			y = date.getFullYear(),
			_m = date.getMonth() + 1,
			m = (_m >9 ? _m : '0'+_m),
			_d = date.getDate(),
			d = (_d > 9 ? _d : '0'+_d);
			$('#hiredate').val(y + '-' + m + '-' + d);
			$("#addmodal").modal({backdrop:true});
		});
		$("#addform").submit(function(){
			$("#list").load("employeeservlet?action=add",{
				name:$("#name").val(),
				type:$("#type").val()==0?0:1,
				birthday:$("#birthday").val(),
				depid:$("#depid").val(),
				postid:$("#postid").val(),
				hiredate:$("#hiredate").val(),
				phone:$("#phone").val(),
				email:$("#email").val(),
			});
			$("#close").click();
		});
		$("[name='modifybutton']").click(function(){
			$(this).parent().parent().attr("contenteditable","true");
			$(this).parent().children("[name='modify']").show();
			$(this).parent().children("[name='cancel']").show();
			$(this).parent().children("[name='remove']").hide();
			$(this).hide();
		});
		$("[name='cancel']").click(function(){
			$(this).parent().parent().removeAttr("contenteditable");
			$(this).parent().children("[name='modify']").hide();
			$(this).parent().children("[name='modifybutton']").show();
			$(this).parent().children("[name='remove']").show();
			$(this).hide();
		});
		$("[name='remove']").click(function(){
			$("#list").load("employeeservlet?action=remove&empid="+$(this).parent().parent().children("[name='empid']").text());
		});
		$("[name='modify']").click(function(){
			$("#list").load("employeeservlet?action=modify",{
				empid:$(this).parent().parent().children("[name='empid']").text(),
				name:$(this).parent().parent().children("[name='name']").text(),
				type:$(this).parent().parent().children("[name='type']").text()==0?0:1,
				birthday:$(this).parent().parent().children("[name='birthday']").text(),
				depid:$(this).parent().parent().children("[name='depid']").text(),
				postid:$(this).parent().parent().children("[name='postid']").text(),
				hiredate:$(this).parent().parent().children("[name='hiredate']").text(),
				phone:$(this).parent().parent().children("[name='phone']").text(),
				email:$(this).parent().parent().children("[name='email']").text(),
			});
			
		});
	});
</script>
<script type="text/javascript">
	$('#startdate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#enddate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#birthday').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#hiredate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#startdate').datepicker();
	$('#enddate').datepicker();
	$('#birthday').datepicker();
	$('#hiredate').datepicker();
</script>