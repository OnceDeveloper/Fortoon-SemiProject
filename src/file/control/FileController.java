package file.control;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import domain.Creation;
import domain.Files;
import file.model.FileService;
import file.vo.FileSet;

@WebServlet("/file/file.do")
public class FileController extends HttpServlet {
       
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("toon_insertThum")){
				toonIsertThum(request, response);
			}else if(m.equals("toon_insertFiles")){
				toonInsertFilse(request, response);
			}/*else if(m.equals("toon_insert")){
				toonInsert(request, response);
			}*/else {
				toonInsertF(request, response);
			}
		}else {
			toonInsertF(request, response);
		}
	}
	

	private void toonInsertF(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "../toon/toon_insert.jsp";
		response.sendRedirect(view);
	}
	private void toonIsertThum(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String saveDir = FileSet.THUMB_FILE_DIR;
		File fSaveDir = new File(saveDir);
		if(!fSaveDir.exists()) fSaveDir.mkdirs();
		int maxPostSize = 1024*1024*1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		String thumbF="";
		String othumbF="";
		long thumbSize=0;
		
		MultipartRequest mr = null;
		try{
			mr = new MultipartRequest(request, saveDir, maxPostSize, encoding, policy);		
			thumbF = mr.getFilesystemName("thumbF");
			othumbF = mr.getOriginalFileName("thumbF");

			File thumbO = mr.getFile("thumbF");//썸네일 파일 객체 생성
			thumbSize = thumbO.length();//썸네일 파일 사이즈
			System.out.println("thumbSize : "+thumbSize+"byte");
			System.out.println(
				"업로드 성공 =>thumbF: " + thumbF + ", othumbF: " + othumbF);
		}catch(IOException ie) {
			System.out.println("업로드 실패: " + ie);
		}
		String title = mr.getParameter("title");
		if(title != null) title.trim();
		String division = mr.getParameter("division");
		if(division != null) division.trim();
		String genre = mr.getParameter("genre");
		if(genre != null) genre.trim();
		String plot = mr.getParameter("plot");
		if(plot != null) plot.trim();

		request.setAttribute("thumbF", thumbF);
		request.setAttribute("othumbF", othumbF);
		request.setAttribute("thumbSize", thumbSize);
		
		request.setAttribute("title", title);//list라는 이름으로 list의 속성을 저장한다.
		request.setAttribute("division", division);
		request.setAttribute("genre", genre);
		request.setAttribute("plot", plot);
		
		/*
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
		session.setAttribute("thumbF",thumbF);
		application.setAttribute("thumbF", thumbF);
		*/
		
		String view = "../toon/toon_insertFiles.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void toonInsertFilse(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		String saveTDir = FileSet.THUMB_FILE_DIR;
		
		String saveDir = FileSet.CREATION_FILE_DIR;
		File fSaveDir = new File(saveDir);
		if(!fSaveDir.exists()) fSaveDir.mkdirs();
		int maxPostSize = 1024*1024*1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mr = null;
		
		String creationF ="";
		String ocreationF="";
		long creationFSize =0; 
		
		try{
			
			mr = new MultipartRequest(request, saveDir, maxPostSize, encoding, policy);			
			creationF = mr.getFilesystemName("creationF[]");//변경된 파일이름
			ocreationF = mr.getOriginalFileName("creationF[]");//원본 파일 이름

			File creationFO = mr.getFile("creationF[]");//작품 파일 객체 생성
			creationFSize = creationFO.length();//작품 파일 사이즈
			System.out.println("creationF[]Size : "+creationFSize+"byte");
			System.out.println(
				"업로드 성공 =>creationF[]: " + creationF + ", ocreationF: " + ocreationF);
		}catch(IOException ie) {
			System.out.println("업로드 실패: " + ie);
		}
		
		String title = mr.getParameter("title");
		if(title != null) title.trim();
		String division = mr.getParameter("division");
		if(division != null) division.trim();
		String genre = mr.getParameter("genre");
		if(genre != null) genre.trim();
		String plot = mr.getParameter("plot");
		if(plot != null) plot.trim();
		String thumbF = mr.getParameter("thumbF");
		if(thumbF != null) thumbF.trim();

		String epiS = mr.getParameter("epi");
		if(epiS != null) epiS.trim();
		

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//System.out.println(id);

		int epi = Integer.parseInt(epiS);
		 
		System.out.println("title DD : "+title);
		System.out.println("division DD : "+division);
		System.out.println("genre DD : "+genre);
		System.out.println("plot DD : "+plot);
		System.out.println("thumbF : "+thumbF);
		System.out.println("epi DD : "+epi);
		
		//creation의 count조회해서 0이면 작품번호0
		                //    0보다 크면 max조회해서 +1
		//if
		FileService service = FileService.getInstance();
		int toonNum = service.getCheckCountS();
		System.out.println("toonNum2222 : "+toonNum);
		
		int maxNum = service.getMaxCountS();
		System.out.println("maxNum2222 : "+maxNum);
		int cr_num = 0;
		
		if(toonNum ==0 ) {//작품이 없을 때
			cr_num = 1;//작품이 없다면 작품 번호를 1로 설정
		}else if(toonNum >0) {//작품이 있을 때
			cr_num = maxNum+1;
		}
		
		Creation creation = new Creation(cr_num, epi, division, -1, genre, title, plot, null, -1, id);
		boolean flagC = service.insertCS(creation);
		System.out.println("flagC"+flagC);
		//request.setAttribute("flag", flag);
		Files thumb = new Files(-1, "thumb", thumbF, ocreationF, creationFSize, saveTDir, cr_num, epi);
		boolean flagFT = service.insertFS(thumb);
		System.out.println("flagF"+flagFT);
		
		Files creations = new Files(-1, "creation", creationF, ocreationF, creationFSize, saveDir, cr_num, epi);
		boolean flagFC = service.insertFS(creations);
		System.out.println("flagF"+flagFC);
		//boolean flag = service.insertCS(creation);
		//request.setAttribute("flag", flag);
		
		
		Files thumbImg = service.getThumbS(cr_num);
		System.out.println("thumbImg name : "+thumbImg.getFname());
		//request.setAttribute("thumbImg", thumbImg);
		
		Files creationImg = service.getcreationS(cr_num);
		System.out.println("creationImg name : "+creationImg.getFname());
		//request.setAttribute("creationImg", creationImg);
		
		session.setAttribute("thumbImg",thumbImg);
		session.setAttribute("creationImg",creationImg);
		
		//String view = "../index.do";
		String view = "../index.do";
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect(view);
		
		
		/*  alert시도
	
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('작품 등록을 성공하셨습니다!');");
		//out.println("history.back();");
		out.println("</script>");
		out.flush();
		if(out != null) out.close();
		 */
		/*
		String saveDir = FileSet.CREATION_FILE_DIR;
		File fSaveDir = new File(saveDir);
		if(!fSaveDir.exists()) fSaveDir.mkdirs();
		int maxPostSize = 1024*1024*1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mr = null;
		
		mr = new MultipartRequest(request, saveDir, maxPostSize, "euc-kr", policy);
		Vector<Object> v = new Vector<Object>();
		
		Enumeration creationS = mr.getFileNames(); //파일명정보를 배열로 만들다

		int nfne = 1; //새파일명에 들어갈 끝 숫자
		int si = 0; //배열의 순서를 얻기 위한 숫자
		while(creationS.)
		while(creationS.hasMoreElements()){ //다음 요소가 있으면 계속 반복
		String name1 = (String)creationS.nextElement(); //파일명정보 Enumeration 의 다음 요소를 name1에 저장한다.
		String creationF = mr.getFilesystemName(name1); 
		String ocreationF = mr.getOriginalFileName(name1);
		String type = mr.getContentType(name1);
		File uf = mr.getFile(name1); //파일 생성 
		long[] asize=null;
		asize[si] = uf.length(); //업로드된 파일의 크기 파악
		si++; //다음 배열의 순서를 얻기 위해 1 증가

		if(creationF == null){ //null 처리

		}
		else{ 
		File f = new File(application.getRealPath("/file/"+creationF)); //업로드된 파일 생성
		int index = creationF.lastIndexOf("."); // 확장자 
		String ext = creationF.substring(index);	//구하기
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddmmss"); //새파일명
		String newname = df.format(new Date()) + nfne + ext ;	// 구하기
		File r = new File(application.getRealPath("/file/"+newname));
		f.renameTo(r); //업로드된 파일명 변환


		v.addElement(newname); //디비에 저장하기 위해 벡터 v에 저장
		v.addElement(ocreationF);
		v.addElement(type);
		nfne++; //새파일명을 시간으로 하니 while문장이 빨리 진행해 1초안에 여러
		//파일이 처리될 수 있다. 그래서 그 구별을 위한 숫자 파일명 맨
		//끝에 붙는다.
		}
		}
		
		String view = "../index.do";
		response.sendRedirect(view);
		*/
	}
	
	/*
	private void toonInsert(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String saveDir;
		File fSaveDir;
		File fSaveDirs;
		
		
		int maxPostSize;
		String encoding;
		FileRenamePolicy policy;
		FileRenamePolicy policys;
		
		
		MultipartRequest mr = null;
		MultipartRequest multi = null;

	try{
			saveDir = FileSet.THUMB_FILE_DIR;
			fSaveDir = new File(saveDir);
			if(!fSaveDir.exists()) fSaveDir.mkdirs();
			maxPostSize = 1024*1024*1024;
			encoding = "utf-8";
			policy = new DefaultFileRenamePolicy();
			
			mr = new MultipartRequest(request, saveDir, maxPostSize, encoding, policy);			
			String thumbF = mr.getFilesystemName("thumbF");
			String othumbF = mr.getOriginalFileName("thumbF");

			File thumbO = mr.getFile("thumbF");//썸네일 파일 객체 생성
			long thumbSize = thumbO.length();//썸네일 파일 사이즈
			System.out.println("thumbSize : "+thumbSize+"byte");
			System.out.println(
				"업로드 성공 =>thumbF: " + thumbF + ", othumbF: " + othumbF);
		}catch(IOException ie) {
			System.out.println("업로드 실패: " + ie);
		}
	
		String title = mr.getParameter("title");
		if(title != null) title.trim();
		String division = mr.getParameter("division");
		if(division != null) division.trim();
		String genre = mr.getParameter("genre");
		if(genre != null) genre.trim();
		String plot = mr.getParameter("plot");
		if(plot != null) plot.trim();
		
		String epiS = mr.getParameter("epi");
		if(epiS != null) epiS.trim();
		int epi = Integer.parseInt(epiS);
		
		System.out.println("title DD : "+title);
		System.out.println("division DD : "+division);
		System.out.println("genre DD : "+genre);
		System.out.println("plot DD : "+plot);
		System.out.println("epi DD : "+epi);
		
		
		try{
			saveDir = FileSet.CREATION_FILE_DIR;
			//saveDir = FileSet.CREATION_FILE_DIR+"/"+division;
			System.out.println("division test : "+division);
			System.out.println("saveDir : "+saveDir);
			fSaveDirs = new File(saveDir);
			if(!fSaveDirs.exists()) fSaveDirs.mkdirs();
			maxPostSize = 1024*1024*1024;
			encoding = "utf-8";
			policys = new DefaultFileRenamePolicy();
			
			multi = new MultipartRequest(request, saveDir, maxPostSize, encoding, policys);			
			String creationF = multi.getFilesystemName("creationF[]");
			String ocreationF = multi.getOriginalFileName("creationF[]");

			File creationFO = multi.getFile("creationF[]");//작품 파일 객체 생성
			long creationFSize = creationFO.length();//작품 파일 사이즈
			System.out.println("creationF[]Size : "+creationFSize+"byte");
			System.out.println(
				"업로드 성공 =>creationF[]: " + creationF + ", ocreationF: " + ocreationF);

		}catch(IOException ie) {
			System.out.println("업로드 실패: " + ie);
		}
		
		
		String view = "../index.do";
		response.sendRedirect(view);
	}
	*/
	/*
	//Enumeration creationF = mr.getFileNames();
	
	//여기부터 시도(multi)
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());
	Vector<Object> v = new Vector<Object>();
	Enumeration creationS = mr.getFileNames(); //파일명정보를 배열로 만들다

	int nfne = 1; //새파일명에 들어갈 끝 숫자
	int si = 0; //배열의 순서를 얻기 위한 숫자
	while(creationS.hasMoreElements()){ //다음 요소가 있으면 계속 반복
	String name1 = (String)creationS.nextElement(); //파일명정보 Enumeration 의 다음 요소를 name1에 저장한다.
	String creationF = mr.getFilesystemName(name1); 
	String ocreationF = mr.getOriginalFileName(name1);
	String type = mr.getContentType(name1);
	File uf = mr.getFile(name1); //파일 생성 
	long[] asize=null;
	asize[si] = uf.length(); //업로드된 파일의 크기 파악
	si++; //다음 배열의 순서를 얻기 위해 1 증가

	if(creationF == null){ //null 처리

	}
	else{ 
	File f = new File(application.getRealPath("/file/"+creationF)); //업로드된 파일 생성
	int index = creationF.lastIndexOf("."); // 확장자 
	String ext = creationF.substring(index);	//구하기
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddmmss"); //새파일명
	String newname = df.format(new Date()) + nfne + ext ;	// 구하기
	File r = new File(application.getRealPath("/file/"+newname));
	f.renameTo(r); //업로드된 파일명 변환


	v.addElement(newname); //디비에 저장하기 위해 벡터 v에 저장
	v.addElement(ocreationF);
	v.addElement(type);
	nfne++; //새파일명을 시간으로 하니 while문장이 빨리 진행해 1초안에 여러
	//파일이 처리될 수 있다. 그래서 그 구별을 위한 숫자 파일명 맨
	//끝에 붙는다.
	}
	}
	//여기까지 시도함
	*/
	
}
