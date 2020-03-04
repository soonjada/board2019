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

<%@include file="../header.jsp"%>




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
				<span class="input-group-text" id="inputGroup-sizing-sm">순번</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="no"
				value="${view.no }" readonly />
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">작성자</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="writer"
				value="${view.writer }" readonly />
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">작성자ID</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="writerId"
				value="${view.writerId }" readonly />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">실제파일명</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="originFileName"
				value="${view.originFileName }" readonly />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">저장파일명</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="saveFileName"
				value="${view.saveFileName }" readonly />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">확장자</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="extensionFileName"
				value="${view.extensionFileName }" readonly />
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">작성일</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="regDate"
				value="<fmt:formatDate value="${view.regDate}"
							pattern="yy/MM/dd HH:mm" />" readonly />
				
		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend" >
				<span class="input-group-text">이미지</span>
			</div >
			
			<div style="align-content: center;">
				<img src="${pageContext.request.contextPath }${url }"
					class="img-fluid" alt="no image" style="max-width: 250px;" />
			</div>
		
		
				<textarea class="form-control" aria-label="With textarea" cols="50"
					rows="5" name="content"  readonly>
				</textarea>	

		</div>
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">파일삭제</span>
			</div>
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm"><a href="../fileupload/filedelete?name=${view.saveFileName }">파일삭제하기</a></span>
			</div>
				
		</div>
		
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend"> 
				<span class="input-group-text" id="inputGroup-sizing-sm">파일받기</span>
			</div>
			
			<div  style="align-content: center; line-height: 40px; ">
				&nbsp;<a href="../fileupload/filedown?name=/fileupload/${view.saveFileName}&origin=${view.originFileName}"> ${view.originFileName } (${view.fileSize }Byte)</a>
			</div>

		</div>
	
		
		<!-- ---------------------------------------------------------------------------------- -->		

	</form>



	
	<!--  -->
	



<%@include file="../footer.jsp"%>
