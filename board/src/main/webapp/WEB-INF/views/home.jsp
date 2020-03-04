<%@page
	import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%> 

<%@include file="header.jsp" %>
<div >
	<p><h1 style="float: left">SUN Spring Board&nbsp;</h1><h3 style="padding-top: 11px"> Ver1.2</h3></p>
	<P>
		The time on the server is ${serverTime1}.
	</P>

	<c:if test="${member != null}">
		<!--기본 유저가 아니면 보이게  -->
		<c:if test="${member.memType != '0' }">
			<p ><a href="/management/memberMG" style="color:#ff0000;">관리자 페이지</a> </p>
		</c:if>
	
	
	<p>
		<a href="/board/write">게시물 작성</a> 
	</p>
	
	<p>
		<a href="/board/listSearch">게시물 목록</a>
	</p>
	
	<p>
		<a href="/qna/createQnA">문의하기</a>
	</p>
	<p>
		<a href="/qna/adminList">내문의 목록</a>
	</p>
	
	</c:if>
	<!-- ---------------------Login Start--------------------------- -->
	<c:if test="${member == null }">

		<form role="form" method="post" autocomplete="off"
			action="members/login">
			<p >
				<!-- <label for="userId">ID</label> --> <input type="text" id="userId"
					name="userId" class="form-control" placeholder="ID"/>
			</p>
			<p >
				<!-- <label for="userPass">비밀번호</label>  -->
				<input type="password" class="form-control"
					id="userPass" name="userPass" placeholder="비밀번호"/>
			</p>
			<p>
				<button type="submit" class="btn btn-primary">로그인</button>
				
			</p>
			
			<p>
				<a href="/members/createId">회원가입</a> &nbsp;
				<a href="/members/findUser">아이디 / 비밀번호 찾기</a>
			</p>

		</form>
	</c:if>	
			
			
	 <c:if test="${msg == false }">
		<p style="color:red"> 아이디와 패스워드를 확인해주세요  </p>
	</c:if> 
	
	<c:if test="${member != null}">
		<h5>${member.userName} 님 환영합니다.</h5>
		<div >
			<img src="${pageContext.request.contextPath }${member.userImg }" style="max-width: 250px; min-width:150px; max-height:250px; height:auto; border: 1px solid black;">
		
		</div>
		
		<br />
		
		<input type="submit" onclick="modify()" class="btn btn-success" value="회원정보수정"/>
		<input type="submit" onclick="logout()" class="btn btn-danger" value="로그아웃"/>
		
		
	</c:if>
	
	<!--  -->
		<!-- <a href="fileupload/filedown">파일 다운받기</a>
		<a href="fileupload/form">파일 다운받기</a> -->

	<!--  -->
	<!-- ---------------------Login End--------------------------- -->
	
	<!-- 19.11.18 v2 file upload test st -->
	
	<!-- <a href="fileupload/form">fileuploadform test</a> -->
	
	<!-- 19.11.18 v2 file upload test End -->
	

</div>
<script>

	
	function logout(){
		var logout = confirm("정말로 로그아웃 하시겠습니까?");
		if(logout == true){
			location.href="members/logout"
		}else{
			alert("로그아웃을 취소하였습니다.");
		}
		
	}
	
	function modify(){
		location.href="members/mem_modify";
		
	}
	
</script>


<%@include file="footer.jsp" %>
