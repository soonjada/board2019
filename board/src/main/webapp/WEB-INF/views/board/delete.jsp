<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head> -->
<%@include file="../header.jsp" %>

<br />
<!-- <div style="width: 50%; margin-left: 5%;"> -->
<div>

<c:if test="${member.userName != view.writer }">
	<script type="text/javascript">
	alert("작성자만이 글을 삭제할 수 있습니다.");
	location.href='/';
	</script>
	
	</c:if>

<h3>게시글을 삭제하시겠습니까???<br /><br /></h3>


<form method="post">

<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />

	<input type="submit"   class="btn btn-danger" value="삭제하기" /> 
	&nbsp;
	<a href="/board/view?bno=${view.bno}"><input type="button"  class="btn btn-warning"value="아니요" /></a>
	
</form>
</div>

<%@include file="../footer.jsp" %>