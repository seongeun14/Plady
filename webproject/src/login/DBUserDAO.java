package login;

import java.sql.*;

public class DBUserDAO implements UserDAO{
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf8&serverTimezone=UTC";
	private Connection conn;
	private Statement stmt;
	
	private void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,  "root", "kgu123");
			stmt = conn.createStatement();
		} catch(Exception e) {}
	}
	
	private void disconnect() {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {}
	}
	
	public boolean checkUser_login(UserBean user) {
		String sql = "SELECT id, passwd FROM member_table WHERE id = '" 
					+ user.getUserid()
					+ "' AND passwd = '" + user.getPasswd() + "'";
		System.out.println(sql);
		try {
			int count = 0;
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
						count++; //아이디가 존재하면 count는 1
			
			rs.close();
			disconnect();
			if(count == 0) return false; //로그인 x
			else return true; //로그인 o
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean checkUser_join(UserBean user) {  //DB에 입력한 유저 정보가 있는지 확인(login성공유무, join성공유무)
		String sql = "SELECT passwd FROM member_table WHERE id = '" + user.getUserid() + "'";
		System.out.println(sql);
		int count = 0;
		try {		
			connect();
			ResultSet rs = stmt.executeQuery(sql); //쿼리 실행
			while(rs.next())
						count++; //아이디가 존재하면 count는 1이 된다.(아이디 중복이 없을 시)
			
			rs.close();
			disconnect();
			if(count == 0) return true;  //회원가입o
			else return false;  //회원가입x
		}
		catch(Exception e){
			e.printStackTrace();
			return false;  //회원가입x
		}
	}
	
	public void addUser(UserBean user) {  //DB에 유저정보를 추가한다.(join성공시 실행)
		String sql = "insert into member_table values('"
				+user.getUserid() +"','"
				+user.getPasswd() + "')";
		try {
			connect(); //DB연결
			stmt.executeUpdate(sql);
			disconnect();
		}catch(Exception e) {
			System.out.print("addUser오류: " );
			e.printStackTrace();
		}
	}
}
