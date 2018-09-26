package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Account;

@WebServlet("/issue/choice.do")
public class Choicecontroller extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		HttpSession session = req.getSession();
		Account ac =new Account();
		String ino=(String)session.getAttribute("no");
		
		
		PrintWriter out= resp.getWriter();
		
		
		List<Map> li=ac.getchoice11(ino);
		
	
		Gson gson =new Gson();
		String qqq=gson.toJson(li);
		System.out.println(qqq);
		out.print(qqq);
		
		
		
		
		
		
	}
		
		
	
}
