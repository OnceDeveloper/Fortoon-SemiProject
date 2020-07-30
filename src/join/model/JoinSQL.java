package join.model;

class JoinSQL {
	final static String INSERT = "insert into Member values(?,?,?,?,?)";

	final static String CONTENT = "select * from Member where m_id=?";
	
	final static String UPDATE = "update Member set name=?, birth=?, phone=?, pwd=? where m_id =?";
	
	
	final static String DEL = "delete from Member where m_id=?";

	final static String CHECK = "select m_id from Member where m_id=?";
	
	final static String search = "select m_id from Member where name=?";

	final static String FINDID = "select m_id from Member where name=? and phone=?";
	
	final static String FINDPWD = "select pwd from Member where name=? and phone=?";
	
	}



