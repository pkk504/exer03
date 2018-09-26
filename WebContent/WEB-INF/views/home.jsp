<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="models.IssueDao"%>
<%@page import="models.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss"); 
    Account issu=new Account();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MVC</title>
<link rel="stylesheet" href="<%=application.getContextPath()%>/css/style.css" />
</head>
<body>
	<div align="center">
		<h1># MVC</h1>
		<div align="right" style="margin-right: 10%; margin-left: 10%; font-size: small;">
			<b><%=session.getAttribute("userId") %></b>,  로그온 |
			<a href="<%=application.getContextPath() %>/logout.do">로그오프</a>
			
			<hr/>
		</div>
		<div style="margin-right: 10%; margin-left: 10%;">
			<form action="<%=application.getContextPath() %>/search.do">
				<input type="text" style="width:98%;" placeholder="search keyword"/>
			</form>
		</div>
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<h3>가장 뜨거운 이슈 ! 
				<i style="font-size: x-small;"><a href="<%=application.getContextPath() %>/issue/trend.do">+ 더보기</a></i></h3>
				<ul>
				<% List<Map> lii =issu.gethotissue();
				if(lii!=null){
				for(int ii=0;ii<lii.size();ii++){
					Map mapp=lii.get(ii);%>
					
				<% 	String str=(String)mapp.get("CONTENT");
					if(str.length()>10){
						str=str.substring(0, 8)+"....";
					}%> 
					
					
					
				<li>
			작성자 : <%=mapp.get("WRITER") %>/ Cate :  <%=mapp.get("CATE") %>  / 의견수 : <%=mapp.get("R") %>  /  내용 : / <a href="<%=application.getContextPath()%>/issue/detail.do?no=<%=mapp.get("NO")%>"><%=str%></a> /  <b><small><%=fmt1.format(mapp.get("REGDATE"))%></small></b ></li> 
					
					
				<%}}else{%>
				<li>등록된 이슈가 없습니다</li>
				<%} %>
			</ul>
				
				
			
			
				
		</div>
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<h3>최근 등록된 새로운 이슈 ! 
				<i style="font-size: x-small;"><a href="<%=application.getContextPath() %>/issue/trend.do">+ 더보기</a></i></h3>
				<%
				
				List<Map> li=issu.getdateissue();
				if(li!=null){
				for(int i=0; i< li.size(); i++){
					
					Map map = new HashMap();
					map = li.get(i);
				%>
					<%
					String str=(String)map.get("CONTENT");
					if(str.length()>10){
						str=str.substring(0, 8)+"....";
					}%> 
					
					
					
				<li>
			작성자 : <%=map.get("WRITER") %>/ Cate :  <%=map.get("CATE") %>  / 내용 : / <a href="<%=application.getContextPath()%>/issue/detail.do?no=<%=map.get("NO")%>"><%=str%></a> / <b><small><%=fmt1.format(map.get("REGDATE"))%></small></b></li> 
					
					<%-- <%if(str.length()>13){
						str="";
						str+=str.substring(0,10)+"...";
					}
					
					
					%> --%>
				</p>
				
			<%} }else{%>
			
				<ul>
				<li>24 시간 이내 등록된 이슈가 없습니다</li>
			</ul>
			<%}%>
		</div>
		
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<hr/>
			<h3>내가 참여한 이슈들
				<i style="font-size: x-small;"><a href="<%=application.getContextPath() %>/issue/trend.do">+ 더보기</a></i></h3>
			<ul>
			<%List<Map> la =issu.getMycoment((String)session.getAttribute("id")); 
			
				if(la!=null){		
					for(int i=0;i<la.size();i++){
					Map mo=new HashMap();
					mo=la.get(i);
					%>
						<%
					String str=(String)mo.get("MENT");
					if(str.length()>10){
						str=str.substring(0, 8)+"....";
					}%> 
				
					
					
				<li>
			게시글 제목 :<%=mo.get("CONTENT")%>  / Cate :  <%=mo.get("CATE") %>  / 댓글 내용 : / <a href="<%=application.getContextPath()%>/issue/detail.do?no=<%=mo.get("INO")%>"><%=str%></a> / <b><small><%=fmt1.format(mo.get("AADATE"))%></small></b></li> 
					
					<%if(i==2){
						break;
						
					}%>
					
					
					
			
				<%} %>
				
				<%} else{%>
				<li>24 시간 이내 등록된 이슈가 없습니다</li>
				<%} %>
			</ul>
		</div>
	</div>
	
</body>
</html>