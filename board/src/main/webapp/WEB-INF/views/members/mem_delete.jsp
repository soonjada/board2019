<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../header.jsp" %>

<br />

<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>

		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
	<br />
	 <h5>${member.userName} 님 환영합니다.</h5>
		<a href="../">홈화면 돌아가기</a><br /><br />
	</div>

	
	<form role="form" name="formm" method="post" autocomplete="off">
		<%-- <p>
			<label for="userId">아이디</label> <input type="text" id="userId"
				name="userId" value="${member.userId}" readonly="readonly" />
		</p>
		<p>
			<label for="userName">닉네임</label> <input type="text" id="userName"
				name="userName" value="${member.userName}" readonly="readonly" />
		</p>
		<p>
			<label for="userPass">패스워드</label> <input type="password"
				id="userPass" name="userPass" /> <label for="userPass">패스워드확인</label>
			<input type="password" id="userPass_ck" name="userPass_ck" />
		</p> --%>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">ID</span>
			</div>
			<input type="text" id="userId" name="userId" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" value="${member.userId}" readonly="readonly">
			
		</div>


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">닉네임</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="userName"
				name="userName" value="${member.userName}" readonly="readonly" />
		</div>


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
			</div>
			<input type="password" class="form-control" aria-label="With textarea"
				cols="50" rows="5" id="userPass" name="userPass" />
				
				<!-- <div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호 확인</span>
			</div>
			<input type="password" class="form-control" aria-label="With textarea"
				cols="50" rows="5" id="userPass_ck" name="userPass_ck" /> -->


		</div>
		
		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
		<p>
	
			<input type="button" onclick="delete_submit()"  class="btn btn-danger" value="회원 탈퇴" />
		</p>
		<p>
			<a href="mem_modify">이전으로</a>
		</p>
</div>
	</form>

	<c:if test="${msg == false}">
		<p>입력한 비밀번호가 잘 못 되었습니다.</p>
	</c:if>
	
	<script type="text/javascript">
	
		function delete_submit() {
			if(confirm("정말로 탈퇴하시겠습니까??") == true){
				document.formm.submit();
			}else{
				return false;
			}
		}
				
		
	</script>
</div>

<%@include file="../footer.jsp" %>