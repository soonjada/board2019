<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head> -->


<%@include file="../header.jsp"%>



<c:if test="${msg == null }">
	<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
		<br />
		<h5>${member.userName}님 환영합니다.</h5>
		<img src="${pageContext.request.contextPath }${member.userImg }"
			style="max-width: 50px; min-width: 30px; max-height: 50px; height: auto; border: 1px solid black;">
		<a href="listSearch">목록 돌아가기 </a> &nbsp; <a href="../">홈화면 돌아가기</a> <br />
		<br />
	</div>
</c:if>



<c:if test="${msg == null }">
	<form method="post" id="frm" enctype="multipart/form-data">



		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="title" name="title" />
		</div>

		<!-- 12.02 add start -->

		<input type="hidden" class="form-control"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-sm" id="writerId" name="writerId"
			value="${member.userId }" readonly="readonly" />

		<!-- 12.02 add End -->

		<!-- 12.02 modify start -->
		<%-- <div class="input-group input-group-sm mb-3" style="width: 50%; margin-left: 5%;">
  			<div class="input-group-prepend">
    			<span class="input-group-text" id="inputGroup-sizing-sm">작성자</span>
 		 	</div>
 		 	<input type="hidden" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="writer" name="writer" value="${member.userName }" readonly="readonly" />
		</div> --%>

		<input type="hidden" class="form-control"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-sm" id="writer" name="writer"
			value="${member.userName }" readonly="readonly" />
		<!-- 12.02 modify end -->

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" cols="50"
				rows="5" id="content" name="content"></textarea>
		</div>
		<!-- 11.18 ver2 ST add image-->
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">사진파일</span>
			</div>
			<input type="file" class="form-control" aria-label="With textarea"
				onchange="fileTypeCheck(this)" cols="50" rows="5" id="file1"
				name="file1" accept="image/x-png,image/gif,image/jpeg" />
		</div>
		<!-- 11.18 ver2 End -->


		<!--  -->
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">비밀글</span>
			</div>
			<div class="input-group-prepend">
				<div class="input-group-text" id="inputGroup-sizing-sm">
					<input type="checkbox" id="writerType" name="writerType">
				</div>
			</div>

		</div>


		<div class="input-group input-group-sm mb-3" id="tg">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀글 패스워드</span>
			</div>
			<input type="password" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="boardPass" value=""
				name="boardPass" />
		</div>

		<!--  -->

		<!-- 12.13 임시작성 시작 수정해야함 -->


		<!-- 12.13 임시작성 끝 수정해야함 -->

		<br />
		<p>
			<input type="button" class="btn btn-outline-secondary" type="button"
				id="button-addon1" onclick="submitt()" value="작성" />

		</p>


	</form>
</c:if>
<c:if test="${msg == false }">
	<p>로그인을 해야 작성하실 수 있습니다.</p>
	<p>
		<a href="/">홈 바로가기</a>
	</p>
</c:if>





<script>


/* 11.19 ver2 파일타입 제한부분 시작 */
function fileTypeCheck(obj) {

	pathpoint = obj.value.lastIndexOf('.');

	filepoint = obj.value.substring(pathpoint+1,obj.length);

	filetype = filepoint.toLowerCase();

	if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {

		// 정상적인 이미지 확장자 파일인 경우

	} else {

		alert('이미지 파일만 추가하실 수 있습니다.');

		parentObj  = obj.parentNode

		node = parentObj.replaceChild(obj.cloneNode(true),obj);
		
		document.getElementById('file1').value = document.getElementById('file1').defaultValue; 

		return false;

	}

} 

/* 11.19 ver2 파일타입 제한부분 끝 */
 



	function submitt() {

		if (document.getElementById('title').value == "" || document.getElementById('content').value == "") {
			alert("제목과 내용은 필수사항입니다.");
			location.href = location.href;
		} else if(document.getElementById('title').value.trim() == "" || document.getElementById('content').value.trim() == ""){
			alert("공백만 입력되었습니다.");
			location.href = location.href;
		}
		else{
			
			
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
			 /* str = str.replace(/ /g,"&nbsp;"); */
			 
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
			/* 11.19 금지어 호출 시작 */
			 fncRestrictedWord(document.getElementById("title").value);
			 fncRestrictedWord(document.getElementById("content").value);
			 
			 if(notword == 1){
				 console.log("금지어");
				 notword = 0;
				 return false;
			 }
			 
			 
			 /*  */
			 
			alert("작성되었습니다.");
			 
			 if(document.getElementById("writerType").checked){
				 if(document.getElementById("boardPass").value.length < 3 ){
					 alert("비밀번호는 3자 이상입니다.");	 
				 }
			 }
			 
			 
			 
			document.getElementById('frm').submit();

		}

	}
</script>

<%@include file="../footer.jsp"%>