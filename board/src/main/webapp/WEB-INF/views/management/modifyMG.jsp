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

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="title" name="title"
				value="${view.title}" readonly="readonly" />
		</div>

		<!-- 12.02 modify Start -->

		<%-- <div class="input-group input-group-sm mb-3" style="width: 50%; margin-left: 5%;">
  			<div class="input-group-prepend">
    			<span class="input-group-text" id="inputGroup-sizing-sm">작성자</span>
 		 	</div>
 		 	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="writer" name="writer" value="${member.userName }" readonly="readonly" />		
		</div> --%>

		<input type="hidden" class="form-control"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-sm" id="writer" name="writer"
			value="${view.writer }" readonly="readonly" />
			
			<input type="hidden" class="form-control"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-sm" id="writer" name="writerId"
			value="${view.writerId }" readonly="readonly" />

		<!-- 12.02 modify End -->

		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" cols="50"
				rows="5" id="content" name="content" readonly="readonly">관리자에 의해 삭제된 게시물 입니다.</textarea>
		</div>

		<!-- 19.12.02 ver2 add st -->
		<c:if test="${view.imgUrl != null}">

			<div class="input-group" style="display: none;">
				<div class="input-group-prepend">
					<span class="input-group-text">파일</span>
				</div>
				<div class="input-group-prepend">
					<div class="input-group-text" id="inputGroup-sizing-sm">
						<img src="${pageContext.request.contextPath }${view.imgUrl }"
							class="img-fluid" alt="no image" style="max-width: 250px;" />
							
					</div>
				</div>

			</div>
			
			<div class="input-group" style="display: none;">
				<div class="input-group-prepend">
					<span class="input-group-text">이미지 제거</span>
				</div>
				<div class="input-group-prepend">
					<div class="input-group-text" id="inputGroup-sizing-sm">
						<input type="checkbox" name="imgck" checked="checked" readonly="readonly">
					</div>
				</div>

			</div>
			
			<!-- <input type="checkbox" name="imgck"> -->
			
		</c:if>
		<!-- 19.12.02 ver2 add End -->
		
		<!-- 19.12.02 ver2 ST add image-->

			<div class="input-group" style="display: none;">
  				<div class="input-group-prepend">
  				<c:if test="${view.imgUrl != null}"><span class="input-group-text">사진변경</span></c:if>
 			 	<c:if test="${view.imgUrl == null}"><span class="input-group-text">사진추가</span></c:if>
 			 	</div>
 				 <input type="file" class="form-control" aria-label="With textarea" onchange="fileTypeCheck(this)" cols="50" rows="5" id="file1" name="file1"
 				 accept="image/x-png,image/gif,image/jpeg" />
			</div>
			<!-- 19.12.02 ver2 End -->


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

		if (document.getElementById('title').value == "" || document.getElementById('content').value == "") {
			alert("제목과 내용은 필수사항입니다.");
			location.href = location.href;
		} else if(document.getElementById('title').value.trim() == "" || document.getElementById('content').value.trim() == ""){
			alert("공백만 입력되었습니다.");
			location.href = location.href;
		}else {
			
			
			/* title byte check ST  */
			var str = document.getElementById("title").value;
			var limit = 50;
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
	            alert("제목은"+limit+"byte 를 초과할 수 없습니다.");
	            return false;
	        }
	         
	       
	        /* title byte check End  */
	        
	        /* content byte check ST  */
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
	            strPiece = str.substr(i,1);
	             
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
	            alert("글내용은"+limit+"byte 를 초과할 수 없습니다.");
	            return false;
	        }
	         
	       
	        /* content byte check End  */
	        
	        
			/* 특수문자 리플레이스 시작부분 */
			var str = document.getElementById("title").value; 
			
			
					
			str = str.replace(/</g,"&lt;");
			 str = str.replace(/>/g,"&gt;");
			 str = str.replace(/\"/g,"&quot;");
			 str = str.replace(/\'/g,"&#39;");
			 /* str = str.replace(/\n/g,"<br />"); */
			 
			 document.getElementById("title").value = str;
			
			 /* 특수문자 리플레이스 끝부분 */
			
			/* 특수문자 리플레이스 시작부분 */
			 var str = document.getElementById("content").value; 
					
			str = str.replace(/</g,"&lt;");
			 str = str.replace(/>/g,"&gt;");
			 str = str.replace(/\"/g,"&quot;");
			 str = str.replace(/\'/g,"&#39;");
			 /* str = str.replace(/\n/g,"<br />"); */
			 
			 document.getElementById("content").value = str;
			
			 /* 특수문자 리플레이스 끝부분 */
			
			 /* 11.19 ver2 추가부분 금지어   시작*/
			 fncRestrictedWord(document.getElementById("content").value);
				if(notword == 1){
					 console.log("금지어");
					 notword = 0;
					 return false;
				 }
			 /* 11.19 ver2 추가부분 금지어  끝*/
			 
			alert("작성되었습니다.");
			document.getElementById('frm').submit();

		}

	}
	
	</script>

<%@include file="../footer.jsp"%>