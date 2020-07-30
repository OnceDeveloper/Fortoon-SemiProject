package domain;

import java.sql.Date;

public class CreationT {
	
	private int cr_num;
	private String title;
	private String genre;
	private String division;
	private int lcount;
	private Date rdate;
	private String fname;
	
	public CreationT() {}

	public CreationT(int cr_num, String title, String genre, String division, int lcount, Date rdate, String fname) {
		this.cr_num = cr_num;
		this.title = title;
		this.genre = genre;
		this.division = division;
		this.lcount = lcount;
		this.rdate = rdate;
		this.fname = fname;
	}


	public int getCr_num() {
		return cr_num;
	}


	public void setCr_num(int cr_num) {
		this.cr_num = cr_num;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getDivision() {
		return division;
	}


	public void setDivision(String division) {
		this.division = division;
	}


	public int getLcount() {
		return lcount;
	}


	public void setLcount(int lcount) {
		this.lcount = lcount;
	}


	public Date getRdate() {
		return rdate;
	}


	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}

	
}