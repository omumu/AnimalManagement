<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<style type="text/css">
	        .Header {background: url(<%=path %>/images/topp.png) repeat}
        </style>
        
        <script type="text/javascript">
		    function logout()
			{
				   var url="<%=path %>/index.action";
				   window.parent.location=url;
			}
	    </script>
	</HEAD>

	<BODY text=#000000 bgColor=#ffffff leftMargin=0 rightmargin="0" topMargin=0 marginheight="0" marginwidth="0">
	 
		<div class="Header" style="height: 140px;">
            <div class="list_bar">
				 <span style="float:left;font-size: 33px;color: white;font-weight: bolder;display: block;text-align: left;margin-top: 38px;margin-left:30px;">
				
				 </span> 
				 <span style="float:right;font-size: 20px;color: white;font-weight: bolder;display: block;text-align: left;margin-top: 113px;margin-right: 200px;">			    
				     <SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;'+''.charAt(new Date().getDay());",1000)</SCRIPT><SPAN id=clock></SPAN>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="#" onclick="logout()" style="color: white;font-size: 14px;font-family: 微软雅黑">返回网站</a>
                 </span>
			</div>
		</div>
		
</HTML>
