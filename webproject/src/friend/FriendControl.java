package friend;

import java.io.IOException;

import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FriendControl2
 */
@WebServlet("/FriendControl")
public class FriendControl extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public FriendControl() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      // response.getWriter().append("Served at: ").append(request.getContextPath());
      doPost(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      FriendDAO dao = new DBFriendDAO();
      String address = null;
      HttpSession session = request.getSession();
      request.setCharacterEncoding("utf-8");

      String action = request.getParameter("action");
      if (action == null || action.equals("friendlist")) {
         ArrayList<FriendBean> list = dao.getAllFriend();
         request.setAttribute("friendlist", list);
         address = "/Friend/friend_list.jsp";

      } else if (action.equals("friendadd")) {
         FriendBean Friend = new FriendBean();
         session = request.getSession();
         String s = (String) (session.getAttribute("logininfo"));

         Friend.setMyId(s);
         Friend.setFriendId(request.getParameter("addfriendId"));
         if (dao.checkFriend(Friend)) {
            dao.addFriend(Friend);
            request.setAttribute("Friend", Friend);
            address = "/Friend/friend_add.jsp";
            
         } else {
            System.out.println("존재하지않는 아이디입니다.");            
            address = "/Friend/popup_false.jsp";
         }
         

      } else if (action.equals("frienddelete")) {

         FriendBean Friend = new FriendBean();
         session = request.getSession();
         String s = (String) (session.getAttribute("logininfo"));

         Friend.setMyId(s);
         Friend.setFriendId(request.getParameter("deletefriendId"));
         if (dao.checkFriend(Friend)) {
            dao.deleteFriend(Friend);
            request.setAttribute("Friend", Friend);
            address = "/Friend/friend_delete.jsp";
            
         } else {
            System.out.println("존재하지않는 아이디입니다.");            
            address = "/Friend/popup_false.jsp";
         }

      }
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
   }

}