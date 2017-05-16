<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
   String path = request.getContextPath();
%>

<!DOCTYPE html>
<head>
     <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css" />
     <script type="text/javascript" src="<%=path %>/js/modernizr-1.5.min.js"></script>
</head>
  
<body>
  <!-- <header style="background: #444 url(/zhiyuan/images/logo.jpg) repeat-x;"> -->
  <header style="background-image:url('<%=path %>/images/topp.png');  repeat-x;height: 150px;">
      <div id="logo" style="height: 10px;">
        <div id="logo_text" style="width: 600px;">
          <h1 style="margin-top: 48px;margin-left: 100px;color: red;font-size: 36px;"></h1>
        </div>
      </div>
      <div id="menu_container" style="margin-top: 85px;">
          <ul class="sf-menu" id="nav" style="margin-top: 0px;">
	          <li><a href="<%=path %>/qiantai/default.jsp" style="font-family: 微软雅黑;font-size: 16px;">系统首页</a></li>
	          <li><a href="<%=path %>/showList.action" style="font-family: 微软雅黑;font-size: 16px;">宠物秀</a></li>
	          <li><a href="<%=path %>/preCare.action" style="font-family: 微软雅黑;font-size: 16px;">宠物寄养</a></li>
	          <li><a href="<%=path %>/xinwenAll.action" style="font-family: 微软雅黑;font-size: 16px;">新闻资讯</a></li>
	          <li><a href="<%=path %>/qiantai/userreg/userreg.jsp" style="font-family: 微软雅黑;font-size: 16px;">用户注册</a></li>
	          <li><a href="<%=path %>/gonggaoAll.action" style="font-family: 微软雅黑;font-size: 16px;">系统公告</a></li>
	          <li><a href="<%=path %>/liuyanAll.action" style="font-family: 微软雅黑;font-size: 16px;">留言反馈</a></li>
	          <li><a href="<%=path %>/zhutiAll.action" style="font-family: 微软雅黑;font-size: 16px;">论坛模块</a></li>
	          
	          <%-- <li><a href="<%=path %>/qiantai/userreg/userreg.jsp" style="font-family: 微软雅黑;font-size: 16px;">1111</a></li>
	              <ul>
	                <li><a href="#">222</a></li>
	                <li><a href="#">333</a></li>
	              </ul>
		      </li> --%>
	      </ul>
      </div>
</header>
</body>
</html>
