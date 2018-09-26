package controllers;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;

 import java.util.*;
import com.google.gson.*;

@WebServlet("/sighnup_check.do")
public class SignUpCheckController extends HttpServlet{
	
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//이 컨트롤러에서 처리결과를 보내는데 ajax의 결과물인 json을 보내야 된다면
			
			
			
			
			
			
			resp.setContentType("application/json;charset=utf-8");
			String id=req.getParameter("id");
			String name=req.getParameter("name");
			Account ac=new Account();
			Map map=ac.getidname(id);
			/*String aa=(String)map.get("ID");
			String bb=(String)map.get("NAME");*/
			String trueid=null;
			String truename=null;
			
			Gson gson=new Gson();
			String abc=gson.toJson(map);
			if(id!=null) {
			PrintWriter out= resp.getWriter();
			out.println(abc);
			}
			
			
			/*Map np= ac.getname(name);
			String abcc=gson.toJson(np);
			
			
			PrintWriter out= resp.getWriter();
			out.println(abcc);
		System.out.println(abcc);*/
			
			
			/*if(Math.random()>0.5)
				out.println(true);
			else
				out.println(false);
		}*/
			
			
			
			
		
	
}
		
		
		
}
