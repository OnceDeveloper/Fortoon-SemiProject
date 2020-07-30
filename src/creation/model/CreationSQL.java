package creation.model;

class CreationSQL {
	//static final String LIST = "select * from CREATION where CR_NUM =? and EPI=1";
	static final String LIST = "select A.*, B.FNAME, B.DIVISION FILE_DIV from CREATION A LEFT OUTER JOIN FILES B ON A.CR_NUM = B.CR_NUM AND A.EPI = B.EPI where A.CR_NUM =? and A.EPI=1";
	static final String LISTC = "select A.*, B.FNAME, B.DIVISION FILE_DIV from CREATION A LEFT OUTER JOIN FILES B ON A.CR_NUM = B.CR_NUM AND A.EPI = B.EPI where A.CR_NUM =? and A.EPI=1 and B.DIVISION='creation'";
	static final String DEL = "delete from CREATION where SEQ=?";
	static final String DEL_ALL = "delete from CREATION";
	static final String INSERT = "insert into CREATION values(CREATION_SEQ.nextval, ?, ?, ?, ?, SYSDATE)";
	static final String UPDATE = "update CREATION set writer=?, email=?, subject=?, content=? where SEQ = ?";
	static final String PAGING = "select * from (select ROWNUM rnum, aa.* from (select * from CREATION order by LCOUNT desc) aa)where rnum>? and rnum<=?";
	//static final String PAGING_D = "select * from (select ROWNUM rnum, aa.* from (select distinct CR_NUM, TITLE, GENRE, LCOUNT, RDATE from CREATION where DIVISION=? order by RDATE, CR_NUM desc) aa)where rnum>? and rnum<=?";
	static final String PAGING_D = "select B.* from (select ROWNUM rnum, A.* from (select distinct A.CR_NUM, A.TITLE, A.GENRE, A.LCOUNT, A.RDATE, B.FNAME from CREATION A LEFT OUTER JOIN FILES B ON A.CR_NUM = B.CR_NUM AND A.EPI = B.EPI where A.DIVISION=? and B.DIVISION='thumb' order by A.RDATE, A.CR_NUM desc)A)B where B.rnum>? and B.rnum<=?";
	//static final String PAGING_G = "select * from (select ROWNUM rnum, aa.* from (select distinct CR_NUM, TITLE, GENRE, DIVISION, LCOUNT, RDATE from CREATION where DIVISION=? and GENRE=? order by RDATE, CR_NUM desc desc) aa)where rnum>? and rnum<=?";
	static final String PAGING_G = "select B.* from (select ROWNUM rnum, A.* from (select distinct A.CR_NUM, A.TITLE, A.GENRE, A.DIVISION, A.LCOUNT, A.RDATE, B.FNAME, B.DIVISION D2 from CREATION A LEFT OUTER JOIN FILES B ON A.CR_NUM = B.CR_NUM AND A.EPI = B.EPI where A.DIVISION=? and A.GENRE=? and B.DIVISION='thumb' order by A.RDATE, A.CR_NUM desc)A)B where B.rnum>? and B.rnum<=?";
	//static final String PAGING_TOON = "SELECT B.* FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM CREATION A LEFT OUTER JOIN FILES B ON A.CR_NUM = B.CR_NUM AND A.EPI = B.EPI WHERE A.CR_NUM =? AND B.DIVISION='thumb' ORDER BY A.EPI DESC)A)B WHERE B.RNUM >? AND B.RNUM<=?";
	static final String PAGING_TOON = "SELECT B.* FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT A.*, B.FNAME, B.DIVISION FILE_DIV FROM CREATION A LEFT OUTER JOIN FILES B ON A.CR_NUM = B.CR_NUM AND A.EPI = B.EPI WHERE A.CR_NUM =? AND B.DIVISION='thumb' ORDER BY A.EPI DESC)A)B WHERE B.RNUM >? AND B.RNUM<=?";

	static final String TOTAL_D = "select count(distinct cr_num) from CREATION where DIVISION=?";
	static final String TOTAL_G = "select count(distinct cr_num) from CREATION where DIVISION=? and GENRE=?";
	static final String TOTAL_TOON = "select max(EPI) from CREATION where CR_NUM=?";
	
	
}
