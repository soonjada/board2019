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
				<span class="input-group-text" id="inputGroup-sizing-sm">카테고리</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="title"
				value="${view.category}" readonly />
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="title"
				value="${view.title}" readonly />
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">작성자</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="writer"
				value="${view.writer}" readonly />
		</div>

		<!-- 12.02 add start -->
		<input type="hidden" class="form-control"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-sm" name="writer"
			value="${view.writerId}" readonly />
		<!-- 12.02 add End -->


		
		<!-- 12.03 modify end --> 
		<!-- ---------------------------------------------------------------------------------- -->
		<!-- 12.09 modify st -->
		<div class="input-group">
			<div class="input-group-prepend" >
				<span class="input-group-text">내용</span>
			</div >
			<c:if test="${view.img != null}">
			<div style="align-content: center;">
				<img src="${pageContext.request.contextPath }${view.img }"
					class="img-fluid" alt="no image" style="max-width: 250px;" />
			</div>
		</c:if>
		
				<textarea class="form-control" aria-label="With textarea" cols="50"
					rows="5" name="content"  readonly>${view.content}
				</textarea>	

		</div>
		<!-- 12.03 modify end -->
		
		<!--  -->
		<!-- 12.03 modify st -->
		<%-- <c:if test="${view.imgUrl != null}">
		<div class="input-group">
			<div class="input-group-prepend" >
				<span class="input-group-text">파일받기</span>
			</div >
			
			<div style="align-content: center; line-height: 40px; ">
				&nbsp;<a href="../fileupload/filedown?name=${view.imgUrl}"> 파일 다운받기</a>
			</div>

		</div>
		
		</c:if> --%>
		<!-- 12.09 modify end -->
		<!--  -->
		
		
		<!-- ---------------------------------------------------------------------------------- -->		

	</form>


<!--  -->
<c:if test="${reck == false }">
<p style="width: 50%; margin-left: 5%;">댓글 작성하기</p>

	<!-- 댓글 작성  시작 -->
	<div class="replyForm">
		<form id="reply_write_form" role="form" method="post"
			autocomplete="off">



			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">작성자
					</span>
				</div>
				<input type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-sm" id="writer" name="writer"
					value="${member.userName }" readonly="readonly" />
			</div>

			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">댓글</span>
				</div>
				<textarea class="form-control" aria-label="With textarea" cols="50"
					rows="2" id="content" name="content" escapeXml="true"></textarea>
			</div>

			<br />
			<p >
				<input type="button" class="btn btn-outline-secondary" type="button"
					id="button-addon1" onclick="if_javascript()" value="작성" />
			</p>
		</form>
	</div>
	<!-- 댓글 작성End -->
	<!-- 게시물 끝 -->
	
	</c:if>

	<!-- 댓글 보여주기 시작 -->
	<%
		int i = 1;
	%>

	<!--  -->
	<table class="table table-condensed" style="overflow: auto; ">

		<colgroup>
			<col width="10%">
			<col width="15%">
			<col width="20%">
			<col width="35%">
			<col width="10%">
		</colgroup>


		<thead class="thead-dark" style="text-align: center;">
			<tr>
				<th scope="col">순번</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">내용</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach items="${replyList}" var="replyList">
				<tr style="text-align: center;">
					<td><%=i%></td>
					<td>${replyList.writer}</td>
					<td><fmt:formatDate value="${replyList.regDate}"
							pattern="MM/dd HH:mm" /><br /></td>
							<!-- word-break: break-all; word-wrap: break-word; 라인 정리 -->
					<td style="text-align: left;  height:auto;  overflow: auto;word-break: break-all; word-wrap: break-word; ">${replyList.content}</td>
					<td>
						<div>
							<a
								href="javascript:reply_delete_ck2('${view.bno}','${replyList.rno}')">
								<button type="submit" class="btn btn-secondary btn-sm">삭제
								</button>
							</a>
						</div>
					</td>
				</tr>
				<%
					i++;
				%>
			</c:forEach>

		</tbody>

	</table>
<!--  -->
	
	<!--  -->
	<script>
	
	function reply_delete_ck2(bno,rno){
		
		location.href="/management/deleteqnareMG?bno="+bno+"&rno="+rno;
		
	}
	
	
function if_javascript() {
		
		/*  */
		
		if(document.getElementById("content").value.trim() == ""){
			alert("공백만 입력되었습니다.");
			location.href = location.href;
		}else{
		
		
		var str = document.getElementById("content").value;
		var limit = 300;
		var strLength = 0;
        var strTitle = "";
        var strPiece = "";
        var check = false;
                 
        for (i = 0; i < str.length; i++){
            var code = str.charCodeAt(i);
            var ch = str.substr(i,1).toUpperCase();
            //체크 하는 문자를 저장
            strPiece = str.substr(i,1)
             
            code = parseInt(code);
             
            if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
                strLength = strLength + 3; //UTF-8 3byte 로 계산
            }else{
                strLength = strLength + 1;
            }
             
            if(strLength>limit){ //제한 길이 확인
                check = true;
                break;
            }else{
                strTitle = strTitle+strPiece; //제한길이 보다 작으면 자른 문자를 붙여준다.
            }
             
        }
         
        if(check){
            alert(limit+"byte 를 초과할 수 없습니다.");
            return false;
        }
         
       
		/*  */

		if (confirm("정말 작성하시겠습니까??") == true) { //확인
		
			/* 글자수 제한 시작 */
			
			var length = document.getElementById("content").value.length;
		
		
		
		if(length > 300){
			alert("작성자는 필수항목입니다.");
			return false;
		}
			
			/* 글자수 제한 끝 */
			
			
			/* 특수문자 리플레이스 시작부분 */
			var str = document.getElementById("content").value;
					
			str = str.replace(/</g,"&lt;");
			 str = str.replace(/>/g,"&gt;");
			 str = str.replace(/\"/g,"&quot;");
			 str = str.replace(/\'/g,"&#39;");
/* 			 str = str.replace(/\n/g,"<br />"); */
			 
			 document.getElementById("content").value = str;
			
			 /* 특수문자 리플레이스 끝부분 */
			 
			var value = document.getElementById("writer").value;
			if (value == "") {
				alert("작성자는 필수항목입니다.");
			} else {
				
				/* 11.19 ver2 금지어 호출 시작 */
				fncRestrictedWord(document.getElementById("content").value);
				if(notword == 1){
					 console.log("금지어");
					 notword = 0;
					 return false;
				 }
				/* 11.19 ver2 금지어 호출 끝 */
				reply_write_form.submit();
			}

		} else { //취소

			return false;
		}
		}
	};
	</script>



<%@include file="../footer.jsp"%>
