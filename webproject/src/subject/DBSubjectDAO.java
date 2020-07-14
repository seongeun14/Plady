package subject;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import plan.PlanBean;

public class DBSubjectDAO implements SubjectDAO{
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

 /*  @Override
   public ArrayList<SubjectBean> getAllSubject() {
      // TODO Auto-generated method stub
      String sql = "select subject from Subject_table";
      ArrayList<SubjectBean> list = new ArrayList<SubjectBean>();
      try {
         connect();
         ResultSet rs = stmt.executeQuery(sql);
         while (rs.next()) {
            SubjectBean Subject = new SubjectBean();

            Subject.setSubject(rs.getString("subject"));
            Subject.setChapter(rs.getString("chapter"));
            list.add(Subject);
         }
         rs.close();
         disconnect();
      } catch (Exception e) {}
      return list;
   }
*/
@Override
public ArrayList<String> getAllSubject() {
	// TODO Auto-generated method stub
    String sql = "select subject from Subject_table";
    ArrayList<String> list = new ArrayList<String>();
    try {
       connect();
       ResultSet rs = stmt.executeQuery(sql);
       while (rs.next()) {
          String subject = (rs.getString("subject"));
          list.add(subject);
       }
       rs.close();
       disconnect();
    } catch (Exception e) {}
    return list;    
}
}