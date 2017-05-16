<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />

<script type="text/javascript" src="<%=path%>/js/lunbo.js"></script>

<script type="text/javascript">
	
</script>

<style type="text/css">
.c1-bline {
	border-bottom: #999 1px dashed;
	border-top: 1px;
}

.f-right {
	float: right
}

.f-left {
	float: left
}

.clear {
	clear: both
}

#pageCode ul li {
	float: left;
}

#pageCode ul li a {
	border: 1px solid #ccc;
	padding: 2px 10px;
	list-style: none;
	margin: 0;
}
</style>
</head>

<body>
	<div id="main">
		<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>

		<div id="site_content">
			<jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
			<div class="content">
				<div
					style="width: 754px; margin-top: 1px; padding-bottom: 5px; margin-top: 5px;">
					<div
						style="height:26px;background:url(<%=path%>/images/guangguang.PNG);font-size: 14px;color:#de3237;">
						<span
							style="float: left; font-family: 微软雅黑; font-size: 14px; margin-top: 3px; margin-left: 10px;">
							宠物视频秀</span> <span
							style="float: right; font-family: 微软雅黑; font-size: 14px; margin-top: 3px;">&nbsp;</span>
					</div>
					<div style="border: 1px solid #A9A9A9">
						<!-- 上传宠物秀 -->
						<div id="publishShow" style="margin: 2px;">
								<div style="width: 50%;margin: 0 auto;">
								<h1>用户未登录！！</h1>
								</div>
								
						</div>
					</div>
				</div>
			</div>
		</div>


	


<br class="clear" />
		<footer> <a href="<%=path%>/login.jsp">系统后台</a> </footer>
	</div>
</body>
</html>
