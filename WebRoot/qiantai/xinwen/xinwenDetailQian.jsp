<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<script type="text/javascript">
	    
	</script>
	
	<style type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>
  </head>
   
  <body>
  <div id="main">
      <jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>
      
      
      
      
      <div id="site_content">
	      <jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
	      <div class="content">
	          <div style="border:1px solid  #CCCCCC;width: 745px;margin-left: 10px">
		             <div style="margin: 10px;">
			             <p>信息标题：${requestScope.xinwen.biaoti }</p><br/>
	                     <p><img src="<%=path %>/${requestScope.xinwen.fujian }" alt="" width="688" height="300" style="border:1px solid  #CCCCCC;"/></p>
				         <p>信息内容：<c:out value="${requestScope.xinwen.neirong }" escapeXml="false"></c:out></p>
				         <p>发布时间：${requestScope.xinwen.shijian }</p><br/> 
				         
				         <c:forEach items="${requestScope.tupianList}" var="tupian" varStatus="ss">
			                 <p><img src="<%=path %>/${tupian.fujian }" alt="" width="688" height="300"/></p>
			                 <p><c:out value="${tupian.jieshao }" escapeXml="false"></c:out></p>
			                 <br/> 
		                 </c:forEach>
	                 </div>
	          </div>
	      </div>
      </div>
      
      
      
      
      
      <footer>
          <a href="<%=path %>/login.jsp">系统后台</a>
      </footer>
  </div>
</body>
</html>
