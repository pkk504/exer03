<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>

<%@page import="models.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MVC</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/css/style.css" />
</head>
<body>
<%
/* String it= "0";
String game="0";
String politic="0";
String culture="0";
String sport="0";
String life="0";
String etc="0";
String food= "0"; */

Account ac= new Account();
List<Map> lll=ac.getissuemoum();
for(int i=0;i<lll.size();i++){
	Map map =lll.get(i);
}



%>

	<div align="center">
		<h1># MVC</h1>
		<div align="right"
			style="margin-right: 10%; margin-left: 10%; font-size: small;">
			<b>blahblah</b>, 로그온 | <a
				href="<%=application.getContextPath()%>/logout.do">로그오프</a>
				 |  <a href="<%=application.getContextPath()%>/index.do">메인</a>
			<hr />
		</div>
			<div align="right"
			style="text-align: right; color: gray; font-size: small; margin-right: 10%; margin-left: 10%;">
			<!-- <b>it :  | game :  | politic :  | culture :  | sport :  | life :  | <small>기타(etc) : </small></b> -->
			<b><%
			for(int i=0;i<lll.size();i++){
				Map map =lll.get(i);
				Object cntt=map.get("CNT");
				if(cntt==null){
					cntt="0";
				}
				%>
			
					<a href="<%=application.getContextPath()%>/categ.do?categori=<%=map.get("CATEGO")%>"><%=map.get("CATEGO")%></a> : <%=cntt%> | 
			<%} %></b>
			
		</div>
		<h2>【토론배틀】</h2>
		<a href="<%=application.getContextPath()%>/issue/new.do"align="right"
			style="margin-right: 10%; margin-left: 10%; font-size: small;">새로작성</a><br/>
			
		<div style="margin-right: 10%; margin-left: 10%; text-align: left">
		<%
		SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
			List<Map> li=ac.getAllissue();
			if(session.getAttribute("list")==null){
			for(int i=0;i<li.size();i++){
			Map map=li.get(i);
		
		
		%>
			<div style="background-color: #EAEAEA; padding: 7px; margin-bottom: 5px;">
				<p style="text-align: right; color: gray; font-size: small;" >
					<%=map.get("WRITER") %>/ <%=map.get("CATE") %>  / <%=fmt1.format(map.get("REGDATE"))%> 
					<%String str=(String)map.get("CONTENT"); %> / 의견개수 : <%=map.get("R") %>
					
					<%
					if(str.length()>10){
						str=str.substring(0, 8)+"....";
					}
					
					%>
					<%-- <%if(str.length()>13){
						str="";
						str+=str.substring(0,10)+"...";
					}
					
					
					%> --%>
				</p>
				<p>
					<b>ISSUE . </b><a href="<%=application.getContextPath()%>/issue/detail.do?no=<%=map.get("NO")%>"><%=str%></a>
					
				</p>
				
			</div>
			
			<%}%>
				
				
				
				
				<%}%>
			
			
		
		</div>
	</div>
	
	<script >
		
		
		
		
		
	</script>
</body>
</html>