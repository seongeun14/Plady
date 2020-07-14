package friend;

import java.sql.*;
import java.util.ArrayList;

public class DBFriendDAO implements FriendDAO {
   private String jdbc_driver = "com.mysql.cj.jdbc.Driver";
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
   /*
    * public void addFriend(FriendBean Friend) { String sql1 =
    * "select name from memeber_table where name = '" + Friend.getFriendId() + "'";
    * try { connect(); ResultSet rs1 = stmt.executeQuery(sql1); int count = 0;
    * while (rs1.next()) { count++; } if (count != 0) { String sql =
    * "insert into friend_table values('" + Friend.getMyId() + "', '" +
    * Friend.getFriendId() + "')"; stmt.executeUpdate(sql);
    * 
    * } rs1.close();
    * 
    * disconnect(); } catch (Exception e) { } }
    */

   public boolean checkFriend(FriendBean Friend) {
      String sql1 = "select id from member_table where id = '" + Friend.getFriendId() + "'";
      System.out.println("check: " + sql1);
      int count = 0;
      try {
         connect();
         ResultSet rs = stmt.executeQuery(sql1);

         while (rs.next()) { // 존재하면 count가 1로 변화
            count++;
         }

         rs.close();
         disconnect();
         if (count == 0)
            return false; // add불가능
         else
            return true; // add가능
      } catch (Exception e) {
         e.printStackTrace();
         return false; // 회원가입x
      }
   }

   @Override
   public void addFriend(FriendBean Friend) {
      String sql = "insert into friend_table(myId,friendId) values('" + Friend.getMyId() + "', '"
            + Friend.getFriendId() + "')";
      try {
         connect();
         stmt.executeUpdate(sql);
         disconnect();
      } catch (Exception e) {
      }
   }

   public void deleteFriend(FriendBean Friend) {
      String sql = "delete from friend_table where myId='" + Friend.getMyId() + "'" + "and friendId='"
            + Friend.getFriendId() + "'";
      try {
         connect();
         stmt.executeUpdate(sql);
         disconnect();
      } catch (Exception e) {
      }

   }

   @Override
   public FriendBean getFriend(String idx) {
      // TODO Auto-generated method stub

      String sql = "select myId, friendId from friend_table where idx=" + idx;
      FriendBean Friend = new FriendBean();
      try {
         connect();
         ResultSet rs = stmt.executeQuery(sql);
         rs.next();
         Friend.setIdx(Integer.parseInt(idx));
         Friend.setMyId(rs.getString("myId"));
         Friend.setFriendId(rs.getString("friendId"));
         rs.close();
         disconnect();
      } catch (Exception e) {
      }
      return Friend;
   }

   @Override
   public ArrayList<FriendBean> getAllFriend() {
      // TODO Auto-generated method stub
      String sql = "select idx,myId,friendId from friend_table";
      ArrayList<FriendBean> list = new ArrayList<FriendBean>();
      try {
         connect();
         ResultSet rs = stmt.executeQuery(sql);
         while (rs.next()) {
            FriendBean Friend = new FriendBean();
            Friend.setIdx(rs.getInt("idx"));

            Friend.setMyId(rs.getString("myId"));
            Friend.setFriendId(rs.getString("friendId"));
            list.add(Friend);
         }
         rs.close();
         disconnect();
      } catch (Exception e) {
      }
      return list;
   }

}