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
						<input type="text" id="sname" class="span3" placeholder="Name" value="${param.name}">
						<span class="span7"></span>
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
					<input type="checkbox" value="name" checked>员工姓名</label>
				<label class="checkbox inline">
					<input type="checkbox" value="sex" checked>性别</label>
				<label class="checkbox inline">
					<input type="checkbox" value="birthday" checked>生日</label>
				<label class="checkbox inline">
					<input type="checkbox" value="identity" checked>身份证</label>
				<label class="checkbox inline">
					<input type="checkbox" value="nativeplace" checked>籍贯</label>
				<label class="checkbox inline">
					<input type="checkbox" value="phone" checked>电话</label>
				<label class="checkbox inline">
					<input type="checkbox" value="email" checked>邮箱</label>
			</div>
		</div>
	</div>
</div>
<table class="table table-striped table-hover">
	<tr>
		<th name="id">编号</th>
		<th name="name">员工姓名</th>
		<th name="sex">性别</th>
		<th name="birthday">生日</th>
		<th name="identity">身份证</th>
		<th name="nativeplace">籍贯</th>
		<th name="phone">电话</th>
		<th name="email">邮箱</th>
	</tr>
	<c:forEach var="tal" items="${requestScope.talentlist}" >
	<tr>
		<td name="id">${tal.id}</td>
		<td name="name">${tal.name}</td>
		<td name="sex">${tal.sex}</td>
		<td name="birthday">${tal.birthday}</td>
		<td name="identity">${tal.identity}</td>
		<td name="nativeplace">${tal.nativeplace}</td>
		<td name="phone">${tal.phone}</td>
		<td name="email">${tal.email}</td>
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
				<c:forEach var="i" begin="1" end="${sessionScope.talentpagingutil.totalPages}" step="1" >
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
<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			$("#list").load("talentservlet?action=querybycondition",{
				name:$("#sname").val(),
			});
		});
		$("#prevpage").click(function(){
			$("#list").load("talentservlet?method=a&action=querybycondition&reqpage=${sessionScope.talentpagingutil.pervPage}",{
				name:$("#sname").val(),
			});
		});
		$("#nextpage").click(function(){
			$("#list").load("talentservlet?method=a&action=querybycondition&reqpage=${sessionScope.talentpagingutil.nextPage}",{
				name:$("#sname").val(),
			});
		});
		$("[name='page']").click(function(){
			$("#list").load("talentservlet?method=a&action=querybycondition&reqpage="+$(this).text(),{
				name:$("#sname").val(),
			});
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$("[type='checkbox']").click(function(){
			$("[name="+$(this).val()+"]").toggle();
		});
	});
</script>