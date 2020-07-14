<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String mode = request.getParameter("mode");
	String jsp = "";
	if (mode.equals("list_all")){
		jsp="BoardControl?action=list";
	}
	else if (mode.equals("list_mine")){
		jsp="BoardControl?action=mylist";
	}
	else if (mode.equals("list_fr")){
		jsp="BoardControl?action=friendlist";
	}
	
	else if (mode.equals("write")){
		jsp="BoardControl?action=write";
	}
	else if (mode.equals("page")){	//
		jsp="BoardControl?action=view";
	}
	else if (mode.equals("mypage")){	//
		jsp="BoardControl?action=myview";
	}
	else if (mode.equals("delete")){	//
		jsp="BoardControl?action=delete";
	}
	else if (mode.equals("add")){	//
		jsp="BoardControl?action=add";
	}
	else if (mode.equals("remove")){	//
		jsp="BoardControl?action=remove";
	}
	else if (mode.equals("modify")){	//
		jsp="BoardControl?action=modify";
	}
	else if (mode.equals("edit")){	//
		jsp="BoardControl?action=edit";
	}
	else if (mode.equals("board_search")){	//
		jsp="BoardControl?action=search";
	}
	else if (mode.equals("myboard_search")){	//
		jsp="BoardControl?action=mysearch";
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

