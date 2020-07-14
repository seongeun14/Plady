<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   String mode = request.getParameter("mode");
   String jsp = "";
   if (mode.equals("friendlist")){
      jsp="FriendControl?action=friendlist";
   }
   
   else if (mode.equals("friendadd")){
      jsp="FriendControl?action=friendadd";
   }
   //else if (mode.contains("page")){   //
   //   jsp="FriendControl?action=view";
   //}
   else if (mode.contains("frienddelete")){   //
      jsp="FriendControl?action=frienddelete";
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   <jsp:include page="<%=jsp%>"></jsp:include>
</body>
</html>
