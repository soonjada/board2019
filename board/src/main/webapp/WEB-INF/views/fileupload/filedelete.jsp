<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 
<%@ page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>

<%@ page trimDirectiveWhitespaces="true" %>



<%
    request.setCharacterEncoding("UTF-8");
 
 
    // 파일 업로드된 경로
    /* String root = request.getSession().getServletContext().getRealPath("/"); */
    String root = "C:/";
    String savePath = root + "fileupload/";
    
    System.out.println(savePath);
    
    String url = request.getParameter("name");//파일명
    
    System.out.println(url);
 
    // 서버에 실제 저장된 파일명
    String filename = url ;
    
    String Path = savePath + url;
    
    File f = new File(Path);
    
    if(f.exists()){
    	f.delete();
    }
     
    
    out.println("<script language='javascript'>location.href='/management/fileMG'</script>");
    
      
 
%>


