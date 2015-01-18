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
						<input type="text" id="sempname" class="span3" placeholder="EmployeeName" value="${param.empname}">
						<input type="text" id="sdepid" class="span2" pattern="[0-9]{4}" placeholder="DepartmentID" value="${param.depid}">
						<input type="text" id="spostid" class="span2" pattern="[0-9]{4}" placeholder="PostID" value="${param.postid}">
						<select class="span3" id="sstatus">
							<option value="-1">状态</option>
							<option value="0">正常</option>
							<option value="1">延期</option>
						</select>
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
					<input type="checkbox" value="id" checked>编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="empid" checked>员工编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="empname" checked>员工姓名</label>
				<label class="checkbox inline">
					<input type="checkbox" value="depid" checked>部门编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="depname" checked>部门名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="postid" checked>岗位编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="postname" checked>岗位名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="startdate" checked>开始日期</label>
				<label class="checkbox inline">
					<input type="checkbox" value="enddate" checked>结束日期</label>
				<label class="checkbox inline">
					<input type="checkbox" value="status" checked>状态</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="id">编号</th>
		<th name="empid">员工编号</th>
		<th name="empname">员工姓名</th>
		<th name="depid">部门编号</th>
		<th name="depname">部门名称</th>
		<th name="postid">岗位编号</th>
		<th name="postname">岗位名称</th>
		<th name="startdate">开始日期</th>
		<th name="enddate">结束日期</th>
		<th name="status">状态</th>
	</tr>
	<c:forEach var="prob" items="${requestScope.probationaryinfolist}" >
	<tr>
		<td name="id">${prob.id}</td>
		<td name="empid">${prob.empid}</td>
		<td name="empname">${prob.empname}</td>
		<td name="depid">${prob.depid}</td>
		<td name="depname">${prob.depname}</td>
		<td name="postid">${prob.postid}</td>
		<td name="postname">${prob.postname}</td>
		<td name="startdate">${prob.startdate}</td>
		<td name="enddate">${prob.enddate}</td>
		<td name="status">${prob.status==0?"正常":"延期"}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.probationaryPagingUtil.totalPages}" step="1" >
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
			<h3>试用期</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="empid"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="empid" pattern="[0-9]{8}" placeholder="员工编号" title="必须填写员工编号" autofocus="autofocus" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="startdate"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="startdate" placeholder="开始日期" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="enddate"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="enddate" placeholder="结束日期" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="status"><i class="icon-tags"></i>
				</label>
				<div class="controls">
					<select id="status">
						<option value="-1" >状态</option>
						<option value="0" >正常</option>
						<option value="1" >延期</option>
					</select>
				</div>
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
			$("#list").load("probationaryservlet?action=querybycondition",{
				empname:$("#sempname").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				status:$("#sstatus").val()=='-1'?null:$("#sstatus").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("probationaryservlet?method=a&action=querybycondition&reqpage=${sessionScope.probationaryPagingUtil.pervPage}",{
				empname:$("#sempname").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				status:$("#sstatus").val()=='-1'?null:$("#sstatus").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("probationaryservlet?method=a&action=querybycondition&reqpage=${sessionScope.probationaryPagingUtil.nextPage}",{
				empname:$("#sempname").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				status:$("#sstatus").val()=='-1'?null:$("#sstatus").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("probationaryservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				empname:$("#sempname").val(),
				depid:$("#sdepid").val(),
				postid:$("#spostid").val(),
				status:$("#sstatus").val()=='-1'?null:$("#sstatus").val(),
			});
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$("[type='checkbox']").click(function(){
			$("[name="+$(this).val()+"]").toggle();
		});
		$("#add").click(function(){
			date = new Date();
			y = date.getFullYear(),
			_m = date.getMonth() + 1,
			m = (_m >9 ? _m : '0'+_m),
			_d = date.getDate(),
			d = (_d > 9 ? _d : '0'+_d);
			$('#startdate').val(y + '-' + m + '-' + d);
			$("#addmodal").modal({backdrop:true});
		});
		$("#addform").submit(function(){
			$("#list").load("probationaryservlet?action=add",{
				empid:$("#empid").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				status:$("#status").val()==1?1:0,
			});
			$("#close").click();
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
	$('#startdate').datepicker();
	$('#enddate').datepicker();
</script>