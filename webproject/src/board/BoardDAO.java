package board;

import java.util.ArrayList;

public interface BoardDAO {
	public void addBoard(BoardBean board);
	public ArrayList<BoardBean> searchBoard(BoardBean board);
	public ArrayList<BoardBean> mysearchBoard(BoardBean board);
	public boolean delBoard(String idx, String pass);
	public boolean modBoard(String idx, String pass, String sub, String chp, String cont);
	public BoardBean getBoard(String idx);
	public ArrayList<BoardBean> getAllBoard();
	public ArrayList<BoardBean> getMyBoard(String name);
	BoardBean searchOneBoard(BoardBean board);
}
