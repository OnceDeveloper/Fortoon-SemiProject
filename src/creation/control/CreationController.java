package creation.control;

import java.io.File;
import java.io.IOException;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import creation.model.CreationService;
import creation.vo.ListResult;
import domain.Creation;
import domain.CreationA;
import file.vo.FileSet;

@WebServlet("/creation/creation.do")
public class CreationController extends HttpServlet {
       
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("view")){
				view(request, response);
			}else if(m.equals("del")) {
				del(request, response);
			}else if(m.equals("toon_list")){
				toonList(request, response);
			}else {
				list(request, response);
			}
		}else {
			list(request, response);
		}
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String genre = request.getParameter("genre");
		if(genre != null) genre.trim();
		String division = request.getParameter("division");
		if(division != null) division.trim();
		
		String cpStr = request.getParameter("cp");

		String psStr = request.getParameter("ps");
		HttpSession session = request.getSession();
//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		int ps = 3;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
		CreationService service = CreationService.getInstance();
		ListResult listResult = service.getListResultS(division, genre, cp, ps);
		request.setAttribute("listResult", listResult);
		if(listResult.getList().size() == 0 && cp>1) {
			response.sendRedirect("creation.do?m=list&cp="+(cp-1));
		}else {
			String view = "../main/main.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}
	
	private void toonList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String cr_numS = request.getParameter("cr_num");
		if(cr_numS != null) cr_numS.trim();
		int cr_num = Integer.parseInt(cr_numS);

		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		HttpSession session = request.getSession();
//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		int ps = 3;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
		CreationService service = CreationService.getInstance();
		//ListResult listResult = service.getListResultS(division, genre, cp, ps);
		ListResult listResult = service.getToonListResultS(cr_num, cp, ps);
		System.out.println("cr_num : "+cr_num +", cp test :"+cp+", ps test : "+ps);
		CreationA list = service.listS(cr_num);
		System.out.println("size : "+listResult.getList().size());
		request.setAttribute("list", list);//list라는 이름으로 list의 속성을 저장한다.
		request.setAttribute("listResult", listResult);
		//if(listResult.getList().size() == 0 && cp>1) {
			//response.sendRedirect("creation.do?m=list&cp="+(cp-1));
		//}else {
			String view = "../toon/toon_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		//}
	}

	
	private void view(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String cr_numS = request.getParameter("cr_num");
		if(cr_numS != null) cr_numS.trim();
		int cr_num = Integer.parseInt(cr_numS);
		
		CreationService service = CreationService.getInstance();
		CreationA list = service.listCS(cr_num);
		request.setAttribute("list", list);
		
		String view = "../toon/toon_view.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CreationService service = CreationService.getInstance();
		String seqStr = request.getParameter("seq");
		if (seqStr != null) seqStr = seqStr.trim();
		int seq = Integer.parseInt(seqStr);
		service.delS(seq);
		response.sendRedirect("creation.do");
	}

	
}
