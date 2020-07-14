<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="board.BoardBean" import="subject.*"
   import="java.util.ArrayList"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
   // 자바 스크립트 시작 
   function writeCheck() {
      var form = document.writeform;
      if (!form.subject.value) {
         alert("과목을 선택해주세요"); // 경고창 띄움 
         form.subject.focus(); // form 에 있는 name 위치로 이동 
         return;
      }

      if (!form.chapter.value) {
         alert("챕터를 선택해주세요");
         form.chapter.focus();
         return;
      }
      if (!form.password.value) {
         alert("비밀번호를 적어주세요");
         form.password.focus();
         return;
      }

      if (!form.content.value) {
         alert("내용을 적어주세요");
         form.content.focus();
         return;
      }
      form.submit();
   }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>게시판</title>
</head>
<body>
   <table>
      <form name=writeform method="post"
         action="/webproject/main.jsp?mode=add">
         <tr>
            <td>
               <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tr>
                     <td>글쓰기</td>
                     <% 
                     String subject = request.getParameter("subject");
                     String chapter = request.getParameter("chapter");
                     %>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td>&nbsp;</td>
                     <td align="center">과목</td>
                     <td><%=subject %></td>
                     <input type="hidden" name="subject" value="<%=subject%>">            
                     <td>&nbsp;</td>
                  </tr>
                  <tr height="1" bgcolor="#dddddd">
                     <td colspan="4"></td>
                  </tr>
                  <tr>
                     <td>&nbsp;</td>
                     <td align="center">챕터</td>
                     <td><%=chapter %></td>
                     <input type="hidden" name="chapter" value="<%=chapter%>">
                     <td>&nbsp;</td>
                  </tr>
                  <tr height="1" bgcolor="#dddddd">
                     <td colspan="4"></td>
                  </tr>

                  <tr height="1" bgcolor="#dddddd">
                     <td colspan="4"></td>
                  </tr>
                  <tr>
                     <td>&nbsp;</td>
                     <td align="center">비밀번호</td>
                     <td><input type="password" name="password" size="50"
                        maxlength="50"></td>
                     <td>&nbsp;</td>
                  </tr>

                  <tr>
                     <td>&nbsp;</td>
                     <td align="center">내용</td>
                     <td><textarea name="content" cols="50" rows="13"></textarea></td>
                     <td>&nbsp;</td>
                  </tr>
                  <tr height="1" bgcolor="#dddddd">
                     <td colspan="4"></td>
                  </tr>
                  <tr height="1" bgcolor="#82B5DF">
                     <td colspan="4"></td>
                  </tr>
                  <tr align="center">
                     <td>&nbsp;</td>
                     <td colspan="2"><input type=button value="등록"
                        OnClick="javascript:writeCheck();"> <input type=button
                        value="취소" OnClick="javascript:history.back(-1)">
                     <td>&nbsp;</td>
                  </tr>
               </table>
            </td>
         </tr>
      </form>
   </table>
</body>
</html>
