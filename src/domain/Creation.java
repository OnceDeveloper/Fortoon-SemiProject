package domain;

import java.sql.Date;

public class Creation {
	
	private int cr_num;
	private int epi;
	private String division;
	private int age_grade;
	private String genre;
	private String title;
	private String plot;
	private Date rdate;
	private int lcount;
	private String m_id;
	
	public Creation() {}

	public Creation(int cr_num, int epi, String division, int age_grade, String genre, String title, String plot,
			Date rdate, int lcount, String m_id) {
		super();
		this.cr_num = cr_num;
		this.epi = epi;
		this.division = division;
		this.age_grade = age_grade;
		this.genre = genre;
		this.title = title;
		this.plot = plot;
		this.rdate = rdate;
		this.lcount = lcount;
		this.m_id = m_id;
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

	public int getAge_grade() {
		return age_grade;
	}

	public void setAge_grade(int age_grade) {
		this.age_grade = age_grade;
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
	
	
}