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
						<input type="text" id="sdepid" class="span3" pattern="[0-9]{4}" placeholder="DepartmentID" value="${param.depid}">
						<input type="text" id="sname" class="span3" placeholder="DeparmentName" value="${param.name}">
						<select class="span3" id="stype">
							<option value="-1">类型</option>
							<option value="0">公司</option>
							<option value="1">部门</option>
						</select>
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
					<input type="checkbox" value="depid" checked>部门编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="name" checked>部门名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="parentdepid" checked>上级部门编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="parentdepname" checked>上级部门名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="type" checked>部门类型</label>
				<label class="checkbox inline">
					<input type="checkbox" value="phone" checked>电话</label>
				<label class="checkbox inline">
					<input type="checkbox" value="established" checked>成立日期</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
				<label class="checkbox inline">
					<button type="button" class="btn btn-small" id="operation">操作</button></label>
				<label class="checkbox inline">
					<a class="btn btn-small btn-info" href="toexcelservlet?action=dep" target="_blank">导出</a></label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="depid">部门编号</th>
		<th name="name">部门名称</th>
		<th name="parentdepid">上级部门编号</th>
		<th name="parentdepname">上级部门名称</th>
		<th name="type">部门类型</th>
		<th name="phone">电话</th>
		<th name="established">成立日期</th>
		<th name="operation" class="hide">操作</th>
	</tr>
	<c:forEach var="dep" items="${sessionScope.departmentinfolist}" >
	<tr>
		<td name="depid">${dep.depid}</td>
		<td name="name">${dep.name}</td>
		<td name="parentdepid">${dep.parentdepid}</td>
		<td name="parentdepname">${dep.parentdepname}</td>
		<td name="type">${dep.type==1?"部门":"公司"}</td>
		<td name="phone">${dep.phone}</td>
		<td name="established">${dep.established}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.DepartmentPagingUtil.totalPages}" step="1" >
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
			<h3>新部门</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="name"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="name" placeholder="部门名称" autofocus="autofocus" title="必须填写部门名称" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="parentdepid"><i class="icon-tasks"></i>
				</label>
				<div class="controls">
					<input type="text" id="parentdepid" placeholder="上级部门编号"></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="type"><i class="icon-tags"></i>
				</label>
				<div class="controls">
					<select id="type">
						<option value="-1" >部门类型</option>
						<option value="0" >公司</option>
						<option value="1" >部门</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phone"><i class="icon-bell"></i>
				</label>
				<div class="controls">
					<input type="text" id="phone" placeholder="电话号码" pattern="[0-9-+]{7,16}" title="正确的电话号码"></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="established"><i class="icon-calendar"></i>
				</label>
				<div class="controls">
					<input type="text" data-date-format="yyyy-mm-dd" id="established" placeholder="创建日期" required></div>
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
			$("#list").load("departmentservlet?action=querybycondition",{
				depid:$("#sdepid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("departmentservlet?method=a&action=querybycondition&reqpage=${sessionScope.DepartmentPagingUtil.pervPage}",{
				depid:$("#sdepid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("departmentservlet?method=a&action=querybycondition&reqpage=${sessionScope.DepartmentPagingUtil.nextPage}",{
				depid:$("#sdepid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("departmentservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				depid:$("#sdepid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
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
			$('#established').val(y + '-' + m + '-' + d);
			$("#addmodal").modal({backdrop:true});
		});
		$("#addform").submit(function(){
			$("#list").load("departmentservlet?action=add",{
				name:$("#name").val(),
				parentdepid:$("#parentdepid").val(),
				type:$("#type").val()==0?0:1,
				phone:$("#phone").val(),
				established:$("#established").val(),
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
			$("#list").load("departmentservlet?action=remove&depid="+$(this).parent().parent().children("[name='depid']").text());
			
		});
		$("[name='modify']").click(function(){
			$("#list").load("departmentservlet?action=modify",{
				depid:$(this).parent().parent().children("[name='depid']").text(),
				name:$(this).parent().parent().children("[name='name']").text(),
				parentdepid:$(this).parent().parent().children("[name='parentdepid']").text(),
				type:$(this).parent().parent().children("[name='type']").text()==0?0:1,
				phone:$(this).parent().parent().children("[name='phone']").text(),
				established:$(this).parent().parent().children("[name='established']").text(),
			});
			
		});
	});
</script>
<script type="text/javascript">
	$('#established').datepicker({
		language : 'zh-CN' // as defined in bootstrap-datepicker.XX.js
	});
	$('#established').datepicker();
</script>