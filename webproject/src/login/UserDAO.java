package login;

public interface UserDAO {
	public boolean checkUser_join(UserBean user);  //user확인
	public boolean checkUser_login(UserBean user);
	public void addUser(UserBean user);
}
