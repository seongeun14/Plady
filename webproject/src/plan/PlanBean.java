package plan;

import java.sql.Date;

public class PlanBean {
	private Date day;
	private String subject;
	private String chapter;
	
	public Date getDay() {
		return day;
	}
	public void setDay(Date sqlDate) {
		this.day = sqlDate;
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
	public void setChatper(String chapter) {
		this.chapter = chapter;
	}
}
