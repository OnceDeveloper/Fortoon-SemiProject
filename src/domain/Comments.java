package domain;

import java.sql.Date;

public class Comments {
	private int co_num;
	private String contents;
	private Date rdate;
	private int rcount;
	private int cr_num;
	private int epi;
	
	public Comments() {}

	public Comments(int co_num, String contents, Date rdate, int rcount, int cr_num, int epi) {
		super();
		this.co_num = co_num;
		this.contents = contents;
		this.rdate = rdate;
		this.rcount = rcount;
		this.cr_num = cr_num;
		this.epi = epi;
	}

	public int getCo_num() {
		return co_num;
	}

	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}

	public int getCr_num() {
		return cr_num;
	}

	public void setCr_num(int cr_num) {
		this.cr_num = cr_num;
	}

	public int getEpi() {
		return epi;
	}

	public void setEpi(int epi) {
		this.epi = epi;
	}
	
}
