<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="plan.*"%>
<%@ page import="board.*"%>


<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="chapter" class="board.BoardBean" scope="request" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   Calendar cal = Calendar.getInstance();

   String strYear = request.getParameter("year");
   String strMonth = request.getParameter("month");

   int year = cal.get(Calendar.YEAR);
   int month = cal.get(Calendar.MONTH);
   int date = cal.get(Calendar.DATE);

   if (strYear != null) {
      year = Integer.parseInt(strYear);
      month = Integer.parseInt(strMonth);

   } else {

   }
   //년도/월 셋팅
   cal.set(year, month, 1);

   int startDay = cal.getMinimum(java.util.Calendar.DATE);
   int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
   int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
   int newLine = 0;

   //오늘 날짜 저장.
   Calendar todayCal = Calendar.getInstance();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
   int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

%>
<html lang="ko">
<HEAD>
<TITLE>캘린더</TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript">
   function addPlan(sUseDate) { //캘린더에서 계획 추가 팝업띄우는 함수
      var url = "Calendar/add_plan.jsp?date="+sUseDate;
      var name = "addPlan";
      window.open(url, name, "width=300,height=300,toolbar=no,status=no,location=no,scrollbar=yes,menubar=no,resizable=no,left=50,right=50")
   }
</script>
</HEAD>
<BODY>
   <form name="calendarFrm" id="calendarFrm" action="" method="post">
      <DIV id="content" style="width: 1250px;">

         <table width="100%" border="0" cellspacing="1" cellpadding="1">
            <tr>
               <td align="right"><button type="button" style="border:0; background-color:transparent;"
                  onclick="javascript:location.href='<c:url value='main.jsp' />'"
                  value="오늘"><img src="/webproject/Calendar/today.png"></button></td>

            </tr>
         </table>
         <!--날짜 네비게이션  -->
         <table style="table-layout: fixed; font-size:24px; font-weight:bold"  width="100%" bgcolor="#CED99C" border="0" cellspacing="1"
            cellpadding="1" id="KOO"
            style="border: 1px solid #CED99C; font-weight: bold; font-size: 24px">

            <tr>
               <td height="60">

                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td height="10"></td>
                     </tr>

                     <tr>
                        <td align="center">
                           <%
    if (month > 1) {
 %> <a
                           href="<c:url value='main.jsp' />?year=<%=year%>&amp;month=<%=month - 1%>"
                           style='color: #606939; text-decoration: none' target="_self">
                              <b>&lt;</b> <!-- 이전달 -->
                        </a> <%
    } else {
 %> <a
                           href="<c:url value='main.jsp' />?year=<%=year-1%>&amp;month=<%=month + 11%>"
                           style='color: #606939; text-decoration: none' target="_self">
                              <b>&lt;</b>
                        </a> <%
    }
 %> &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월 &nbsp;&nbsp; <%
    if (month < 11) {
 %> <a
                           href="<c:url value='main.jsp' />?year=<%=year%>&amp;month=<%=month + 1%>"
                           style='color: #606939; text-decoration: none' target="_self"
                           sytle='text-decoration: none'> <!-- 다음달 --> <b>&gt;</b>
                        </a> <%
    } else {
       %> <a
                           href="<c:url value='main.jsp' />?year=<%=year+1%>&amp;month=<%=month - 11%>"
                           style='color: #606939; text-decoration: none' target="_self">
                              <!-- 다음달 --> <b>&gt;</b>
                        </a> <%
    }
 %>
                        </td>
                     </tr>
                  </table>

            </td>
            </tr>
         </table>
         <br>
         <table style="table-layout: fixed; word-break:break-all;" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
            <THEAD>

               <TR style="font-weight: bold" bgcolor="#FFFFFF"">

                  <TD width='200px'>
                     <DIV align="center">Sun</DIV>
                  </TD>
                  <TD width='200px'>
                     <DIV align="center">Mon</DIV>
                  </TD>
                  <TD width='200px'>
                     <DIV align="center">Tue</DIV>
                  </TD>
                  <TD width='200px'>
                     <DIV align="center">Wed</DIV>
                  </TD>
                  <TD width='200px'>
                     <DIV align="center">Thu</DIV>
                  </TD>
                  <TD width='200px'>
                     <DIV align="center">Fri</DIV>
                  </TD>
                  <TD width='200px'>
                     <DIV align="center">Sat</DIV>
                  </TD>

               </TR>

            </THEAD>
            <TBODY>
               <TR>
                  <%
                     //처음 빈공란 표시
                     for (int index = 1; index < start; index++) {
                        out.println("<TD >&nbsp;</TD>");
                        newLine++;
                     }

                     //캘린더의 각 날짜 셀 표시
                     for (int index = 1; index <= endDay; index++) {
                        String color = "";

                        if (newLine == 0) {         //일요일 셀
                           color = "RED";
                        } else if (newLine == 6) {   //토요일 셀
                           color = "#529dbc";
                        } else {
                           color = "BLACK";
                        }
                        ;

                        String sUseDate = Integer.toString(year);

                        sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
                              : Integer.toString(month + 1);
                        sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
                              : Integer.toString(index);

                        int iUseDate = Integer.parseInt(sUseDate);

                        String backColor = "#FFFFFF";
                        if (iUseDate == intToday) {
                           backColor = "#f0f0f0";
                           color = "#f0f0f0";   //오늘 날짜 색깔
                        }
                        out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
                  %>
                  <font color='<%=color%>'> <a href='javascript:void(0)'
                     style='color: black; text-decoration: none'
                     onClick='addPlan(<%=sUseDate%>);'><%=index%></a>
                  </font>
                  <%
                     out.println("<BR>");
                        //String형 day변수를 sqlDate형으로 변환      
                        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
                        java.util.Date parsed = null;
                        try {
                              parsed = format.parse(sUseDate);
                        } catch (ParseException e1) {
                             // TODO Auto-generated catch block
                            e1.printStackTrace();
                        }
                        java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
                        PlanDAO planDao = new DBPlanDAO();
                        BoardDAO boardDao = new DBBoardDAO();
                        ArrayList<PlanBean> planList = planDao.getPlans(sqlDate);
                        
                        //각각의 날짜 셀에 해당하는 계획목록 표시 
                        for(int i=0;i<planList.size();i++){
                           BoardBean searchBoard = new BoardBean();
                           searchBoard.setSubject(planList.get(i).getSubject());
                           searchBoard.setChapter(planList.get(i).getChapter());
                           searchBoard = boardDao.searchOneBoard(searchBoard);
                           //board = boardDao.getBoard(planList.get(i).getChapter());
                           if (searchBoard.getIdx()==0){   //각 계획 클릭 시 해당 계획에 대한 게시글이 없으면 글쓰기창 띄우고
                           %>
                  <a
                     href="main.jsp?mode=write&subject=<%=planList.get(i).getSubject()%>&chapter=<%=planList.get(i).getChapter()%>"
                     style='color: #CED99C; text-decoration: none'> <% 
                           }
                           else {   //각 계획 클릭 시 해당 계획에 대한 게시글이 있으면 게시글 보여주기
                           %>
                  </a>
                  <a href="main.jsp?mode=page&idx=<%=searchBoard.getIdx() %> "
                     style='color: #93C54B; font-weight: bold; text-decoration: none'>
                     <% 
                           }
                           out.print(planList.get(i).getSubject()+" "+planList.get(i).getChapter()+"<BR>");
                        %>
                  </a>
                  <%      
                        }
                        
                        out.println("<BR>");

                        //기능 제거   
                        out.println("</TD>");
                        newLine++;

                        if (newLine == 7) {
                           out.println("</TR>");
                           if (index <= endDay) {
                              out.println("<TR>");
                           }
                           newLine = 0;
                        }
                        
                     } //캘린더 각 날짜 셀 표시 끝
                     
                     
                     //마지막 공란 LOOP
                     while (newLine > 0 && newLine < 7) {
                        out.println("<TD>&nbsp;</TD>");
                        newLine++;
                     }
                     %>

               </TR>

            </TBODY>
         </TABLE>
      </DIV>
   </form>
</BODY>
</HTML>