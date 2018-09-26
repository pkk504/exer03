<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li>10년을 키운 아이가 내 아이가 아니다.</li>
			</ul>
		</div>
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<h3>최근 등록된 새로운 이슈 ! 
				<i style="font-size: x-small;"><a href="<%=application.getContextPath() %>/issue/trend.do">+ 더보기</a></i></h3>
			<ul>
				<li>24 시간 이내 등록된 이슈가 없습니다</li>
			</ul>
		</div>
		
		<div style="margin-right: 10%; margin-left: 10%;" align="left">
			<hr/>
			<h3>내가 참여한 이슈들
				<i style="font-size: x-small;"><a href="<%=application.getContextPath() %>/issue/trend.do">+ 더보기</a></i></h3>
			<ul>
				<li>24 시간 이내 등록된 이슈가 없습니다</li>
			</ul>
		</div>
	</div>
	
</body>
</html>