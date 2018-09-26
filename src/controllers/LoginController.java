package controllers;

import java.io.IOException;
import java.util.*;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import models.Account;
@WebServlet("/login.do")
public class LoginController extends HttpServlet{


@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session= req.getSession();
	if(session.getAttribute("auth")==null) {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
		rd.forward(req, resp);
	}else {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/trend.jsp");
		rd.forward(req, resp);
	}
	/*String id=req.getParameter("ckid");
	String pass = req.getParameter("ckpass");
	Map mp=new HashMap<>();

	
	
		HttpSession session = req.getSession();
		
		Account ac=new Account();
		
		Map map=ac.getidpass(id);
		
		String ckid=(String)map.get("ID");
		String ckpass=(String)map.get("PASS");
		if(map!=null) {
		if(ckid.equals(id)&&ckpass.equals(pass)) {
			session.setAttribute("auth", "pass");
			
		}
		}else {
			session.setAttribute("auth", null);
		}
	
		
		
			
		
		
		if(session.getAttribute("auth") == null) {
			resp.sendRedirect(req.getContextPath()+"/session.do");
		} else {
			resp.sendRedirect(req.getContextPath()+"/index.do");
			
		}*/
	
	
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


