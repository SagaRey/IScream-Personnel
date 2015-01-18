<%@ page contentType="application/msexcel" import="java.util.*,com.iscream.po.MobilizeDepInfo" pageEncoding="UTF-8"%>
 
<%
   response.setHeader("Content-disposition","inline;filename=mobdep.xls");
%>
<html>
<head>
<title>Excel</title>
</head>
<body>
 <table id="tableExcel">
	<tr>
	    <th>id</th>
	    <th>empid</th>
	    <th>empname</th>
	    <th>originaldepid</th>
	    <th>originaldepname</th>
		<th>currentdepid</th>
		<th>currentdepname</th>
		<th>mobilizedate</th>
		<th>type</th><br>
	</tr>
	<%
		List<MobilizeDepInfo> list = (List<MobilizeDepInfo>) request.getSession().getAttribute("mobilizedepinfolist");
		if (null == list) {
			out.println("没有任何数据");
		} else {
			int i = 1;
			for (MobilizeDepInfo tmp : list) {
	%>
	<tr>
	    <td><%=tmp.getId()%></td>
		<td><%=tmp.getEmpid()%></td>
		<td><%=tmp.getEmpname()%></td>
		<td><%=tmp.getOriginaldepid()%></td>
		<td><%=tmp.getOriginaldepname()%></td>
		<td><%=tmp.getCurrentdepid()%></td>
		<td><%=tmp.getCurrentdepname()%></td>
		<td><%=tmp.getMobilizedate()%></td>
		<td><%=tmp.getType()%></td>
	</tr>
	<%
		}
		}
	%>
	</table>
</body>
</html>