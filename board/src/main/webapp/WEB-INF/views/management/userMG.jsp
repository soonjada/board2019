<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head> -->
<style>
li {
	list-style: none;
	float: left;
	margin: 10px;
}
</style>

<%@include file="../header.jsp" %>



<c:if test="${msg != null }">

	<script type='text/javascript'>
	alert("로그인 후 이용해주세요");

location.href='/';

</script>


</c:if>

<c:if test="${msg == null }">
		<!-- <div style="width: 50%; margin-left: 5%;"> -->
<div>
	<br />
	 <h5>${member.userName} 님 환영합니다.</h5>

		<img src="${pageContext.request.contextPath }${member.userImg }" style="max-width: 50px; min-width:30px; max-height:50px; height:auto; border: 1px solid black;">
		<a href="../">홈 돌아가기</a> &nbsp;
		
		<div style="background:#eeeeee; margin-top: 10px;">
			
			<a href="/management/memberMG">회원 관리</a> &nbsp;
			<a href="/management/listMG">게시판 관리</a> &nbsp;
			<a href="/management/fileMG">파일관리</a> &nbsp;
			<a href="/management/qnaList">1:1 문의</a> &nbsp;
		</div>
	</div>
	</c:if>

	<form method="get">


		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">닉네임</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="userName"
				value="${view.userName}" readonly />
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">아이디</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" 
				value="${view.userId}" readonly />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="email"
				value="${view.email}" readonly />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">등급</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="memType"
				value="${view.memType}" readonly />
		</div>

	</form>
	
	<c:if test="${member.memType == '2' }">
	<form method="post" name="frmm">
		
		<select name="level">
			<option value="0">일반회원</option>
			<option value="1">일반관리자</option>
		</select>
		
		<button onclick="submitt()">변경</button>
	</form>
	</c:if>
	
	
	<!-- 회원이 쓴 글 시작 -->
	
	<table class="table table-condensed" ">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				
			</tr>
		</thead>

		<tbody>

			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
					<td><a href="/management/viewMG?bno=${list.bno}"> ${list.title}</a></td>
					<td>${list.writer}</td>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yy/MM/dd HH:mm" /></td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
	
	<!-- 회원이 쓴 글 끝 -->
	
	<script>
		function submitt(){
			document.frmm.submit();
		}
	</script>


<%@include file="../footer.jsp"%>
