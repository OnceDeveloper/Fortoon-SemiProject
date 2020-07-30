package domain;

public class Board {
	private int b_num;
	private String title;
	private String contents;
	private int m_id;

	public Board() {}

	public Board(int b_num, String title, String contents, int m_id) {
		this.b_num = b_num;
		this.title = title;
		this.contents = contents;
		this.m_id = m_id;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	
		
}
