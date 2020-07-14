<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>계획이 추가되었습니다.</title>
</head>
<%
   request.setCharacterEncoding("utf-8");
   String jdbc_driver = "com.mysql.jdbc.Driver";
   String jdbc_url = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf8&serverTimezone=UTC";
   Class.forName(jdbc_driver);
   Connection conn = DriverManager.getConnection(jdbc_url, "root", "kgu123");
   
   String sql = "insert into plan_table values(?,?,?)";
   PreparedStatement stmt = conn.prepareStatement(sql);

%>
<body>
	<h2>계획이 추가되었습니다.</h2>
	날짜:
	<%=request.getParameter("day") %><br> 과목:
	<%=request.getParameter("subject") %><br> 챕터:
	<%=request.getParameter("chapter") %><br>
	<%
      stmt.setString(1, request.getParameter("day"));
      stmt.setString(2, request.getParameter("subject"));
      stmt.setString(3, request.getParameter("chapter"));
      stmt.executeUpdate();
      stmt.close();
      conn.close();
   %>
	계획이 추가되었습니다.
	<br>
	<a href="javascript:self.close(); window.opener.location.reload()">닫기</a>
</body>
</html>