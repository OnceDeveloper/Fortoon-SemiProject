package login.model;

import domain.Member;

public class LoginService {
	
	private LoginDAO dao;
	private static final LoginService instance = new LoginService();
	
	private LoginService() {
		dao = new LoginDAO();
	}
	public static LoginService getInstance() {
		return instance;
	}
	public Member getMemberS(String id){
		Member m = dao.getMember(id);
		m.setPwd("");//컨트롤러와 뷰에서는 사용자의 패스워드를 볼 수 없도록 무력화시킴
		return m;
	}
	public int checkMember(String id, String pwd) {//boolean이 아닌 이유는 경우의 수가 2(true,false)가지가 아니라 3개 이상이기때문!!
		Member m = dao.getMember(id);  
		if(m == null) {
			return LoginSet.NO_ID; //그런 이메일을 가진 회원이 없음
		}else {
			String pwdDb = m.getPwd();
			if(pwdDb != null) pwdDb = pwdDb.trim();
			if(!pwd.equals(pwdDb)) {
				return LoginSet.NO_PWD;//패스워드 불일치
			}else {
				return LoginSet.PASS;//PWD 일치
			}
		}
	}
	/*
	public boolean userCheckS(Member mem) {
		return dao.userCheck(mem);
	}
	*/
}
