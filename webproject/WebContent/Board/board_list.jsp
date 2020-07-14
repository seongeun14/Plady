<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.BoardBean"%>
<jsp:useBean id="boardlist" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
</head>
<body>
	<h3 align="center">전체 게시물</h3>
	<table border="0" width="100%" cellpadding="4" cellspacing="0">
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>

		<tr height="5">
			<td width="100">번호</td>
			<td width="120">과목</td>
			<td width="100">차시</td>
			<td width="100">작성자</td>
			<td width="100">날짜</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF" height="10">
			<td colspan="6"></td>
		</tr>
		<%
			if (boardlist.size() == 0) {
		%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 글이 없습니다.</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<%
			}
		%>

		<%
			for (int i = 0; i < boardlist.size(); i++) {
				BoardBean board = (BoardBean) boardlist.get(i);
		%>
		<tr height="25" align="left">

			<td align="left"><%=board.getIdx()%>
			<td align="left"><a
				href="main.jsp?mode=page&idx=<%=board.getIdx()%>"> <%=board.getSubject()%></a></td>

			<td align="left"><%=board.getChapter()%></td>

			<td align="left"><%=board.getName()%></td>
			<td align="left"><%=board.getDay()%></td>
			<td>&nbsp;</td>

		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<%
			}
		%>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>

		</ul>
	</div>


	<form method="post" action="/webproject/main.jsp">
		<table>
			<tr>
				<td><select name="option">
						<option>subject</option>
						<option>writer</option>
						<option>content</option>
				</select></td>

				<td><input type="text" name="text" size="50"></td>
				<td colspan="2"><input type="hidden" name="mode"
					value="board_search"> <input type="submit" name="search"
					value="검색">
				
			</tr>
		</table>
	</form>

</body>
</html>