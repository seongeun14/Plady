<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {text-align:center;}
</style>
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf8&serverTimezone=UTC";
	Class.forName(jdbc_driver);
	Connection conn = DriverManager.getConnection(jdbc_url, "root", "kgu123");
	
	Statement stmt = conn.createStatement();
	String sql = "select id, passwd from member_table";
	ResultSet rs = stmt.executeQuery(sql);
	
%>
<body>
<H2>회원목록</H2>
	<table border="1">
		<tr>
			<th>id</th>
			<th>password</th>
		</tr>
		<%
			while(rs.next()){
				String tmp;
				tmp = rs.getString("id");
		%>
		<tr>
			<td><% out.println(tmp); %></td>
			<td><%=rs.getString("passwd") %></td>
		</tr>
		<%
			}
			rs.close();
			stmt.close();
			conn.close();
		%>
	</table>
</body>
</html>