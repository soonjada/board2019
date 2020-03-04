<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>


<script type="text/javascript">
var ck=false;
ck = ${ck};
if(ck==true){
	window.open("findPass","userPass", "width=500, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
	ck=false;
}
</script>
<br />
<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
<a href="javascript:logout()">홈화면 돌아가기</a><br /><br />
	<form role="form" name="formm2" method="post" autocomplete="off">
		
<!--  -->

<div class="input-group input-group-sm mb-3">
			<!-- <div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">ID</span>
			</div> -->
			<input type="hidden" id="userId" name="userId" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" value="" />
			
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">닉네임</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="userName"
				name="userName" />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">email</span>
			</div>
			<input type="text" id="email" name="email" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" />
			
		</div>


		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p>
			<input type="button" onclick="find_user2()" class="btn btn-warning" value="아이디 찾기" />
		</p>
		
		</div>
		
		<!--  -->
		
		<c:if test="${msgg == false }">
		<p style="color:red"> 일치한 회원정보가 없습니다.  </p>
	</c:if> 
	<c:if test="${id != null }">
		<p style="color:blue;"> 고객님의 ID는  ${id.userId} 입니다. </p>
	</c:if> 
		
	</form>
	
	<form role="form" name="formm" method="post" autocomplete="off">
		
<!--  -->

		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">ID</span>
			</div>
			<input type="text" id="userId" name="userId" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" />
			
		</div>


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">닉네임</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="userName"
				name="userName" />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">email</span>
			</div>
			<input type="text" id="email" name="email" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" />
			
		</div>


		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p>
			<input type="button" onclick="find_user()" class="btn btn-warning" value="비밀번호 찾기" />
		</p>
		
		</div>
		
		<!--  -->
		
		<c:if test="${msg == false }">
		<p style="color:red"> 일치한 회원정보가 없습니다.  </p>
	</c:if> 
		
	</form>
</div>
	<script type="text/javascript">
	
		function find_user() {
			  
			document.formm.submit();
		}
		
		function find_user2() {
			
			document.formm2.submit();
		}
	
		function logout(){
			location.href="logout";
		}
		
	</script>

<%@include file="../footer.jsp" %>