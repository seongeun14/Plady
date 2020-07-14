package board;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BoardControl
 */
@WebServlet("/BoardControl")
public class BoardControl extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardControl() {
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
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardDAO dao = new DBBoardDAO();
		String address = null;
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
		if (action == null || action.equals("list")) {
			ArrayList<BoardBean> list = dao.getAllBoard();
			request.setAttribute("boardlist", list);
			address = "/Board/board_list.jsp";
		} else if (action.equals("mylist")) {
			String name = (String) session.getAttribute("logininfo");
			ArrayList<BoardBean> list = dao.getMyBoard(name);
			request.setAttribute("mylist", list);
			address = "/Board/board_mylist.jsp";
		} else if (action.equals("friendlist")) {
			String name = (String)request.getParameter("id");
			ArrayList<BoardBean> list = dao.getMyBoard(name);
			request.setAttribute("friendlist", list);
			address = "/Board/board_friendlist.jsp";
		} else if (action.equals("view")) {
			BoardBean board = dao.getBoard(request.getParameter("idx"));
			request.setAttribute("board", board);
			address = "/Board/board_view.jsp";
		} else if (action.equals("myview")) {
			BoardBean board = dao.getBoard(request.getParameter("idx"));
			request.setAttribute("board", board);
			address = "/Board/board_view.jsp";
		} else if (action.equals("search")) {
			BoardBean board = new BoardBean();
			String s = request.getParameter("option");
			System.out.println(s);
			System.out.println(request.getParameter("text"));
			if (s.equals("subject")) {
				board.setSubject(request.getParameter("text"));
			}
			if (s.equals("writer")) {
				board.setName(request.getParameter("text"));
			}
			if (s.equals("content")) {
				board.setContent(request.getParameter("text"));
			}
			ArrayList<BoardBean> list = dao.searchBoard(board);
			request.setAttribute("boardlist", list);
			address = "/Board/board_list.jsp";

		} else if (action.equals("mysearch")) {
			BoardBean board = new BoardBean();
			String s = request.getParameter("option");

			if (s.equals("subject")) {
				board.setSubject(request.getParameter("text"));
			}
			if (s.equals("content")) {
				board.setContent(request.getParameter("text"));
			}
			board.setName((String) session.getAttribute("logininfo"));
			System.out.println("controller 에 mysearch");
			System.out.println(board.getName());
			ArrayList<BoardBean> list = dao.mysearchBoard(board);
			request.setAttribute("mylist", list);
			address = "/Board/board_mylist.jsp";
		} else if (action.equals("add")) {
			BoardBean board = new BoardBean();
			String name = (String) session.getAttribute("logininfo");
			board.setSubject(request.getParameter("subject"));
			board.setChapter(request.getParameter("chapter"));
			board.setPassword(request.getParameter("password"));
			board.setName(name);
			board.setContent(request.getParameter("content"));
			dao.addBoard(board);
			request.setAttribute("board", board);
			address = "/Board/content_save.jsp";
		} else if (action.equals("remove")) {
			Boolean tf;
			String idx = request.getParameter("idx");
			String pass = request.getParameter("password");
			tf = dao.delBoard(idx, pass);
			if (tf)
				address = "/Board/delete_success.jsp";
			else
				address = "/Board/delete_fail.jsp";
		} else if (action.equals("edit")) {
			BoardBean board = dao.getBoard(request.getParameter("idx"));
			request.setAttribute("board", board);
			Boolean tf;
			String idx = request.getParameter("idx");
			String pass = request.getParameter("password");
			String sub = request.getParameter("subject");
			String chp = request.getParameter("chapter");
			String cont = request.getParameter("content");
			tf = dao.modBoard(idx, pass, sub, chp, cont);
			if (tf)
				address = "/Board/modify_success.jsp";
			else
				address = "/Board/modify_fail.jsp";
		} else if (action.equals("modify")) {
			BoardBean board = dao.getBoard(request.getParameter("idx"));
			request.setAttribute("board", board);
			address = "/Board/board_modify.jsp";
		} else if (action.equals("delete")) {
			BoardBean board = dao.getBoard(request.getParameter("idx"));
			request.setAttribute("board", board);
			address = "/Board/board_delete.jsp";
		} else if (action.equals("write")) {
			address = "/Board/board_write.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

}