<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>


<c:if test="${msg == null }">
	<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
		<br />
		<h5>${member.userName}님 환영합니다.</h5>

		<img src="${pageContext.request.contextPath }${member.userImg }"
			style="max-width: 50px; min-width: 30px; max-height: 50px; height: auto; border: 1px solid black;">


		<a href="../">홈화면 돌아가기</a> &nbsp; <a href="/qna/adminList">내 문의 보기 </a><br />
		<br />
	</div>
</c:if>

<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>

	<form role="form" id="frm" method="post" autocomplete="off" name="formm" enctype="multipart/form-data">
	
	
	<input type="hidden" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="writer" name="writer" value="${member.userName }" readonly="readonly" />
 	<input type="hidden" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="writerId" name="writerId" value="${member.userId }" readonly="readonly" />
 	<input type="hidden" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="result" name="result" value="0" readonly="readonly" />

		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">카테고리</span>
			</div>
			<select name="category">
				<option value="회원문의">회원문의</option> 
				<option value="게시글문의">게시글문의</option>
			</select>
		</div>
		
		
		<div class="input-group input-group-sm mb-3" >
  			<div class="input-group-prepend">
    			<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
 		 	</div>
 		 	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
 		 	id="title" name="title"  />
		</div>
		
		<div class="input-group">
  				<div class="input-group-prepend">
 			 	  <span class="input-group-text">내용</span>
 			 	</div>
 				 <textarea class="form-control" aria-label="With textarea"  cols="50" rows="5" id="content" name="content"></textarea>
			</div>
		
		
		
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">이미지</span>
			</div>
			<input  class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" type="file" name="file1" id="file1"/>
		</div>
		
		
		
		

		<!-- <div style="width: 50%; margin-left: 5%;"> -->
	<div>
			<p>
				<input type="button" class="btn btn-outline-secondary" type="button" id="button-addon1" onclick="submitt()" value="작성" />
			</p>
			<p>
				<a href="/">처음으로</a>
			</p>
		</div>


	</form>


</div>

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
			 
			 
			 
			document.getElementById('frm').submit();

		}

	}
</script>



<%@include file="../footer.jsp"%>