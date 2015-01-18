<%@ page contentType="application/msexcel" import="java.util.*,com.iscream.po.MobilizePostInfo" pageEncoding="UTF-8"%>
<%
   response.setHeader("Content-disposition","inline;filename=mobpost.xls");
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
		<th>originalpostid</th>
		<th>originalpostname</th>
		<th>currentpostid</th>
		<th>currentpostname</th>
		<th>mobilizedate</th>
		<th>type</th>
	</tr>
	<%
		List<MobilizePostInfo> list = (List<MobilizePostInfo>) request.getSession().getAttribute("mobilizepostinfolist");
		if (null == list) {
			out.println("没有任何数据");
		} else {
			int i = 1;
			for (MobilizePostInfo mob : list) {
	%>
	<tr>
		<td><%=mob.getId()%></td>
		<td><%=mob.getEmpid()%></td>
		<td><%=mob.getEmpname()%></td>
		<td><%=mob.getOriginalpostid()%></td>
		<td><%=mob.getOriginalpostname()%></td>
		<td><%=mob.getCurrentpostid()%></td>
		<td><%=mob.getCurrentpostname()%></td>
		<td><%=mob.getMobilizedate()%></td>
		<td><%=mob.getType()%></td>
	</tr>
	<%
		}
		}
	%>
	</table>
</body>
</html>