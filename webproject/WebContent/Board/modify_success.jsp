<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="board.BoardBean" scope="request" />

<script language=javascript>
	self.window.alert("글이 수정되었습니다.");
	location.href = "javascript:history.go(-3); javascript:history.go(0)";
</script>


