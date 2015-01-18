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
						<select class="span3" id="stype">
							<option value="-1">离职类型</option>
							<option value="0">主动离职</option>
							<option value="1">被动离职</option>
						</select>
						<input type="text" class="span3" data-date-format="yyyy-mm-dd" id="startdate" placeholder="StartDate" >
						<input type="text" class="span3" data-date-format="yyyy-mm-dd" id="enddate" placeholder="EndDate" >
						<span class="span1" ></span>
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
					<input type="checkbox" value="dimissiondate" checked>离职日期</label>
				<label class="checkbox inline">
					<input type="checkbox" value="type" checked>离职类型</label>
				<label class="checkbox inline">
					<input type="checkbox" value="istalent" checked>进入人才库</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
				<label class="checkbox inline">
					<a class="btn btn-small btn-info" href="toexcelservlet?action=dimission" target="_blank">导出</a></label>
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
		<th name="dimissiondate">离职日期</th>
		<th name="type">离职类型</th>
		<th name="istalent">进入人才库</th>
	</tr>
	<c:forEach var="dim" items="${sessionScope.dimissioninfolist}" >
	<tr>
		<td name="id">${dim.id}</td>
		<td name="empid">${dim.empid}</td>
		<td name="empname">${dim.empname}</td>
		<td name="depid">${dim.depid}</td>
		<td name="depname">${dim.depname}</td>
		<td name="postid">${dim.postid}</td>
		<td name="postname">${dim.postname}</td>
		<td name="dimissiondate">${dim.dimissiondate}</td>
		<td name="type">${dim.type==0?"主动离职":"被动离职"}</td>
		<td name="istalent">${dim.istalent?"是":"否"}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.dimissionPagingUtil.totalPages}" step="1" >
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
			<h3>员工离职</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="empid"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="empid" pattern="[0-9]{8}" placeholder="员工编号" title="必须填写员工编号" autofocus="autofocus" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="dimissiondate"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="dimissiondate" placeholder="离职日期" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="type"><i class="icon-tags"></i>
				</label>
				<div class="controls">
					<select id="type">
						<option value="-1" >离职类型</option>
						<option value="0" >主动离职</option>
						<option value="1" >被动离职</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="type"><i class="icon-bookmark"></i>
				</label>
				<div class="controls">
					<select id="istalent">
						<option value="-1" >进入人才库</option>
						<option value="false" >否</option>
						<option value="true" >是</option>
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
			$("#list").load("dimissionservlet?action=querybycondition",{
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("dimissionservlet?method=a&action=querybycondition&reqpage=${sessionScope.dimissionPagingUtil.pervPage}",{
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("dimissionservlet?method=a&action=querybycondition&reqpage=${sessionScope.dimissionPagingUtil.nextPage}",{
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
				startdate:$("#startdate").val(),
				enddate:$("#enddate").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("dimissionservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
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
		$("#add").click(function(){
			date = new Date();
			y = date.getFullYear(),
			_m = date.getMonth() + 1,
			m = (_m >9 ? _m : '0'+_m),
			_d = date.getDate(),
			d = (_d > 9 ? _d : '0'+_d);
			$('#dimissiondate').val(y + '-' + m + '-' + d);
			$("#addmodal").modal({backdrop:true});
		});
		$("#addform").submit(function(){
			$("#list").load("dimissionservlet?action=add",{
				empid:$("#empid").val(),
				dimissiondate:$("#dimissiondate").val(),
				type:$("#type").val()==1?1:0,
				istalent:$("#istalent").val()=="true"?"true":"false",
			});
			$("#close").click();
		});
	});
</script>
<script type="text/javascript">
	$('#dimissiondate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#startdate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#enddate').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#dimissiondate').datepicker();
	$('#startdate').datepicker();
	$('#enddate').datepicker();
</script>