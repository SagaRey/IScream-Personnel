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
						<input type="text" id="sempname" class="span2" placeholder="EmployeeName" value="${param.empname}">
						<input type="text" id="scurrentdepid" class="span2" pattern="[0-9]{4}" placeholder="CurrentdepID" value="${param.currentdepid}">
						<input type="text" class="span3" data-date-format="yyyy-mm-dd" id="startdate" placeholder="StartDate" >
						<input type="text" class="span3" data-date-format="yyyy-mm-dd" id="enddate" placeholder="EndDate" >
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
					<input type="checkbox" value="originaldepid" checked>前部门编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="originaldepname" checked>前部门名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="currentdepid" checked>现部门编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="currentdepname" checked>现部门名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="mobilizedate" checked>调动日期</label>
				<label class="checkbox inline">
					<input type="checkbox" value="type" checked>调动类型</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
				<label class="checkbox inline">
					<a class="btn btn-small btn-info" href="toexcelservlet?action=mobdep" target="_blank">导出</a></label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="id">编号</th>
		<th name="empid">员工编号</th>
		<th name="empname">员工姓名</th>
		<th name="originaldepid">前部门编号</th>
		<th name="originaldepname">前部门名称</th>
		<th name="currentdepid">现部门编号</th>
		<th name="currentdepname">现部门名称</th>
		<th name="mobilizedate">调动日期</th>
		<th name="type">调动类型</th>
	</tr>
	<c:forEach var="mobdep" items="${sessionScope.mobilizedepinfolist}" >
	<tr>
		<td name="id">${mobdep.id}</td>
		<td name="empid">${mobdep.empid}</td>
		<td name="empname">${mobdep.empname}</td>
		<td name="originaldepid">${mobdep.originaldepid}</td>
		<td name="originaldepname">${mobdep.originaldepname}</td>
		<td name="currentdepid">${mobdep.currentdepid}</td>
		<td name="currentdepname">${mobdep.currentdepname}</td>
		<td name="mobilizedate">${mobdep.mobilizedate}</td>
		<td name="type">${mobdep.type==1?"被动":"主动"}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.mobilizedepPagingUtil.totalPages}" step="1" >
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
			<h3>调转部门</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="empid"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="empid" pattern="[0-9]{8}" placeholder="员工编号" title="必须填写员工编号" autofocus="autofocus" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="originaldepid"><i class="icon-tasks"></i>
				</label>
				<div class="controls">
					<input type="text" id="originaldepid" pattern="[0-9]{4}" placeholder="前部门编号" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="currentdepid"><i class="icon-tasks"></i>
				</label>
				<div class="controls">
					<input type="text" id="currentdepid" pattern="[0-9]{4}" placeholder="现部门编号" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="type"><i class="icon-tags"></i>
				</label>
				<div class="controls">
					<select id="type">
						<option value="-1" >类型</option>
						<option value="0" >主动</option>
						<option value="1" >被动</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="mobilizedate"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="mobilizedate" placeholder="调动日期" required></div>
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
			$("#list").load("mobilizedepservlet?action=querybycondition",{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentdepid:$("#scurrentdepid").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("mobilizedepservlet?method=a&action=querybycondition&reqpage=${sessionScope.mobilizedepPagingUtil.pervPage}",{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentdepid:$("#currentdepid").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("mobilizedepservlet?method=a&action=querybycondition&reqpage=${sessionScope.mobilizedepPagingUtil.nextPage}",{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentdepid:$("#currentdepid").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("mobilizedepservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentdepid:$("#currentdepid").val(),
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
			$('#mobilizedate').val(y + '-' + m + '-' + d);
			$("#addmodal").modal({backdrop:true});
		});
		$("#addform").submit(function(){
			$("#list").load("mobilizedepservlet?action=add",{
				empid:$("#empid").val(),
				originaldepid:$("#originaldepid").val(),
				currentdepid:$("#currentdepid").val(),
				mobilizedate:$("#mobilizedate").val(),
				type:$("#type").val()==1?1:0,
			});
			$("#close").click();
		});
	});
</script>
<script type="text/javascript">
	$('#mobilizedate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#startdate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#enddate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#mobilizedate').datepicker();
	$('#startdate').datepicker();
	$('#enddate').datepicker();
</script>