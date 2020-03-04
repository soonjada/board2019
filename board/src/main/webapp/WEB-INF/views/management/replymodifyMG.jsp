<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head> -->
<%@include file="../header.jsp"%>

	<%-- <p style="width: 50%; margin-left: 5%;">

		<c:if test="${member.userName != view.writer }">
			<script type="text/javascript">
	alert("작성자만이 글을 수정할 수 있습니다.");
	location.href='/';
	</script>

		</c:if>


		 <h5>${member.userName} 님 환영합니다.</h5>
		<a href="../">홈화면 돌아가기</a> &nbsp;
		<a href="/board/write">게시물 작성</a><br /><br />
	<!-- <div style="width: 50%; margin-left: 5%;"> -->
<div>
		<br />
		<h5>${member.userName}님 환영합니다.</h5>
		<a href="view?bno=${view.bno}">게시글 돌아가기 </a> &nbsp; <a
			href="listSearch">목록 돌아가기 </a> &nbsp; <a href="../">홈화면 돌아가기</a>
	</div> --%>
	
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
	
	<form method="post" id="frm"  enctype="multipart/form-data">

		

		<!--  -->
		
		<input type="hidden" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="bno" name="bno"
				value="${view.bno}" readonly="readonly" />

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">댓글번호</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="rno" name="rno"
				value="${view.rno}" readonly="readonly" />
		</div>

		

		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" cols="50"
				rows="5" id="content" name="content" readonly="readonly">관리자에 의해 삭제된 댓글 입니다.</textarea>
		</div>

		


		<br />
		<p >
			<!-- <input type="button" class="btn btn-outline-secondary" type="button" id="button-addon1" onclick="submit" value="작성" /> -->
			<input type="button" class="btn btn-outline-secondary" type="button"
				id="button-addon1" onclick="submitt()" value="수정하기" />
		</p>

		<!--  -->



	</form>

	<script type="text/javascript">
	function submitt() {

		document.getElementById('frm').submit();
	}
	
	</script>

<%@include file="../footer.jsp"%>