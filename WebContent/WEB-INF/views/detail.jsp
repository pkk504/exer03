<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="models.Account"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%String yes=null; %>
<%Number iii=(Number)1; %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MVC</title>
<%-- <%int agreecnt=0;
	int disagreecnt=0;
	String no=request.getParameter("no");
/* 	System.out.println("들어올때 넘버링 = "+no); */
	
	Account ac= new Account();
	List<Map> li=ac.getnoopi(no);
	Map map=new HashMap();
	
	Map maa=ac.getnofrom(no);
	/* System.out.println("총의견"+li.size()); */
	%> --%>
</head>
<body>
	<div align="center">
		<h1># MVC</h1>
		<div align="right"
			style="margin-right: 10%; margin-left: 10%; font-size: small;">
			<b>blahblah</b>, 로그온 | <a
				href="${pageContext.servletContext.contextPath }/logout.do">로그오프</a> | <a
				href="${pageContext.servletContext.contextPath }/issue/trend.do">목록으로가기</a>
			<hr />
			 
		</div>
		
		
		
		<h2>【토론배틀】</h2>
		<small style="font-style: italic;">찬성이냐, 반대냐 그것이 문제로다!</small>
		<div style="margin-right: 10%; margin-left: 10%; text-align: left;">
			<%-- <%
				String str =(String)maa.get("CONTENT");
				if(str.indexOf("\n") != -1) {
			%>
			<h3>#.<%=str.substring(0, str.indexOf("\n")) %></h3>
			<%	}else {%>
			<h3>#.<%=str %></h3>	
			<%	} %>
			<p>
				<%=str.replace("\n", "<br/>") %>
			</p> --%>
			<c:if test="${!empty requestScope.getnofrom  }">
	<!-- <p style="color:red">
		가입과정에서 문제가 발생했습니다.
	</p> -->
	<h3>${requestScope.getnofrom.CONTENT} </h3>
	<b>${requestScope.getnofrom.CONTENT}</b>
			</c:if>
		</div>
		<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	55px; font-size: small;">
			<p style="color: blue">
				<b>YES</b> <span></span> <%-- <%=maa.get("AGREE") %> <%=request.getAttribute("yes") %> --%> 명 
			</p>
			<p style="color: red">
				<b>NO</b> <span></span><%-- <%=maa.get("DISAGREE") %> <%=request.getAttribute("nooo")%> --%><!-- <span>??</span> -->  명 
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
		
			<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	35px;">
			<b>〔최근 멘트〕</b><br/>
			<ul style="list-style: none; font-size: smaller;" id="abcd">
				<!-- <li><b style="color:blue">YES</b> 우리나라의 소극적 안락사 정도는 필요하다고 생각한다</li>
				
				<li><b style="color:red">NO</b> 인위적으로 사람을 죽이는 일이 허용되야 합니까?</li> -->
			</ul>
			
		</div>
			<p>
				<b>〔전체의견 /<span id="asd"><%-- <%=li.size()%> --%></span> 명〕</b><br/>
			</p>
		<%-- <% for(int i=0;i<li.size();i++){
			map=li.get(i);	
			/* System.out.println(map.get("NO")); */
		
		%> --%>
		<div style="margin-right: 10%; margin-left: 10%; text-align: left; margin-top: 	35px;">
			
			<%-- <%Number aaa=(Number)map.get("CHOICE"); %> --%>
			
			<ul style="list-style: none; font-size: smaller;" id="abcde" >
			<%-- <%if(aaa.toString().equals(iii.toString())) {%>
				<li><b style="color:blue">YES</b> <%=map.get("MENT") %> </li> / <b><small><%=map.get("AADATE") %></small></b>
				
				
				<%} else{%>
				
				<li><b style="color:red">NO</b> <%=map.get("MENT")%></li> / <b><small><%=map.get("AADATE") %></small></b>
			
			<%} %> --%>
			</ul>
			
		</div>
		<%-- <%} %> --%>
		<script>

				var latestAjax=function(){
					var xhr=new XMLHttpRequest();
					var ino =<%=session.getAttribute("no")%>;
					xhr.open("get","coment.do?ino="+ino,true);
					
					xhr.onreadystatechange= function(){
						if(this.readyState==4){
							var obj = JSON.parse(this.responseText.trim());
							//받아온 객체배열을 가지고 원래 찍두던 형태의 HTML을 만들어서
							//위 영역에 innerHTML로 세팅
							var html="";
							/* console.log(obj); */
							for(var q=0 ;q<obj.length; q++){
								var a=obj[q].CHOICE;
								var yesch=obj[q].CHOICE;
								
								console.log("카카카카카="+yesch);
								var b=1;
								console.log(b);
								 if(a==b){ 
									//location.reload();//강제 새로고침기능
								html+="<li><b style=\color:blue\>YES</b>"+obj[q].MENT+"</li>" +"<b><small>"+obj[q].AADATE+"</small></b>" ;
								
								 }else{
									//location.reload();
									html+="<li><b style=\color:red\>NO</b>"+obj[q].MENT+"</li>" +"<b><small>"+obj[q].AADATE+"</small></b>" ;
									 /* document.getElementById("abcde").innerHTML=html;  */
								} 
								
							} 
							document.getElementById("asd").innerHTML=obj.length;
					document.getElementById("abcde").innerHTML=html; 
						}
					}
					xhr.send();
					
				}
				////========================
						var choicement=function(){
					var xhr=new XMLHttpRequest();
					var ino =<%=session.getAttribute("no")%>;
					xhr.open("get","choice.do?ino="+ino,true);
					
					xhr.onreadystatechange= function(){
						if(this.readyState==4){
							var obj = JSON.parse(this.responseText.trim());
							//받아온 객체배열을 가지고 원래 찍두던 형태의 HTML을 만들어서
							//위 영역에 innerHTML로 세팅
							var html="0";
							/* console.log(obj); */
							for(var q=0 ;q<obj.length; q++){
								var a=obj[q].CHOICE;
								var yesch=obj[q].CHOICE;
								
								console.log("카카카카카="+yesch);
							
								var b="y";
								var bb="n";
								
								 if(a==b){ 
									//location.reload();//강제 새로고침기능
									html=obj[q].CNT/* +"<b><small>"+obj[q].AADATE+"</small></b>" */;
								document.getElementsByTagName("span")[0].innerHTML=html;
								
								 }else if(a==bb){
									//location.reload();
									html=obj[q].CNT/* +"<b><small>"+obj[q].AADATE+"</small></b>" */;
									 /* document.getElementById("abcde").innerHTML=html;  */
									 document.getElementsByTagName("span")[1].innerHTML=html;
								}
								
							} 
					
						}
					}
					xhr.send();
					
				}
				
			
			</script>
			<script>
				 var time=1;
				window.setInterval(function(){
					time--;
					if(time==0){
						latestAjax();
						choicement();
						time=5;
					}
				},1000); 
				
			</script>
			
		
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
			/* var param="ment="+a.value+"&choice="+choice; */
			req.open("post","coment.do",true);
					var html="";
				//	req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
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
			var param ={"ment":a.value,"choice":choice};
			var param = JSON.stringify(param)
			console.log(param)
			req.send(param);
		}
	
	</script>
</body>
</html>