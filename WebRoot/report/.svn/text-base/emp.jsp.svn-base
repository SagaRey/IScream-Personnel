<%@ page contentType="application/msexcel" import="java.util.*,com.iscream.po.EmployeeInfo" pageEncoding="UTF-8"%>
 
<%
   response.setHeader("Content-disposition","inline;filename=employees.xls");
%>
<html>
<head>
<title>Excel</title>
</head>
<body>
<table>
	<tr>
		<th>empid</th>
		<th>name</th>
		<th>sex</th>
		<th>type</th>
		<th>birthday</th>
		<th>identity</th>
		<th>depid</th>
		<th>depname</th>
		<th>postid</th>
		<th>postname</th>
		<th>hiredate</th>
		<th>nativeplace</th>
		<th>phone</th>
		<th>email</th>
	</tr>
	<%
		List<EmployeeInfo> list = (List<EmployeeInfo>) request.getSession().getAttribute("employeeinfolist");
		if (null == list) {
			out.println("没有任何数据");
		} else {
			int i = 1;
			for (EmployeeInfo emp : list) {
	%>
	<tr>
		<td><%=emp.getEmpid()%></td>
		<td><%=emp.getName()%></td>
		<td><%=emp.getSex()%></td>
		<td><%=emp.getType()%></td>
		<td><%=emp.getBirthday()%></td>
		<td><%=emp.getIdentity()%></td>
		<td><%=emp.getDepid()%></td>
		<td><%=emp.getDepname()%></td>
		<td><%=emp.getPostid()%></td>
		<td><%=emp.getPostname()%></td>
		<td><%=emp.getHiredate()%></td>
		<td><%=emp.getNativeplace()%></td>
		<td><%=emp.getPhone()%></td>
		<td><%=emp.getEmail()%></td>
	</tr>
	<%
		}
		}
	%>
	</table>
</body>
</html>