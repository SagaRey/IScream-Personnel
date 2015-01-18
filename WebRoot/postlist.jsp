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
						<input type="text" id="spostid" class="span3" pattern="[0-9]{4}" placeholder="PostID" value="${param.postid}">
						<input type="text" id="sname" class="span3" placeholder="PostName" value="${param.name}">
						<select class="span3" id="stype">
							<option value="-1">类型</option>
							<option value="0">管理</option>
							<option value="1">技术</option>
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
					<input type="checkbox" value="postid" checked>岗位编号</label>
				<label class="checkbox inline">
					<input type="checkbox" value="name" checked>岗位名称</label>
				<label class="checkbox inline">
					<input type="checkbox" value="type" checked>岗位类型</label>
				<label class="checkbox inline">
					<input type="checkbox" value="establishment" checked>编制人数</label>
			</div>
			<div class="accordion-inner">
				<label class="checkbox inline">
					<button type="button" class="btn btn-small btn-primary" id="add">增加</button></label>
				<label class="checkbox inline">
					<button type="button" class="btn btn-small" id="operation">操作</button></label>
				<label class="checkbox inline">
					<a class="btn btn-small btn-info" href="toexcelservlet?action=post" target="_blank">导出</a></label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="postid">岗位编号</th>
		<th name="name">岗位名称</th>
		<th name="type">岗位类型</th>
		<th name="establishment">编制人数</th>
		<th name="operation" class="hide">操作</th>
	</tr>
	<c:forEach var="post" items="${sessionScope.postlist}" >
	<tr>
		<td name="postid">${post.postid}</td>
		<td name="name">${post.name}</td>
		<td name="type">${post.type==0?"管理":"技术"}</td>
		<td name="establishment">${post.establishment}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.postpagingutil.totalPages}" step="1" >
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
			<h3>新岗位</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<label class="control-label" for="name"><i class="icon-text-height"></i>
				</label>
				<div class="controls">
					<input type="text" id="name" placeholder="岗位名称" autofocus="autofocus" title="必须填写岗位名称" required></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="type"><i class="icon-tags"></i>
				</label>
				<div class="controls">
					<select id="type">
						<option value="-1" >岗位类型</option>
						<option value="0" >管理</option>
						<option value="1" >技术</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="establishment"><i class="icon-user"></i>
				</label>
				<div class="controls">
					<input type="text" id="establishment" pattern="[0-9]{1,3}" placeholder="编制人数" required></div>
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
			$("#list").load("postservlet?action=querybycondition",{
				postid:$("#spostid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("postservlet?method=a&action=querybycondition&reqpage=${sessionScope.postpagingutil.pervPage}",{
				postid:$("#spostid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("postservlet?method=a&action=querybycondition&reqpage=${sessionScope.postpagingutil.nextPage}",{
				postid:$("#spostid").val(),
				name:$("#sname").val(),
				type:$("#stype").val()=='-1'?null:$("#stype").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("postservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				postid:$("#spostid").val(),
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
			$("#addmodal").modal({backdrop:true});
		});
		$("#addform").submit(function(){
			$("#list").load("postservlet?action=add",{
				name:$("#name").val(),
				type:$("#type").val()==0?0:1,
				establishment:$("#establishment").val(),
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
			$("#list").load("postservlet?action=remove&postid="+$(this).parent().parent().children("[name='postid']").text());
			
		});
		$("[name='modify']").click(function(){
			$("#list").load("postservlet?action=modify",{
				postid:$(this).parent().parent().children("[name='postid']").text(),
				name:$(this).parent().parent().children("[name='name']").text(),
				type:$(this).parent().parent().children("[name='type']").text()==0?0:1,
				establishment:$(this).parent().parent().children("[name='establishment']").text(),
			});
			
		});
	});
</script>