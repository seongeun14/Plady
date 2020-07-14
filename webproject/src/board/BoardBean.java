package board;

import java.sql.Date;

public class BoardBean {
   private int idx;
   private String subject;
   private String chapter;
   private String password;
   private String name;
   private Date day;
   private String content;
   
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   
   public int getIdx() {
      return idx;
   }
   public void setIdx(int idx) {
      this.idx = idx;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getChapter() {
      return chapter;
   }
   public void setChapter(String chapter) {
      this.chapter = chapter;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public Date getDay() {
      return day;
   }
   public void setDay(Date sqlDate) {
      this.day = sqlDate;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }   
   
}