<%@ page contentType="application/msexcel" import="java.util.*,com.iscream.po.DimissionInfo" pageEncoding="UTF-8"%>
 
<%
   response.setHeader("Content-disposition","inline;filename=dimission.xls");
%>
<html>
<head>
<title>Excel</title>
</head>
<body>
 <table>
	<tr>
	    <th>id</th>
	    <th>empid</th>
	    <th>empname</th>
	    <th>dimissiondate</th>
	    <th>depid</th>
		<th>depname</th>
		<th>postid</th>
		<th>postname</th>
		<th>type</th>
		<th>istalent</th>
	</tr>
	<%
		List<DimissionInfo> list = (List<DimissionInfo>) request.getSession().getAttribute("dimissioninfolist");
		if (null == list) {
			out.println("没有任何数据");
		} else {
			int i = 1;
			for (DimissionInfo dim : list) {
	%>
	<tr>
		<td><%=dim.getId()%></td>
		<td><%=dim.getEmpid()%></td>
		<td><%=dim.getEmpname()%></td>
		<td><%=dim.getDimissiondate()%></td>
		<td><%=dim.getEmpid()%></td>
		<td><%=dim.getDepname()%></td>
		<td><%=dim.getPostid()%></td>
		<td><%=dim.getPostname()%></td>
		<td><%=dim.getType()%></td>
		<td><%=""+dim.isIstalent()+""%></td>
	</tr>
	<%
		}
		}
	%>
	</table>
</body>
</html>