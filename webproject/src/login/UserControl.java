package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserControl")
public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = new DBUserDAO();
		String address = "/Login/success_or_fail.jsp";
		String s_or_f = null;
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		if(action.equals("add")) {   
			UserBean user = new UserBean(); 
			user.setUserid(request.getParameter("userid"));
			user.setPasswd(request.getParameter("passwd"));
			if(dao.checkUser_join(user)) {  //만약 같은 아이디가 없을 때
				dao.addUser(user);  //회원가입 성공
				s_or_f = "join_success";
				request.setAttribute("s_or_f", s_or_f);
			}
			else { //회원가입 실패
				s_or_f = "join_fail";
				request.setAttribute("s_or_f", s_or_f);
			}
		}
		else if(action.equals("login")) {
			UserBean user = new UserBean(); 
			user.setUserid(request.getParameter("userid"));
			user.setPasswd(request.getParameter("passwd"));
			if(dao.checkUser_login(user)) {  //만약 같은 아이디가 있을 때, 아이디와 비밀번호가 일치할 때
				session.setAttribute("logininfo", user.getUserid());
				s_or_f = "login_success";
				request.setAttribute("s_or_f", s_or_f);
			}
			//request.setAttribute("user", user);
			else { //로그인 실패
				s_or_f = "login_fail";
				request.setAttribute("s_or_f", s_or_f);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);  //주소 보냄
		dispatcher.forward(request,  response);
	}

}
