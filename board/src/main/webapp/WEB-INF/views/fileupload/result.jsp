<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Upload completed</h1>

${pageContext.request.contextPath } <br />${url }<br />${url }
<div class="result-images">
	<img src="${pageContext.request.contextPath }${url }" style="width:150px">
	<img src="${pageContext.request.contextPath }/fileupload/2019101804056449.PNG" style="width:150px">
</div>

<p> <a href='/fileupload/form'> 다시 업로드 하기 </a> /p>

</body>
</html>