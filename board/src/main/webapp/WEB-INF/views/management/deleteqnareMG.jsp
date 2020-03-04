<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../header.jsp" %>

<br />
<div style="width: 50%; margin-left: 5%;">
	

<h3>댓글을 삭제하시겠습니까???<br /><br /></h3>


<form method="post">

<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />

	<input type="submit"   class="btn btn-danger" value="삭제하기" /> 
	&nbsp;
	<a href="/management/viewqnaMG?bno=${view.bno}"><input type="button"  class="btn btn-warning"  value="아니요" /></a>
	
</form>
</div>
<%@include file="../footer.jsp" %>



