package domain;

public class LookCreation {
	private int l_num;
	private String m_id;
	private int cr_num;
	
	public LookCreation() {}

	public LookCreation(int l_num, String m_id, int cr_num) {
		this.l_num = l_num;
		this.m_id = m_id;
		this.cr_num = cr_num;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		l_num = l_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getCr_num() {
		return cr_num;
	}

	public void setCr_num(int Cr_num) {
		this.cr_num = cr_num;
	}
	
	
}
