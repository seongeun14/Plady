<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="friend.FriendBean"%>
<jsp:useBean id="friendlist" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="Friend" class="friend.FriendBean" scope="request" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Login</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

  <body class="bg-dark">
    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">친구 추가</div>
        <div class="card-body">
        
          <form method="post" action="/webproject/main.jsp">
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" name="addfriendId" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
                <label for="inputEmail"></label>
              </div>
            </div>      
            <input type="hidden" name="mode" value="friendadd">
            <button class="btn btn-primary btn-block" type="submit" name="Submitadd">Add</button>
          </form>
          <div class="text-center">
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

 </body>
</html>