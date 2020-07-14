package plan;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DBPlanDAO implements PlanDAO{
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
		}
	}
	private void disconnect() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
		}
	}
	
	@Override
	public void addPlan(PlanBean plan) {
		// TODO Auto-generated method stub
		String sql="insert into plan_table values('"
				+plan.getDay()+"', '"
				+plan.getSubject()+"', '"
				+plan.getChapter()+"')";
		try {
			connect();
			stmt.executeUpdate(sql);
			disconnect();
		} catch (Exception e) {
		}
		
	}
	@Override
	public ArrayList<PlanBean> getPlans(Date day) {
		// TODO Auto-generated method stub
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String sql="select day, subject, chapter from plan_table where day="+format.format(day);
		ArrayList<PlanBean> planList = new ArrayList<PlanBean>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PlanBean plan = new PlanBean();
				plan.setDay(rs.getDate("day"));
				plan.setSubject(rs.getString("subject"));
				plan.setChatper(rs.getString("chapter"));
				planList.add(plan);
			}
			rs.close();
			disconnect();
		}catch(Exception e) {}
		return planList;
	}
	
}
