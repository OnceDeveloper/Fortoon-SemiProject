package file.model;

class FileSQL {
	static final String LIST = "select * from CREATION where CR_NUM =? and EPI=1";
	static final String DEL = "delete from CREATION where SEQ=?";
	static final String DEL_ALL = "delete from CREATION";
	static final String INSERTC = "insert into CREATION values(?, ?, ?, 0, ?, ?, ?, SYSDATE, 0, ?)";
	static final String INSERTF = "insert into FILES values(F_NUM_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
	static final String UPDATE = "update CREATION set writer=?, email=?, subject=?, content=? where SEQ = ?";
	static final String CHECK_COUNT = "select count(cr_num) from CREATION";
	static final String CHECK_MAX_COUNT = "select MAX(CR_NUM) from CREATION";
	static final String THUMB_IMG = "SELECT A.* FROM FILES A LEFT OUTER JOIN CREATION B ON A.CR_NUM = B.CR_NUM WHERE A.CR_NUM=? AND A.DIVISION = 'thumb' order by B.RDATE, A.CR_NUM desc";
	static final String CREATION_IMG = "SELECT A.* FROM FILES A LEFT OUTER JOIN CREATION B ON A.CR_NUM = B.CR_NUM WHERE A.CR_NUM=? AND A.DIVISION = 'creation' order by B.RDATE, A.CR_NUM desc";
	
}
