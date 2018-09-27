package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;
@WebServlet("/categ.do")
public class Issuecatedetailcontroller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String param = req.getParameter("categori");
		Account ac = new Account();
		
		List li = new ArrayList<>();
		li =ac.getcateissue(param);
		req.setAttribute("allissue", li);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/trend.jsp");
		rd.forward(req, resp);
		
	}
	
}
