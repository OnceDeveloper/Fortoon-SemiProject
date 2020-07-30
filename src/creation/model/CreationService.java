package creation.model;

import java.util.ArrayList;
import creation.vo.ListResult;
import domain.Creation;
import domain.CreationA;
import domain.CreationT;

//import java.util.ArrayList;

public class CreationService {
	//SingleTon Object Model
	private CreationDAO dao;
	private static final CreationService instance = new CreationService();
	private CreationService() {
		dao = new CreationDAO();
	}
	public static CreationService getInstance() {
		return instance;
	}
	public CreationA listS(int cr_num){
		return dao.list(cr_num);
	}
	public CreationA listCS(int cr_num){
		return dao.listC(cr_num);
	}
	public void delS(int seq){
		dao.del(seq);
	}
	public ListResult getListResultS(String division, String genre, int page, int pageSize){
		ArrayList<CreationT> list = dao.getListResult(division, genre, page, pageSize);
		long totalCount = dao.getTotalCount(division, genre);
		ListResult r = new ListResult(page, totalCount, pageSize, list);
		return r;
		//return dao.getListResult(page, pageSize);
	}
	public ListResult getToonListResultS(int cr_num, int cp, int ps) {
		ArrayList<CreationA> list = dao.getToonListResult(cr_num, cp, ps);
		long totalCount = dao.getToonTotalCount(cr_num);
		ListResult r = new ListResult(cp, totalCount, ps, list);
		return r;
	}
}
