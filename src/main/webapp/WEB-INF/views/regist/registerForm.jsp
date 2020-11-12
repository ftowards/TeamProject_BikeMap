<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	.container{overflow:hidden;}
	#label{width : 36%; margin-right : 4%}
	#label li{text-align : right; font-size : 1.2em; font-weight: bold;}
	#input{width : 60%;}
	form>div{float:left;}
	form li{height : 50px; line-height : 50px;}
	
	#input input[type=text],input[type=password], select{height : 24px; font-size:.9em}
	#input li{height : 50px; font-size:1.1em;}
	#buttons{width : 100%; height : 80px; overflow:auto; line-height : 50px; text-align : center; margin-top : 25px;}
	.button{border : #00B0B0 2px solid; background-color : white ; border-radius: 8px;
			text-decoration: none; text-align : center; font-size : 16px; padding : 12px 24px;
			margin : 0 10px; color: #00B0B0}
	.button:hover{color : white; background-color: #00B0B0}
	
	#idChk{font-size : 12px; padding : 6px 12px;}
	.reg{color:#55CBF5; font-size : 12px; font-weight:bold;}
</style>
<script>
	$(function(){
		$("#datepicker").datepicker({
			changeYear : true,
			changeMonth : true,
			constraintInput : true,
			dateFormat : "yy-mm-dd",
			dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin : ['일','월','화','수','목','금','토'],
			monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			yearRange : "1950:2010"
		});
		
		var idChk = "N";
		var regId = /^[A-Za-z]{1}\w{7,11}$/ ;
		var regName = /^[가-힣]{2,5}$/ ;
		
		
		// 아이디 중복 검사 로직
		// 아이디 정규식 체크	
		$("#idChk").click(function(){
			
			idChk = "Y";
		});
		
		// 아이디 칸 입력 시 중복 체크 여부는 초기화
		$("#userid").keydown(function(){
			idChk = "N";
		});
		
		$("#domainSelect").on({'change' : function(){
			$("#email2").val($("#domainSelect").val());
		}});
		
		
		// 입력사항 체크
		$("#registerForm").submit(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력하세요.");
				return false;
			} 
			
			if(idChk != "Y"){
				alert("아이디 중복 체크를 하세요.");
				return false;
			}
			
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if($("#userpwdChk").val()==""){
				alert("비밀번호 확인을 입력하세요.");
				return false;
			}else if($("#userpwd").val() != $("#userpwdChk").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if($("#username").val()==""){
				alert("이름을 입력하세요.");
				return false;
			}else if(!regName.test($("#username").val())){
				alert("이름은 한글로 2~5자 사이로 입력해주세요.");
				return false;
			}
			
			if($("#email1").val()=="" || $("#email2").val=="" ){
				alert("이메일을 입력하세요.");
				return false;
			}
			
			if($("#datepicker").val()==""){
				alert("생일을 선택하세요.");
				return false;
			}
			
			
			var url = "/home/registerFormOk"
			var data = $("#registerForm").serialize();
			$.ajax({
				type : 'POST',
				url : url,
				data : data,
				success : function(result){
					if(result > 0){
						alert("회원 가입 완료")
						location.href="/home/registWelcome";
					} else{
						alert("회원가입에 실패하였습니다.");
					}
				},error: function(){
					console.log("회원 가입 오류");
				}
			});
			return false;
		});
	});
	
</script>
<div class="container">
	<form id="registerForm" method="post" action="<%=request.getContextPath()%>/registerFormOk">
		<div id = "label">
			<ul>
				<li>아이디</li>
				<li>비밀번호</li>
				<li>비밀번호 확인</li>
				<li>이  름</li>
				<li>이메일</li>
				<li>성  별</li>
				<li>생년월일</li>
			</ul>
		</div>
		<div id="input">
			<ul>
				<li><input type="text" name="userid" id="userid" maxlength="12" size="12"/><input type="button" class="button" id="idChk" value="중복검사"/>
					<span class="reg">8~12자 영문(시작)/숫자/_ 사용</span></li>
				<li><input type="password" name="userpwd" id="userpwd" maxlength="12" size="20"/>
					<span class="reg">8~12자리 영문/숫자/특수문자 사용</span></li>
				<li><input type="password" name="userpwdChk" id="userpwdChk" maxlength="12" size="20"/></li>
				<li><input type="text" name="username" id="username" maxlength="5" size="20"/>
					<span class="reg">한글로 최대 5자까지 입력</span></li>
				<li><input type="text" name="email1" id="email1" size="6"/>@<input type="text" id="email2" name="email2" size="6"/>
					<select id="domainSelect">
						<option value="" selected>직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hotmali.com">hotmail.com</option>
					</select></li>
				<li><input type="radio" name="gender" id="gender" value="1"/>남 자
					<input type="radio" name="gender" id="gender" value="2" checked/>여 자</li>
				<li><input type="text" name="birth" id="datepicker" maxlength="10"/>
					<span class="reg">ex)1980-12-03</span></li>			
			</ul>
		</div>
		<div id="buttons">
			<input type="submit" class = "button" value="회원가입"/>
			<input type="reset" class = "button" value="다시쓰기"/>
		</div>
	</form>
</div>