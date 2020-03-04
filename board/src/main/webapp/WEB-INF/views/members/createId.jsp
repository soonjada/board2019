<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>


<br />

<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>

	<form role="form" method="post" autocomplete="off" name="formm" enctype="multipart/form-data">


		<!-- 	<div class="input-group input-group-sm mb-3" style="width: 50%; margin-left: 5%;">
  			<div class="input-group-prepend">
    			<span class="input-group-text" id="inputGroup-sizing-sm">아이디</span>
 		 	</div>
 		 	<input type="text" class="form-control"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="userId" name="userId"  />
 		 	<button type="button" id="idCheck" class="btn btn-secondary">아이디 중복 체크</button>
		</div> -->


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">ID</span>
			</div>
			<input type="text" id="userId" name="userId" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="idCheck">ID
					중복 체크</button>
			</div>
		</div>




		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p class="result">
				<span class="msg">아이디를 확인해 주십시오</span>
			</p>
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
		
		
		<!-- 19.11.18 ver2 add st -->
		
		<!-- <div class="input-group input-group-sm mb-3"
			style="width: 50%; margin-left: 5%;">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="email"
				name="email" />
		</div> -->
		
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
			</div>
			<input type="text" id="email" name="email" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="emailCheck">이메일
					중복 체크</button>
			</div>
		</div>
		
		
		
		
		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p class="result2">
				<span class="msg">메일을 확인해 주십시오</span>
			</p>
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">회원 이미지</span>
			</div>
			<input  class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" type="file" name="file1" id="file1"/>
		</div>
		
		
		
		<!-- 19.11.18 ver2 add End -->


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
			</div>
			<input type="password" class="form-control" aria-label="With textarea"
				cols="50" rows="5" id="userPass" name="userPass" />


		</div>
		
		<!--  -->
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호 확인</span>
			</div>
			<input type="password" class="form-control" aria-label="With textarea"
				cols="50" rows="5" id="userPassck" name="userPassck" />


		</div>
		<!--  -->

		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p>
				<input type="button" id="submitt" value="가입" class="btn btn-primary" onclick="submitck()" />
			</p>
			<p>
				<a href="/">처음으로</a>
			</p>
		</div>


	</form>


</div>

	<script>
		////////Submit Check St/////
		var btn = document.formm.submitt;
		btn.disabled = 'disabled';

		function submitck() {
			/* alert(document.formm.file1.value); */
			if(document.formm.userPass.value != document.formm.userPassck.value){
				alert("비밀번호를 확인해 주세요");
				return false;
			}
			if (document.formm.userName.value.length < 2) {
				alert("닉네임은 2자 이상입니다.");
				return false;
			} else if (document.formm.userPass.value.length < 2) {
				alert("비밀번호는 2자 이상입니다.");
				return false;
			}else if(document.formm.file1.value == null||document.formm.file1.value == ''){
				alert("기본이미지로 입력");
				document.formm.submit();
			} else {
				document.formm.submit();
			}
		}

		////////Submit Check End/////

		////// ID Check St///////////
		$("#idCheck").click(function() {

			var query = {
				userId : $("#userId").val()
			};

			if (document.formm.userId.value.length < 3) {
				alert("ID는 3자리 이상으로 입력해주세요");
			} else {

				jQuery.ajax({
					url : "/members/idCheck",
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
							/* btn.disabled = false; */
						}
					}
				});

			}

			// ajax 끝
		});
		////// ID Check End///////////
		
		////// email Check St///////////
		$("#emailCheck").click(function() {

			var query = {
				email : $("#email").val()
			};

			if (document.formm.email.value.length < 3) {
				alert("이메일을 입력해주세요");
			} else {

				jQuery.ajax({
					url : "/members/emailCheck",
					type : "post",
					data : query,
					success : function(data) {
						if (data == 1) {
							$(".result2 .msg").text("사용 불가");
							$(".result2 .msg").attr("style", "color:#f00");
							btn.disabled = 'disabled';
						} else {
							$(".result2 .msg").text("사용 가능");
							$(".result2 .msg").attr("style", "color:#00f");
							btn.disabled = false;
						}
					}
				});

			}

			// ajax 끝
		});
		////// email Check End///////////
	</script>

<%@include file="../footer.jsp"%>