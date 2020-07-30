package domain;

public class Member {
	private String m_id;
	private String name;
	private String brith;
	private String phone;
	private String pwd;
	
	public Member() {}

	public Member(String m_id, String name, String brith, String phone, String pwd) {
		super();
		this.m_id = m_id;
		this.name = name;
		this.brith = brith;
		this.phone = phone;
		this.pwd = pwd;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrith() {
		return brith;
	}

	public void setBrith(String brith) {
		this.brith = brith;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
