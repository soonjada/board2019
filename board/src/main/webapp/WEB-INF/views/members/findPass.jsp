<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>


<script type="text/javascript">
var ckk=false;
ck = ${ckk};
if(ck==true){
	ckk=false;
	location.href="logout";
	window.close();
}
</script>
<br />
<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
<!-- <a href="javascript:close_session()">홈화면 돌아가기</a><br /><br /> -->
	<form role="form" name="formm" method="post" autocomplete="off">
		
<!--  -->

	<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">ID</span>
			</div>
			<input type="text" id="userId" name="userId" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" value="${member.userId}" readonly="readonly"/>
			
		</div>

		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
			</div>
			<input type="password" id="userPass" name="userPass" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" />
			
		</div>


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호 확인</span>
			</div>
			<input type="password" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="userPassck"
				name="userPassck" />
		</div>


		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p>
			<input type="button" onclick="find_pass()" class="btn btn-warning" value="비밀번호 변경" />
		</p>
		
		</div>
		
		<!--  -->
		
		
		
		

	</form>
</div>
	<script type="text/javascript">
	
	function close_session() {
		
		location.href="/members/logout"
	}
	
		function find_pass() {
			/* alert(document.formm.userPass.value);
			alert(document.formm.userPassck.value); */
			
			if(document.formm.userPass.value != document.formm.userPassck.value){
				alert("비밀번호를 확인해주세요");
			}else if(document.formm.userPass.value.length < 2) {
				alert("비밀번호는 2자 이상입니다.");
				return false;
			}else{
				alert("비밀번호를 변경하였습니다.");
				document.formm.submit();
			}
			
			/* document.formm.submit(); */
		}
	
	
		
	</script>

<%@include file="../footer.jsp" %>