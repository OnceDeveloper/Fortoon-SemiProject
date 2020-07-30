package domain;

import java.sql.Date;

public class CreationA {
	
	private int cr_num;
	private int epi;
	private String division;
	private String genre;
	private String title;
	private String plot;
	private Date rdate;
	private int lcount;
	private String m_id;
	private String fname;
	private String file_div;
	
	
	public CreationA() {}


	public CreationA(int cr_num, int epi, String division, String genre, String title, String plot, Date rdate,
			int lcount, String m_id, String fname, String file_div) {
		super();
		this.cr_num = cr_num;
		this.epi = epi;
		this.division = division;
		this.genre = genre;
		this.title = title;
		this.plot = plot;
		this.rdate = rdate;
		this.lcount = lcount;
		this.m_id = m_id;
		this.fname = fname;
		this.file_div = file_div;
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


	public String getDivision() {
		return division;
	}


	public void setDivision(String division) {
		this.division = division;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPlot() {
		return plot;
	}


	public void setPlot(String plot) {
		this.plot = plot;
	}


	public Date getRdate() {
		return rdate;
	}


	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	public int getLcount() {
		return lcount;
	}


	public void setLcount(int lcount) {
		this.lcount = lcount;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getFile_div() {
		return file_div;
	}


	public void setFile_div(String file_div) {
		this.file_div = file_div;
	}

	
}