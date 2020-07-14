package board;

import java.sql.*;
import java.util.ArrayList;

public class DBBoardDAO implements BoardDAO {
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf8&serverTimezone=UTC";
	private Connection conn;
	private Statement stmt;

	private void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "kgu123");
			stmt = conn.createStatement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
	}

	private void disconnect() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}

	}

	public boolean modBoard(String idx, String pass, String sub, String chp, String cont) {
		String password = null;
		Boolean tf = false;
		String sql = "SELECT PASSWORD FROM content_table WHERE idx=" + idx;
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			password = rs.getString(1);

			if (password.equals(pass)) {
				sql = "UPDATE content_table SET subject='" + sub + "' ,chapter='" + chp + "' ,content='" + cont
						+ "' WHERE idx=" + idx;
				stmt.executeUpdate(sql);
				tf = true;
			}
			disconnect();
		} catch (Exception e) {
		}

		return tf;
	}

	public boolean delBoard(String idx, String pass) {
		String password = null;
		Boolean tf = false;
		String sql = "SELECT PASSWORD FROM content_table WHERE idx=" + idx;
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			password = rs.getString(1);

			if (password.equals(pass)) {
				sql = "DELETE FROM content_table WHERE idx=" + idx;
				stmt.executeUpdate(sql);
				tf = true;
			}
			disconnect();
		} catch (Exception e) {
		}

		return tf;
	}

	 @Override
	   public BoardBean searchOneBoard(BoardBean board) {
	      String sqlList = "select idx, subject, chapter, password, name, day, content from content_table where subject like'%"
	              + board.getSubject() + "%' and chapter like '%" + board.getChapter() + "%'";
	        System.out.println(sqlList);
	        BoardBean result = new BoardBean();
	        try {
	           connect();
	           ResultSet rs = stmt.executeQuery(sqlList);
	           while (rs.next()) {
	              BoardBean searched_board = new BoardBean();
	              searched_board.setIdx(rs.getInt("idx"));
	              searched_board.setSubject(rs.getString("subject"));
	              searched_board.setChapter(rs.getString("chapter"));
	              searched_board.setPassword(rs.getString("password"));
	              searched_board.setName(rs.getString("name"));
	              searched_board.setDay(rs.getDate("day"));
	              searched_board.setContent(rs.getString("content"));
	              result = searched_board;
	           }
	           rs.close();
	           disconnect();
	        } catch (Exception e) {
	        }
	        return result;

	   }
	
	@Override
	public ArrayList<BoardBean> searchBoard(BoardBean board) {
		String sqlList = "select idx, subject, chapter, password, name, day, content from content_table where subject like '%"
				+ board.getSubject() + "%' or name like '%" + board.getName() + "%' or content like '%"
				+ board.getContent() + "%'";
		System.out.print("searchboard");
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sqlList);
			while (rs.next()) {
				BoardBean searched_board = new BoardBean();
				searched_board.setIdx(rs.getInt("idx"));
				searched_board.setSubject(rs.getString("subject"));
				searched_board.setChapter(rs.getString("chapter"));
				searched_board.setPassword(rs.getString("password"));
				searched_board.setName(rs.getString("name"));
				searched_board.setDay(rs.getDate("day"));
				searched_board.setContent(rs.getString("content"));
				list.add(searched_board);
			}
			rs.close();
			disconnect();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public ArrayList<BoardBean> mysearchBoard(BoardBean board) {
	     String sqlsubject = "select idx, subject, chapter, password, name, day, content from content_table where subject like '%"
	             + board.getSubject() + "%' and name = '" + board.getName()+ "'";
	       String sqlcontent = "select idx, subject, chapter, password, name, day, content from content_table where name ='" + board.getName() + "' and content like '%"
	             + board.getContent() + "%'";
	    

	       ArrayList<BoardBean> list = new ArrayList<BoardBean>();
	       try {
	          connect();
	          ResultSet rs = stmt.executeQuery(sqlsubject);
	          if (board.getSubject()==null) {
	             rs = stmt.executeQuery(sqlcontent);
	          }
	          
	          while (rs.next()) {
	             BoardBean searched_board = new BoardBean();
	             searched_board.setIdx(rs.getInt("idx"));
	             searched_board.setSubject(rs.getString("subject"));
	             searched_board.setChapter(rs.getString("chapter"));
	             searched_board.setPassword(rs.getString("password"));
	             searched_board.setName(rs.getString("name"));
	             searched_board.setDay(rs.getDate("day"));
	             searched_board.setContent(rs.getString("content"));
	             list.add(searched_board);
	          }
	          rs.close();
	          disconnect();
	       } catch (Exception e) {
	       }
	       return list;

	}

	@Override
	public void addBoard(BoardBean board) {
		// TODO Auto-generated method stub
		String sql = "insert into content_table(subject,chapter,password,name,day,content) values('"
				+ board.getSubject() + "', '" + board.getChapter() + "', '" + board.getPassword() + "', '"
				+ board.getName() + "', " + "now(), '" + board.getContent() + "')";
		try {
			connect();
			stmt.executeUpdate(sql);
			disconnect();
		} catch (Exception e) {
		}

	}

	@Override
	public BoardBean getBoard(String idx) {
		// TODO Auto-generated method stub
		String sql = "select subject, chapter, password, name, day, content from content_table where idx=" + idx;
		BoardBean board = new BoardBean();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			board.setIdx(Integer.parseInt(idx));
			board.setSubject(rs.getString("subject"));
			board.setChapter(rs.getString("chapter"));
			board.setPassword(rs.getString("password"));
			board.setName(rs.getString("name"));
			board.setDay(rs.getDate("day"));
			board.setContent(rs.getString("content"));
			rs.close();
			disconnect();
		} catch (Exception e) {
		}
		return board;
	}

	@Override
	public ArrayList<BoardBean> getAllBoard() {
		// TODO Auto-generated method stub
		String sqlList = "select idx, subject, chapter, password, name, day, content from content_table";
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sqlList);
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setIdx(rs.getInt("idx"));
				board.setSubject(rs.getString("subject"));
				board.setChapter(rs.getString("chapter"));
				board.setPassword(rs.getString("password"));
				board.setName(rs.getString("name"));
				board.setDay(rs.getDate("day"));
				board.setContent(rs.getString("content"));
				list.add(board);
			}
			rs.close();
			disconnect();
		} catch (Exception e) {
		}
		return list;
	}

	public ArrayList<BoardBean> getMyBoard(String name) {
		// TODO Auto-generated method stub
		String sqlList = "select * from content_table where name='" + name + "'";
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sqlList);
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setIdx(rs.getInt("idx"));
				board.setSubject(rs.getString("subject"));
				board.setChapter(rs.getString("chapter"));
				board.setPassword(rs.getString("password"));
				board.setName(rs.getString("name"));
				board.setDay(rs.getDate("day"));
				board.setContent(rs.getString("content"));
				list.add(board);
			}
			rs.close();
			disconnect();
		} catch (Exception e) {
		}
		return list;
	}
}