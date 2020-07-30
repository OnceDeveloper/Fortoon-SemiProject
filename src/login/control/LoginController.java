package login.control;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import login.model.LoginService;
import login.model.LoginSet;
import domain.Member;

@WebServlet("/login/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
	private String m = "form";
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("form")) {
				form(request, response);
			}else if(m.equals("check")) {
				check(request, response);
			}else if(m.equals("out")) {
				out(request, response);
			}
		}else {
			response.sendRedirect("../index.do");
		}
	}
	private void form(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "login.jsp";
		response.sendRedirect(view);
	}
	private void check(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if(id != null) id = id.trim();
		
		String pwd = request.getParameter("pwd");
		if(pwd != null) pwd = pwd.trim();
		
		
		LoginService service = LoginService.getInstance();
		//Member member = service.checkS(id);
		int rCode = service.checkMember(id, pwd);
		
		request.setAttribute("rCode", rCode);
		
		if(rCode == LoginSet.PASS) {
			HttpSession session = request.getSession();
			Member loginUser = service.getMemberS(id);
			session.setAttribute("id", id);
			session.setAttribute("loginUser", loginUser);
		}
		String view = "check.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);//getRequestDispatcher의 역할 : rd의 forward메소드를 쓰기 위해서
		rd.forward(request, response);

	}
	private void out(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//session.removeAttribute("loginUser");
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		//String view = "index.jsp";
		response.sendRedirect("../index.do");
	}
}
