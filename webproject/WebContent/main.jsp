<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
	String mode = request.getParameter("mode");
	String jsp = "";
	if (mode == null) {
		mode = "calendar";
	}
	if(mode.equals("calendar")){
		jsp="/Calendar/calendar.jsp";
	}
	else if(mode.contains("friend")){
		jsp="/friend.jsp";
	}
	else {
		jsp="/board.jsp";
		//글쓰기,게시글 보기 등 게시글과 관련된 모든 페이지는 board.jsp에서 처리.
		//main.jsp에서 BoardControl로 주소지정을 하면 카테고리가 지워져서 따로 jsp를 만든것입니다.
		//(board_list의 경우는 게시물 나열 틀만 가진 페이지이기 때문에 데이터가 들어간 페이지가 아님.)
	}
%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Dashboard</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="main.jsp">Study Calendar</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        
      </form>

      <!-- Navbar -->

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
     
     <div class="card text-white bg-secondary mb-3" style="max-width: 20rem;">
  		<div class="card-header">My Info</div>
  			<div class="card-body">
    		<h4 class="card-title"><%=session.getAttribute("logininfo") %></h4>
    		<p class="card-text">님 안녕하세요.</p>
  		</div>
	</div>
     
        <li class="nav-item active">
          <a class="nav-link" href="main.jsp?mode=calendar">
            <span>내 캘린더</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span>내 친구</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">친구 관리</h6>
            <a class="dropdown-item" href="friend_add.jsp">친구 추가</a>
            <a class="dropdown-item" href="friend_del.jsp">친구 삭제</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="main.jsp?mode=friendlist">친구 목록</a>
          </div>
        </li> 
        
        <li class="nav-item">
          <a class="nav-link" href="main.jsp?mode=list_all">
            <span>전체 게시글</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="main.jsp?mode=list_mine">
            <span>내 게시글</span></a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/webproject/Login/login_out.jsp">
            <span>Logout</span></a>
        </li>
     
      
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">
        
		  <!-- 화면 띄우는 곳 -->
          
          <jsp:include page="<%=jsp%>"></jsp:include>
          

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

  </body>

</html>
