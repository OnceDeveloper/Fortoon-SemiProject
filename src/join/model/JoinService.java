package join.model;

import java.util.ArrayList;
import java.util.List;

import domain.Member;


//import java.util.ArrayList;

public class JoinService {
	private static final JoinService instance = new JoinService();
	private JoinDAO dao;
	
	private JoinService() {
		dao = new JoinDAO();
	}

	public static JoinService getInstance() {
		return instance;
	}

	public boolean insertS(Member member) {
		return dao.insert(member);
	}

	public boolean updateS(Member member){
		return dao.update(member);
	}
	
	public boolean idCheckS(String m_id){
		return dao.idCheck(m_id);
	}
	
	public void delS(String m_id){
		dao.del(m_id);
	}

	
	public boolean idCheckS2(String m_id){
		return dao.idCheck2(m_id);
	}

	
	public String findID(String name, String phone) {
		String m_id = dao.findID(name, phone);
		if(m_id != null) {
			return m_id; // ID �ٰ� 
		}else { 
			return null; // ID�� ����
		}
	}
	
	public String findPWD(String name, String phone) {
		String pwd = dao.findPWD(name, phone);
		if(pwd != null) {
			return pwd; // ID �ٰ� 
		}else { 
			return null; // ID�� ����
		}
	}

	
}


	