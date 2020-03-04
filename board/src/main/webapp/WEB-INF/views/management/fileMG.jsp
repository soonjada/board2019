<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sun Board List</title>


<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

</head> -->

<style>
li {
	list-style: none;
	float: left;
	margin: 10px;
}
</style>

<%@include file="../header.jsp"%>



<c:if test="${msg != null }">

	<script type='text/javascript'>
		alert("로그인 후 이용해주세요");

		location.href = '/';
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

<c:if test="${msg == null }">
	<table class="table table-condensed"">
	
	
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">작성자</th>
				<th scope="col">작성자ID</th>
				<th scope="col">파일명</th>
				<th scope="col">크기</th>
				<th scope="col">작성일</th>

			</tr>
		</thead>

		<tbody>

			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.no}</td>
					<td>${list.writer}</td>			 
					<td>${list.writerId}</a></td>
					<td><a href="/management/fileviewMG?no=${list.no}"> ${list.originFileName}</a></td>
					
					
					<td>${list.fileSize}KB</td>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yy/MM/dd HH:mm" /><br /></td>
					

				</tr>
			</c:forEach>

		</tbody>

	</table>


	<div></div>





</c:if>
<c:if test="${msg == false }">
	<p>로그인을 해야 목록을 보실 수 있습니다.</p>
	<p>
		<a href="/">홈 바로가기</a>
	</p>
</c:if>





<%@include file="../footer.jsp"%>