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

#pageCode ul {
	float: left;
}

#pageCode ul  a {
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
							<a href="<%=path%>/preShow.action"
								style="display: block; padding: 5px 10px; border: 1px solid #333; width: 100px; text-align: center;"">上传视频</a>
						</div>
						<!-- 上传宠物秀结束 -->
						<div id="showList" style="border: 1px solid #333; margin: 5px;">
							<c:forEach var="s" items="${sList }">
								<div style="width: 30%; float: left; margin: 5px; border: 1px solid #333;">
									<p align="center">${s.showTitle }</p>
									<p align="center">发表用户：${s.userName } 
									
									<c:if test="${s.likeState eq 0}">
									<a href="<%=path %>/starShow.action?showId=${s.showId}&page=${page}" style="color: red;"> 赞(${s.showStars })</a>
									</c:if>
								<c:if test="${s.likeState eq 1}">
									赞(${s.showStars })
									</c:if>
									</p>

									<video width="100%" height="240" controls="controls"> 
									<source
										src="${pageContext.request.contextPath }/show/${s.showFileName}" type="video/mp4">
										 Your browser does
									not support the video tag. </video>

								</div>
							</c:forEach>
						</div>
						<!-- 宠物秀展示结束 -->
						<br class="clear" />
						<div id="pageCode" style="margin-top: 10px;">
							<ul style="margin: 0; padding: 0;">
								<!-- <li><a>首页</a></li>
								<li><a>1</a></li>
								<li><a>尾页</a></li> -->
								${pageCode }
							</ul>

							<br class="clear" />
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
