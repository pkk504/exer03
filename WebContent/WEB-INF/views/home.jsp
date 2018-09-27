<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="models.IssueDao"%>
<%@page import="models.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%--   <%SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss"); 
    Account issu=new Account();%>
    <%List qqq=(List)session.getAttribute("gethotissue");
    request.setAttribute("gethotissue1", qqq.size()-1);
    	List www=(List)session.getAttribute("getdateissue");
    request.setAttribute("getdateissue1", www.size()-1);
    	List eee=(List)session.getAttribute("getmycoment");
    request.setAttribute("getmycoment1", eee.size()-1);
   /*  System.out.println(request.setAttribute("gethotissue1", qqq.size())); */
    %>
    <%
    System.out.println(request.getAttribute("getdateissue1"));
    %>
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MVC</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/style.css" />
</head>
<body>
	<div align="center">
		<h1># MVC</h1>
		<div align="right" style="margin-right: 10%; margin-left: 10%; font-size: small;">
			<b><%-- <%=session.getAttribute("id") %> --%>${sessionScope.id }</b>,  로그온 |
			<a href="${pageContext.servletContext.contextPath }/logout.do">로그오프</a>
			
			<hr/>
		</div>
		<div style="margin-right: 10%; margin-left: 10%;">
			<form action="${pageContext.servletContext.contextPath }/search.do">
				<input type="text" style="width:98%;" placeholder="search keyword"/>
			</form>
		</div>
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<h3>가장 뜨거운 이슈 ! 
				<i style="font-size: x-small;"><a href="${pageContext.servletContext.contextPath }/issue/trend.do">+ 더보기</a></i></h3>
	
			<ul>
			
			<c:choose>
		<c:when test="${!empty sessionScope.gethotissue }">
	<%-- 		<c:forEach var="i" begin="0" end="${requestScope.gethotissue1 }" step="1">
	<li>	작성자 : ${sessionScope.gethotissue[i].WRITER} / Cate : ${sessionScope.gethotissue[i].CATE} / 의견수 : ${sessionScope.gethotissue[i].R} / 내용 : <a href="${pageContext.servletContext.contextPath }/issue/detail.do?no=${sessionScope.gethotissue[i].NO}">${sessionScope.gethotissue[i].CONTENT} </a> /  <b><small>${sessionScope.gethotissue[i].REGDATE}</small></b >    </li>                 
	</c:forEach> --%>
			<c:forEach var="i" items="${sessionScope.gethotissue}" >
	<li>	작성자 : ${i.WRITER}  / Cate : ${i.CATE} / 의견수 : ${i.R} / 내용 : <a href="${pageContext.servletContext.contextPath }/issue/detail.do?no=${i.NO}">${i.CONTENT} </a> /  <b><small>${i.REGDATE}</small></b >    </li>                
	</c:forEach> 
		</c:when>
		
		<c:otherwise>
			<li>등록된 이슈가 없습니다</li>
		</c:otherwise>
		
	</c:choose>
			
			
			
			
			</ul> 
				
				
			
			
				
		</div>
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<h3>최근 등록된 새로운 이슈 ! 
				<i style="font-size: x-small;"><a href="${pageContext.servletContext.contextPath }/issue/trend.do">+ 더보기</a></i></h3>
			
				<ul>
			<c:choose>
		<c:when test="${!empty sessionScope.getdateissue }">
	<%-- 		<c:forEach var="i" begin="0" end="${requestScope.getdateissue1 }" step="1">
	<li>	작성자 : ${sessionScope.getdateissue[i].WRITER} / Cate : ${sessionScope.getdateissue[i].CATE} / 내용 : <a href="${pageContext.servletContext.contextPath }/issue/detail.do?no=${sessionScope.getdateissue[i].NO}">${sessionScope.getdateissue[i].CONTENT} </a>   /  <b><small>${sessionScope.gethotissue[i].REGDATE}</small></b >    </li>                 
	</c:forEach> --%>
	<c:forEach var="e" items="${sessionScope.getdateissue}">
	<li>	작성자 : ${e.WRITER} / Cate : ${e.CATE} / 내용 : <a href="${pageContext.servletContext.contextPath }/issue/detail.do?no=${e.NO}">${e.CONTENT} </a>   /  <b><small>${e.REGDATE}</small></b >    </li>                 
	</c:forEach> 
		</c:when>
		
		<c:otherwise>
			<li>등록된 이슈가 없습니다</li>
		</c:otherwise>
		
	</c:choose>
		
			</ul> 
		</div>
		
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<hr/>
			<h3>내가 참여한 이슈들
				<i style="font-size: x-small;"><a href="${pageContext.servletContext.contextPath }/issue/trend.do">+ 더보기</a></i></h3>
			
						<ul>
			<c:choose>
		<c:when test="${!empty sessionScope.getmycoment }">
		<%-- 	<c:forEach var="i" begin="0" end="${requestScope.getmycoment1 }" step="1">
	<li>	작성자 : ${sessionScope.getmycoment[i].WRITER} / Cate : ${sessionScope.getmycoment[i].CATE} / 내용 : <a href="${pageContext.servletContext.contextPath }/issue/detail.do?no=${sessionScope.getmycoment[i].NO}">${sessionScope.getmycoment[i].CONTENT} </a>   /  <b><small>${sessionScope.getmycoment[i].REGDATE}</small></b >    </li>                 
	</c:forEach> --%>
		<c:forEach var="q" items="${sessionScope.getmycoment }">
	<li>	작성자 : ${q.WRITER} / Cate : ${q.CATE} / 내용 : <a href="${pageContext.servletContext.contextPath }/issue/detail.do?no=${q.NO}">${q.CONTENT} </a>   /  <b><small>${q.REGDATE}</small></b >    </li>                 
	</c:forEach>
		</c:when>
		
		<c:otherwise>
			<li>등록된 이슈가 없습니다</li>
		</c:otherwise>
		
	</c:choose>
		
			</ul> 
		</div>
	</div>
	
</body>
</html>