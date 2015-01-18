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
						<input type="text" id="scurrentpostid" class="span2" pattern="[0-9]{4}" placeholder="CurrentpostID" value="${param.currentpostid}">
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
					<input type="checkbox" value="originalpostid" checked>前岗位编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="originalpostname" checked>前岗位名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="currentpostid" checked>现岗位编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="currentpostname" checked>现岗位名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="mobilizedate" checked>调动日期</label>
				<label class="checkbox inline">
					<input type="checkbox" value="type" checked>调动类型</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
				<label class="checkbox inline">
					<a class="btn btn-small btn-info" href="toexcelservlet?action=mobpost" target="_blank">导出</a></label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="id">编号</th>
		<th name="empid">员工编号</th>
		<th name="empname">员工姓名</th>
		<th name="originalpostid">前岗位编号</th>
		<th name="originalpostname">前岗位名称</th>
		<th name="currentpostid">现岗位编号</th>
		<th name="currentpostname">现岗位名称</th>
		<th name="mobilizedate">调动日期</th>
		<th name="type">调动类型</th>
	</tr>
	<c:forEach var="mobpost" items="${sessionScope.mobilizepostinfolist}" >
	<tr>
		<td name="id">${mobpost.id}</td>
		<td name="empid">${mobpost.empid}</td>
		<td name="empname">${mobpost.empname}</td>
		<td name="originalpostid">${mobpost.originalpostid}</td>
		<td name="originalpostname">${mobpost.originalpostname}</td>
		<td name="currentpostid">${mobpost.currentpostid}</td>
		<td name="currentpostname">${mobpost.currentpostname}</td>
		<td name="mobilizedate">${mobpost.mobilizedate}</td>
		<td name="type">${mobpost.type==1?"被动":"主动"}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.mobilizepostPagingUtil.totalPages}" step="1" >
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
			<h3>调转岗位</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="empid"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="empid" pattern="[0-9]{8}" placeholder="员工编号" title="必须填写员工编号" autofocus="autofocus" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="originalpostid"><i class="icon-tasks"></i>
				</label>
				<div class="controls">
					<input type="text" id="originalpostid" pattern="[0-9]{4}" placeholder="前岗位编号" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="currentpostid"><i class="icon-tasks"></i>
				</label>
				<div class="controls">
					<input type="text" id="currentpostid" pattern="[0-9]{4}" placeholder="现岗位编号" required></div>
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
			$("#list").load("mobilizepostservlet?action=querybycondition",{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentpostid:$("#scurrentpostid").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("mobilizepostservlet?method=a&action=querybycondition&reqpage=${sessionScope.mobilizepostPagingUtil.pervPage}",{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentpostid:$("#currentpostid").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("mobilizepostservlet?method=a&action=querybycondition&reqpage=${sessionScope.mobilizepostPagingUtil.nextPage}",{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentpostid:$("#currentpostid").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("mobilizepostservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				empname:$("#sempname").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
				currentpostid:$("#currentpostid").val(),
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
			$("#list").load("mobilizepostservlet?action=add",{
				empid:$("#empid").val(),
				originalpostid:$("#originalpostid").val(),
				currentpostid:$("#currentpostid").val(),
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