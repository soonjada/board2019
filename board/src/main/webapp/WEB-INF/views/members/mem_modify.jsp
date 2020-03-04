<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<br />
<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>

<c:if test="${msg == null }">
		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
	<br />
	 <h5>${member.userName} 님 환영합니다.</h5>
		<a href="../">홈화면 돌아가기</a> &nbsp;&nbsp;
		<a href="/members/mem_delete">탈퇴하기</a>
		<br /><br />
	</div>
	</c:if>

	<form role="form" name="formm" method="post" autocomplete="off" enctype="multipart/form-data">
		
<!--  -->

		
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
				name="userName" value="${member.userName}"  />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="email"
				name="email" value="${member.email}"  />
				
				<input type="hidden" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="email1"
				name="email1" value="${member.email}"  />
				
				<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="emailCheck">이메일
					중복 체크</button>
			</div>
				
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">회원 이미지</span>
			</div>
			<input  class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" type="file" name="file1" id="file1"/>
		</div>
		
		<!--  -->
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">현재 비밀번호</span>
			</div>
			<input type="password" id="userPw" name="userPw" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="pwCheck">비밀번호 확인</button>
			</div>
		</div>
		
		<!--  -->


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
			</div>
			<input type="password" class="form-control" aria-label="With textarea"
				cols="50" rows="5" id="userPass" name="userPass" />
				
				<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호 확인</span>
			</div>
			<input type="password" class="form-control" aria-label="With textarea"
				cols="50" rows="5" id="userPass_ck" name="userPass_ck" />


		</div>

		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p>
			<input type="button" onclick="modify_submit()" id="submitt" class="btn btn-warning" value="회원정보 수정" />
		</p>
	<!-- 	<p>
			<a href="/members/mem_delete">탈퇴하기</a>
			<input type="button"  class="btn btn-danger" value="탈퇴하기" onclick="move_delete()" />
		</p> -->
		
		</div>
		
		<!--  -->
		
		<p class="result1">
				<span class="msg"></span>
			</p>
			<p class="result">
				<span class="msg"></span>
			</p>
		
		
		
		

	</form>
</div>
	<script type="text/javascript">
	
	/*  */
	var btn = document.formm.submitt;
	btn.disabled = 'disabled';
	/*  */
		function move_delete() {
			location.href="/members/mem_delete";
		}
	
	
		function modify_submit() {
			
			if(document.formm.userPass.value.length == 0 && document.formm.userPass_ck.value.length == 0){
				document.formm.submit();
			}

			else if (document.formm.userPass.value.length < 2) {
				alert("비밀번호는 2자 이상입니다.");
			} else {

				if (document.formm.userPass.value != document.formm.userPass_ck.value) {
					alert("비밀번호를 확인해주세요");
				} else {
					alert("비밀번호를 변경하였습니다.");
					document.formm.submit();
				}
			}

		}
		
		
	////// pw Check St///////////
		$("#pwCheck").click(function() {

			var query = {
				userPw : $("#userPw").val()
			};

				jQuery.ajax({
					url : "/members/PwCheck",
					type : "post",
					data : query,
					success : function(data) {
						if (data == 1) {
							$(".result .msg").text("사용 불가");
							$(".result .msg").attr("style", "color:#f00");
							btn.disabled = 'disabled';
						} else {
							$(".result .msg").text("사용 가능");
							$(".result .msg").attr("style", "color:#00f");
							btn.disabled = false;
						}
					}
				});

			

			// ajax 끝
		});
		////// pw Check End///////////
		
		////// email Check St///////////
		$("#emailCheck").click(function() {
			
			var a = document.formm.email1.value;
			var b = document.formm.email.value;

			var query = {
				email : $("#email").val()
			};

			if (document.formm.email.value.length < 3) {
				alert("이메일을 입력해주세요");
			}else if(a==b){
				$(".result1 .msg").text("기존 이메일 사용");
				$(".result1 .msg").attr("style", "color:#00f");
				btn.disabled = false;
			} else {

				jQuery.ajax({
					url : "/members/emailCheck",
					type : "post",
					data : query,
					success : function(data) {
						if (data == 1) {
							$(".result1 .msg").text("이메일 사용 불가");
							$(".result1 .msg").attr("style", "color:#f00");
							 btn.disabled = 'disabled'; 
						} else {
							$(".result1 .msg").text("이메일 사용 가능");
							$(".result1 .msg").attr("style", "color:#00f");
							 btn.disabled = false; 
						}
					}
				});

			}

			// ajax 끝
		});
		////// email Check End///////////
		
		
	</script>

<%@include file="../footer.jsp" %>