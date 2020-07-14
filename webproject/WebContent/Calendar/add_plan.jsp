<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="subject.*" import="java.util.ArrayList"
	import="subject.SubjectBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계획 추가하기</title>
</head>
<body>
	<H2>계획 추가</H2>
	<form method="post">
		<table width="250" border="1" align="center">
			<tr>
				<% 
            String date = request.getParameter("date");
            %>
				<td>날짜</td>
				<td><%=date %></td>
				<input type="hidden" name="day" value="<%=date%>">
			</tr>
			<tr>
				<td>과목</td>
				<td><select name="subject">
						<%
               SubjectDAO dao = new DBSubjectDAO();
                  ArrayList<String> SubjectList = dao.getAllSubject();
                  for (String sj : SubjectList) {
                    %>
						<option value=<%=sj%>><%=sj%></option>
						<%
               }
               %>
				</select></td>
			</tr>
			<tr>
				<td>챕터</td>
				<td><select name="chapter">
						<%
               for(int i=1;i<=15;i++){
                  %>
						<option value=<%=i%>><%=i%></option>
						<%
               }
               %>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" formaction="add_plan_success.jsp">추가</button>
			</tr>
		</table>
	</form>
</body>
</html>