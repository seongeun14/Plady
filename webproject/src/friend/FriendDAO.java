package friend;

import java.util.ArrayList;

public interface FriendDAO {
	public void addFriend(FriendBean Friend);
	public void deleteFriend(FriendBean Friend);
	public boolean checkFriend(FriendBean Friend);
	public FriendBean getFriend(String idx);
	public ArrayList<FriendBean> getAllFriend();
}