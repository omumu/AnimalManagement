<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="error.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML>
   <HEAD>
</HEAD>

<FRAMESET border=0 frameSpacing=0 rows=140,* frameBorder=NO>
    <FRAME name=topFrame src="<%=path %>/auser/top.jsp" noResize scrolling=no>
    <FRAMESET border=0 name=content frameSpacing=0 frameBorder=0 cols=192,*>
	    <FRAME name=BoardMenu marginWidth=0 marginHeight=0 src="<%=path %>/auser/leftMenu.jsp" noResize scrolling=no target="main">
	    <FRAME name=main marginWidth=0 marginHeight=0 src="<%=path %>/auser/right.jsp" noResize>
    </FRAMESET>
</FRAMESET>
</HTML>