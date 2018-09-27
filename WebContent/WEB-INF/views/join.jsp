<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MVC</title>

</head>
<body>
<%
	String qqq=(String)request.getAttribute("id");
	String qqqq=(String)request.getAttribute("pass");
	String qqqqq=(String)request.getAttribute("name");
	

%>
	<%--
		mvc pattern 의 application 에서는 
		action 이나 link , ajax 목적지를 controller 매핑경로로 설정
	 --%>
	<div align="center">
		<h1>〔회원가입〕</h1>
		<div style="margin-left: 10%; margin-right: 10%; text-align: left;">
		
		<h3 style="color: blue;">Step1.당신의 계정을 생성하세요.</h3>
		<h3 style="color: silver;">	Step2.당신의 관심사항을 설정하세요.</h3>
		<form action="join.do" method="post" autocomplete="off" >
			<p>
				<b>아이디(*)</b><br/>
				<input type="text" name="id" placeholder="account id" style="width: 99%;"onkeyup="str(this);"value="<%if(qqq!=null){%><%=qqq%><%}%>"/>   <small id="ha"></small>
			
			</p>
			<p>
				<b>비밀번호(*)</b><br/>	
				<input type="password" name="pass" placeholder="account pass" style="width: 99%;"id="keykey"value="<%if(qqqq!=null){%><%=qqqq%><%}%>"/> 
			</p>
			<p>
				<b>비밀번호 재확인(*)</b><br/>	
				<input type="password" name="passs" placeholder="confirm pass" style="width: 99%;"onkeyup="sts(this);"/> <small id = "haa"></small>
			</p>
			<p>
				<b>이름(*)</b><br/>	
				<input type="text" name="name" placeholder="user name" style="width: 99%;"onkeyup="strr(this);"value="<%if(qqqqq!=null){%><%=qqqqq%><%}%>"/> <small id=haaa></small>
			</p>
			<p>
				<b>성별(*)</b><br/>	
				<select name="gender" style="width: 100%;">
					<option value="남">남성</option>
					<option value="여">여성</option>
				</select>
			</p>
			<p>
				<button type="submit" style="width: 100%;">가입 신청</button>
			</p>
		</form>
		</div>
	</div>
	
		<script>
		var sts=function(c){
			var cc=c.value;
			var ss=document.getElementById("keykey").value;
			if(cc.includes(ss)==true){
				document.getElementById("haa").innerHTML = "비밀번호가 일치합니다..";
				document.getElementById("haa").style.color = "green";
			}else{
				document.getElementById("haa").innerHTML = "비밀번호가 일치합니다..";
				document.getElementById("haa").style.color = "red";
			}
			
		}
		
		
		
		
		
		var str= function(a){
			var aa=a.value;
			var r1= new RegExp(/^[a-z]{1,1}\w{3,11}$/);
			if(r1.test(aa)==true){
				document.getElementById("ha").innerHTML = "사용가능한 ID입니다..";
				document.getElementById("ha").style.color = "green";
				var req = new XMLHttpRequest();
				console.log(a.value);
				req.open("get", "sighnup_check.do?id="+a.value, true);
				req.onreadystatechange= function() {
					if(this.readyState == 4) {
						var obj = JSON.parse(this.responseText);
						var html = "";
						var idd=obj.ID;
						if(idd.includes(aa)==true){
						document.getElementById("ha").innerHTML = "중복된 ID입니다.";
						document.getElementById("ha").style.color = "red";
						}
						
					}
					
				}
				
				req.send();
				
			}else{
				
				document.getElementById("ha").innerHTML = "패턴에 맞지않는 않습니다.";
				document.getElementById("ha").style.color = "red";
			}
		}
			
			
			
			
			var strr=function(b){
				var bb=b.value; 
				var r2 =new RegExp(/^[가-힇]{3,8}$/);
				
				if(r2.test(bb)==true){
					document.getElementById("haaa").innerHTML = "사용가능한 닉네임입니다..";
					document.getElementById("haaa").style.color = "green";
					
				/* 	req.open("get","sighnup_check.do?name="+b.value, true);
					req.onreadystatechange=function(){
					if(this.readyState==4){
						var obj=JSON.parse(this.responseText);
						var nickname=obj.NAME;
						if(nickname.includes(bb)==true){
							document.getElementById("haaa").innerHTML = "중복된 닉네임입니다.";
							document.getElementById("haaa").style.color = "red";
						}
						
					}		
					}
					req.send(); */
				}else{
					document.getElementById("haaa").innerHTML = "패턴에 맞지않는 않습니다.";
					document.getElementById("haaa").style.color = "red";
				}
				
				
				
			}
			
			
			
			
			//=================
		/* 	var req = new XMLHttpRequest();
			console.log(a.value);
			req.open("get", "sighnup_check.do?id="+a.value, true);
			req.onreadystatechange= function() {
				if(this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					var html = "";
					console.log(obj);
					obj.ID
					document.getElementById("some").innerHTML = html;
					
				}
				
			}
			
			req.send(); */
		
		
	</script>
	
	
</body>
</html>