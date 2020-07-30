package domain;

public class Files {
	private int f_num;
	private String division;
	private String fname;
	private String ofname;
	private long fsize;
	private String path;
	private int cr_num;
	private int epi;

	public Files() {}

	public Files(int f_num, String division, String fname, String ofname, long fsize, String path, int cr_num,
			int epi) {
		super();
		this.f_num = f_num;
		this.division = division;
		this.fname = fname;
		this.ofname = ofname;
		this.fsize = fsize;
		this.path = path;
		this.cr_num = cr_num;
		this.epi = epi;
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getOfname() {
		return ofname;
	}

	public void setOfname(String ofname) {
		this.ofname = ofname;
	}

	public long getFsize() {
		return fsize;
	}

	public void setFsize(long fsize) {
		this.fsize = fsize;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
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
