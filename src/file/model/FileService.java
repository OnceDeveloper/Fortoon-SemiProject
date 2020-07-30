package file.model;

import java.util.ArrayList;
import creation.vo.ListResult;
import domain.Creation;
import domain.Files;

//import java.util.ArrayList;

public class FileService {
	//SingleTon Object Model
	private FileDAO dao;
	private static final FileService instance = new FileService();
	private FileService() {
		dao = new FileDAO();
	}
	public static FileService getInstance() {
		return instance;
	}
	public Creation listS(int cr_num){
		return dao.list(cr_num);
	}
	public void delS(int seq){
		dao.del(seq);
	}
	public boolean insertCS(Creation creation) {
		return dao.insertC(creation);
	}
	public boolean insertFS(Files files) {
		return dao.insertF(files);
	}
	public Files getThumbS(int cr_num) {
		return dao.getThumb(cr_num);
	}
	public Files getcreationS(int cr_num) {
		return dao.getCreation(cr_num);
	}

	public int getCheckCountS(){
		return dao.getCheckCount();
	}
	public int getMaxCountS(){
		return dao.getMaxCount();
	}
}
