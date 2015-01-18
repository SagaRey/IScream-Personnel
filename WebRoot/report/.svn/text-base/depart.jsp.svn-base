<%@ page contentType="application/msexcel" import="java.util.*,com.iscream.po.DepartmentInfo" pageEncoding="UTF-8"%>
 
<%
   response.setHeader("Content-disposition","inline;filename=departments.xls");
%>
<html>
<head>
<title>Excel</title>
</head>
<body>
<table>
	<tr>
		<th>depid</th>
		<th>name</th>
		<th>parentdepid</th>
		<th>parentdepname</th>
		<th>type</th>
		<th>phone</th>
		<th>established</th>
	</tr>


	<%
		List<DepartmentInfo> list = (List<DepartmentInfo>) request.getSession().getAttribute("departmentinfolist");
		if (null == list) {
			out.println("没有任何数据");
		} else {
			int i = 1;
			for (DepartmentInfo dep : list) {
	%>
	<tr>
		<td><%=dep.getDepid()%></td>
		<td><%=dep.getName()%></td>
		<td><%=dep.getParentdepid()%></td>
		<td><%=dep.getParentdepname()%></td>
		<td><%=dep.getType()%></td>
		<td><%=dep.getPhone()%></td>
		<td><%=dep.getEstablished()%></td>
	</tr>
	<%
		}
		}
	%>
	</table>
 
</body>
</html>