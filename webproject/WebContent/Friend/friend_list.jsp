<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="friend.FriendBean"%>
<jsp:useBean id="friendlist" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="Friend" class="friend.FriendBean" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Study Calendar</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
             	친구 목록</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>친구 아이디</th>
                    </tr>
                  </thead>
                  <tbody>
     <%
				if (friendlist.size() == 0) {
			%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 친구가 없습니다.</td>
		</tr>
		<%
				}
			%>
	<%
	for (int i = 0; i < friendlist.size(); i++) {

		session = request.getSession();

		FriendBean friend = (FriendBean) friendlist.get(i);
		String s = (String) (session.getAttribute("logininfo"));
		String friendname = friend.getFriendId();
		
		if (s.equals(friend.getMyId())) {
			
%>
<tr>
<td><a href="/webproject/main.jsp?mode=list_fr&id=<%=friendname%>"  style='color:black; text-decoration:none;'><%=friend.getFriendId()%></a></td>
</tr>




<%
	}
	}
%>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>


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

