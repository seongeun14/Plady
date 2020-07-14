<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	text-align: center;
}
</style>
<title>Login form</title>
</head>
<body>
	<form method="post" action="/webproject/UserControl">
		<table width="300" border="1" align="center">
			<H3>study planner calendar</H3>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" size="10"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd" size="10"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" formaction="join_form.jsp">회원가입</button>
					<input type = "hidden" name="action" value="login">
					<input type="submit" name="Submit" value="로그인">
			</tr>
		</table>
	</form>
</body>
</html>