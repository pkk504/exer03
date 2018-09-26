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
			<b>it :  | game :  | politic :  | culture :  | sport :  | life :  | <small>기타(etc) : </small></b>
			
		</div>
		
		<h2>【토론배틀】</h2>
		<a href="<%=application.getContextPath()%>/issue/new.do"align="right"
			style="margin-right: 10%; margin-left: 10%; font-size: small;">새로작성</a><br/>
			
		<div style="margin-right: 10%; margin-left: 10%; text-align: left">
		<%Account ac= new Account();
		SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
			List<Map> li=ac.getAllissue();
			for(int i=0;i<li.size();i++){
			Map map=li.get(i);
		
		
		%>
			<div style="background-color: #EAEAEA; padding: 7px; margin-bottom: 5px;">
				<p style="text-align: right; color: gray; font-size: small;" >
					<%=map.get("WRITER") %>/ <%=map.get("CATE") %>  / <%=fmt1.format(map.get("REGDATE"))%> 
					<%String str=(String)map.get("CONTENT"); %> 
					
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
			
			<%} %>
			
		
		</div>
	</div>
	
	<script >
		
		
		
		
		
	</script>
</body>
</html>