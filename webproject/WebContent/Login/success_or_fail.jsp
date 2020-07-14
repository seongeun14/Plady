<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안내 메세지</title>
</head>
<body>
	<%
		if (request.getAttribute("s_or_f")=="login_fail") {
			out.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요.'); location.href='UI_Login/login_form.jsp'</script>");
		} 
		else if (request.getAttribute("s_or_f")=="login_success") {
			out.println("<script>alert('로그인 되었습니다.'); location.href='/webproject/main.jsp'</script>");
		} 
		else if (request.getAttribute("s_or_f")=="join_success") {
			out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='UI_Login/login_form.jsp'</script>");
		} 
		else
			out.println("<script>alert('이미 존재하는 아이디입니다.'); location.href='UI_Login/join_form.jsp'</script>");
	%>
</body>
</html>