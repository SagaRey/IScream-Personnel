<%@ page contentType="application/msexcel" import="java.util.*,com.iscream.po.Post" pageEncoding="UTF-8"%>
 
<%
   response.setHeader("Content-disposition","inline;filename=posts.xls");
%>
<html>
<head>
<title>Excel</title>
</head>
<body>
<table>
	<tr>
		<th>postid</th>
		<th>name</th>
		<th>type</th>
		<th>establishment</th>
	</tr>


	<%
		List<Post> list = (List<Post>)request.getSession().getAttribute("postlist");
		if (null == list) {
			out.println("没有任何数据");
		} else {
			int i = 1;
			for (Post po : list) {
	%>
	<tr>
		<td><%=po.getPostid()%></td>
		<td><%=po.getName()%></td>
		<td><%=po.getType()%></td>
		<td><%=po.getEstablishment()%></td>
	</tr>
	<%
		}
		}
	%>
	</table>
</body>
</html>