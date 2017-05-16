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
 <style type="text/css">
  body {background-image:url(<%=path %>/images/beijing3.png);}
  </style>
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


	<body >
	<div style="width: 80%;margin: auto;">
								
								<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
								<thead>
								<tr bgcolor="#E7E7E7">
					            <td height="14" colspan="12" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				               </tr>
								<tr align="center" bgcolor="#FAFAF1" height="22"><td>单号</td><td>备注</td><td>时长（天）</td> <td>用户</td><td>状态</td>
								<td>价格</td> <td>开始时间</td>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="mc" items="${mcList }">
								<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#CCFFFF';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
								<td>${mc.careId }</td>
								<td>${mc.careDesc }</td>
								<td>${mc.careTime }</td>
								<td>${mc.careUserRealName }</td>
								<td>${mc.careState eq 0?"未审核":"审核通过" }</td>
								<td>${mc.carePrice}</td>
								<td>${mc.careStartDate }</td>
								</tr>
								</c:forEach>
								</tbody>
								</table>
								
								</div>
</body>
</html>
