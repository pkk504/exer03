<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="models.Account"%>
<%String yes=null; %>
<%Number iii=(Number)1; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MVC</title>
<%int agreecnt=0;
	int disagreecnt=0;
	String no=request.getParameter("no");
	System.out.println("들어올때 넘버링 = "+no);
	
	Account ac= new Account();
	List<Map> li=ac.getnoopi(no);
	Map map=new HashMap();
	
	Map maa=ac.getnofrom(no);
	System.out.println("총의견"+li.size());
	%>
</head>
<body>
	<div align="center">
		<h1># MVC</h1>
		<div align="right"
			style="margin-right: 10%; margin-left: 10%; font-size: small;">
			<b>blahblah</b>, 로그온 | <a
				href="<%=application.getContextPath()%>/logout.do">로그오프</a> | <a
				href="<%=application.getContextPath()%>/issue/trend.do">목록으로가기</a>
			<hr />
		</div>
		
		
		
		<h2>【토론배틀】</h2>
		<small style="font-style: italic;">찬성이냐, 반대냐 그것이 문제로다!</small>
		<div style="margin-right: 10%; margin-left: 10%; text-align: left;">
			<h3>#. <%=maa.get("CONTENT") %></h3>
			<!-- <p>
				안락사 옳은 정책인가<br/>
				무거운 주제이지만 한번 쯤은 고민해볼 문제인것 같습니다.<br/><br/>
				과연 안락사는 옳은 행위입니까?
			</p> -->
		</div>
		<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	55px; font-size: small;">
			<p style="color: blue">
				<b>YES</b> <%=maa.get("AGREE") %> <%=request.getAttribute("yes") %> 명 
			</p>
			<p style="color: red">
				<b>NO</b> <%=maa.get("DISAGREE") %> <%=request.getAttribute("nooo")%><!-- <span>??</span> -->  명 
			</p>
		</div>
		
		<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	55px;">
			<p>
			<b>〔의견남기기〕</b><br/>
			</p>
			<p>
			<select id="choice">
				<option value="1">YES</option>
				<option value="0">NO</option>
			</select>
			<input type="text" style="width: 80%"onchange="str(this);"/>
			</p>
		</div>
		
			<p>
				<b>〔전체의견 / <%=li.size()%> 명〕</b><br/>
			</p>
			<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	35px;">
			
			<ul style="list-style: none; font-size: smaller;" id="abcd">
				<!-- <li><b style="color:blue">YES</b> 우리나라의 소극적 안락사 정도는 필요하다고 생각한다</li>
				
				<li><b style="color:red">NO</b> 인위적으로 사람을 죽이는 일이 허용되야 합니까?</li> -->
			</ul>
		</div>
		<% for(int i=0;i<li.size();i++){
			map=li.get(i);	
			System.out.println(map.get("NO"));
		
		%>
		<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	35px;">
			<%-- <%System.out.println(map.get("CHOICE")); %> --%>
			<%Number aaa=(Number)map.get("CHOICE"); %>
			<%-- <%System.out.println(aaa.toString().equals(iii.toString())); %> --%>
			<%if(aaa.toString().equals(iii.toString())) {%>
			<ul style="list-style: none; font-size: smaller;" >
				<li><b style="color:blue">YES</b> <%=map.get("MENT") %> </li> / <b><small><%=map.get("AADATE") %></small></b>
				</ul>
				<%agreecnt++; %>
				<%} else{%>
				<ul style="list-style: none; font-size: smaller;" >
				<li><b style="color:red">NO</b> <%=map.get("MENT")%></li> / <b><small><%=map.get("AADATE") %></small></b>
			</ul>
			<%disagreecnt++; %>
			<%} %>
		</div>
		<%} %>
		
		<!-- <div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	35px;">
			
			<ul style="list-style: none; font-size: smaller;" id="abcd">
				<li><b style="color:blue">YES</b> 우리나라의 소극적 안락사 정도는 필요하다고 생각한다</li>
				
				<li><b style="color:red">NO</b> 인위적으로 사람을 죽이는 일이 허용되야 합니까?</li>
			</ul>
		</div> -->
	</div>
	
	<script>
		var str=function(a){
			
			var req = new XMLHttpRequest();
			var choice=document.getElementById("choice").value;
			
			req.open("get","coment.do?ment="+a.value+"&choice="+choice,true);
					var html="";
			req.onreadystatechange= function() {
				if(this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					var a=obj.choice;
					var b=1;
					if(a==b){
						//location.reload();//강제 새로고침기능
					html+="<li><b style=\color:blue\>YES</b>"+obj.ment+"</li>"+"<b><small>"+obj.date+"</small></b>";
					document.getElementById("abcd").innerHTML=html;
					}else{
						//location.reload();
						html+="<li><b style=\color:red\>NO</b>"+obj.ment+"</li>"+"<b><small>"+obj.date+"</small></b>";
						document.getElementById("abcd").innerHTML=html;
					}
					
				}
			}
			req.send();
		}
	
	</script>
</body>
</html>