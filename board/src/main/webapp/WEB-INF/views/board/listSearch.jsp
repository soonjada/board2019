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
		
		
		<a href="../">홈화면 돌아가기</a> &nbsp;
		<a href="/board/write">게시물 작성</a><br /><br />
	</div>
	</c:if>
	
<c:if test="${msg == null }">
	<table class="table table-condensed" ">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno} </td> 
					<%-- <td><a href="/board/view?bno=${list.bno}">${list.title}</a></td> --%>
					<c:if test="${list.writerType == '1' }">
					
					<td style="color: red;">비밀글 : <a href="/board/view?bno=${list.bno}&
											page=${scri.page}&
											perPageNum=${scri.perPageNum}&
											searchType=${scri.searchType}&
											keyword=${scri.keyword}"> ${list.title} </a></td>
					
					</c:if>
					
					<c:if test="${list.writerType == '0' }">
					
					<td><a href="/board/view?bno=${list.bno}&
											page=${scri.page}&
											perPageNum=${scri.perPageNum}&
											searchType=${scri.searchType}&
											keyword=${scri.keyword}">${list.title}</a></td>
					
					</c:if>
					
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yy/MM/dd HH:mm" /><br /></td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>


	<div >
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="listSearch${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="listSearch${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="listSearch${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<br />
	<br />
	<br />

	<%-- <div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"
				<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="w"
				<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			<option value="tc"
				<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		</select> 
		<input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword}" />

		<button id="searchBtn">검색</button>
	</div>
	 --%>
	<!--  -->	

	<div class="input-group mb-3" >
  		<div class="input-group-prepend">
   			 <label class="input-group-text" for="inputGroupSelect01">Options</label>
  		</div>
  
  
  		<select class="custom-select" id="inputGroupSelect01">
		    <%-- <option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option> --%>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"
				<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="w"
				<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			<option value="tc"
				<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
  		</select>
  <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword}" />

		<button id="searchBtn">검색</button>
  
  
	</div>

	
	<!--  -->

	
	
	</c:if>
	<c:if test="${msg == false }">
		<p>로그인을 해야 목록을 보실 수 있습니다.</p>
		<p>
			<a href="/">홈 바로가기</a>
		</p>
	</c:if>
	



<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							self.location = "listSearch"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});
			});
		</script>
<%@include file="../footer.jsp" %>