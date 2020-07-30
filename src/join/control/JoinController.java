package join.control;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.text.SimpleDateFormat;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import join.model.JoinService;
import join.model.*;
import domain.Member;

@WebServlet("/join/join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String m = "";
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("insert")) {
				insert(request, response);
			}
			
			if(m.equals("update")) {
				update(request, response);
			}
			
			if(m.equals("findID")) {
				findID(request, response);
			}
						
			if(m.equals("findPWD")) {
				findPWD(request, response);
			}
			
			if(m.equals("idCheck")) {
				idCheck(request, response);
			}
			if(m.equals("idCheck2")) {
				idCheck2(request, response);
			}
			
			if(m.equals("del")) {
				del(request, response);
			}
			
			
		}else {
			response.sendRedirect("../index.do");
		}
	}
	

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JoinService service = JoinService.getInstance();
				
		String m_id = request.getParameter("m_id");
		String name = request.getParameter("name");
		String brith = request.getParameter("brith");
		String phone = request.getParameter("phone");	
		String pwd = request.getParameter("pwd");
		
		System.out.println("m_id :"+ m_id);
		System.out.println("name :"+ name);
		System.out.println("brith :"+ brith);
		System.out.println("phone :"+ phone);
		System.out.println("pwd :"+ pwd);
		
		Member member = new Member(m_id, name, brith, phone, pwd);
		boolean flag = service.insertS(member);
		request.setAttribute("flag", flag);
		String view = "insert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String m_id = request.getParameter("m_id");
		String name = request.getParameter("name");
		String brith = request.getParameter("brith");
		String phone = request.getParameter("phone");	
		String pwd = request.getParameter("pwd");
		
		JoinService service = JoinService.getInstance();
		
		Member member = new Member(m_id, name, brith, phone, pwd);
		boolean flag = service.updateS(member);
		
		request.setAttribute("result", flag);
		request.setAttribute("kind", "update");
		
				
		String view = "../join/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	

		private void del(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			JoinService service = JoinService.getInstance();
			
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			if(loginUser != null) {
				service.delS(loginUser.getM_id());
				session.invalidate();	

				response.sendRedirect("http://localhost:8080/Fortoon/join/msgdel.jsp");
				
			}
		}
		
		private void findID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			if(name != null) name = name.trim();
			if(phone != null) phone = phone.trim();

		    System.out.println("name: " + name);
		    System.out.println("phone: " + phone);
			JoinService service = JoinService.getInstance();
		    String m_id = service.findID(name, phone);
		    
		    
		 
		    System.out.println("1");
		    System.out.println("m_id: " + m_id);
	
			HttpSession session = request.getSession();
			session.setAttribute("FoundID", m_id);
			String view = "foundID.jsp";
			response.sendRedirect(view);
		}
		
		
		private void findPWD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			if(name != null) name = name.trim();
			if(phone != null) phone = phone.trim();

		    System.out.println("name: " + name);
		    System.out.println("phone: " + phone);
			JoinService service = JoinService.getInstance();
		    String pwd = service.findPWD(name, phone);
		    
		    
		 
		    System.out.println("1");
		    System.out.println("pwd: " + pwd);
	
			HttpSession session = request.getSession();
			session.setAttribute("FoundPWD", pwd);
			String view = "foundPWD.jsp";
			response.sendRedirect(view);
		}
		

		
	private void idCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JoinService service = JoinService.getInstance();
				
		String m_id = request.getParameter("m_id");
		
//		int cnt = dao.duplecate(m_id);
		
		String name = request.getParameter("name");
		String brith = request.getParameter("brith");
		String phone = request.getParameter("phone");	
		String pwd = request.getParameter("pwd");

		
		Member member = new Member(m_id, name, brith, phone, pwd);
		boolean flag = service.insertS(member);
		request.setAttribute("flag", flag);
		String view = "check.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	


	private void idCheck2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JoinService service = JoinService.getInstance();
				
		String m_id = request.getParameter("m_id");
		boolean flag = service.idCheckS2(m_id);
		System.out.println(flag);
		request.setAttribute("flag", flag);
		request.setAttribute("m_id", m_id);
		String view ="idCheckProc.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}




}