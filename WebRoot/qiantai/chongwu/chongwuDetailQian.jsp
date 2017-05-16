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
	       function lingyangAdd(chongwuId)
           {
                <c:if test="${sessionScope.userType!=1}">
	                  alert("请先登录");
	                  return false;
	            </c:if>
	            
	           
                var url="<%=path %>/qiantai/lingyang/lingyangAdd.jsp?chongwuId="+chongwuId;
                window.location.href=url;
           }
           
           
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
	          <!-- <h1 style="font-size: 22px;">新闻喜讯</h1>
	          <p>
		           This simple, fixed width website template is released under a Creative Commons Attribution 3.0 Licence
		           This means you are free to download and use it for personal and commercial proj
	          </p>
	          <p>1111</p>
	          <p>2222</p> -->
	          <!-- <h1 style="font-size: 22px;">
	                                        会员注册
	          </h1> -->
	          <div style="border:1px solid  #CCCCCC;width: 745px;margin-left: 10px">
		             <p>信息标题：${requestScope.chongwu.biaoti }</p>
                     <p><img src="<%=path %>/${requestScope.chongwu.fujian }" alt="" width="688" height="300"/></p>
                     <p>宠物名称：${requestScope.chongwu.mingcheng }</p>
                     <p>年龄：${requestScope.chongwu.nianling }</p>
                     
			         <p>信息内容：<c:out value="${requestScope.chongwu.jieshao }" escapeXml="false"></c:out></p>
			         <p>发布时间：${requestScope.chongwu.fabushi }</p>
			         
			         <c:forEach items="${requestScope.tupianList}" var="tupian" varStatus="ss">
		                 <p><img src="<%=path %>/${tupian.fujian }" alt="" width="688" height="300"/></p>
		                 <p><c:out value="${tupian.jieshao }" escapeXml="false"></c:out></p>
		                 <br/> 
	                 </c:forEach>
	                 <p>
	                     <input type="button" value="领养申请" onclick="lingyangAdd(${requestScope.chongwu.id })" style="width: 100px;"/>
	                 </p>
	          </div>
	      </div>
      </div>
      
      
      
      
      
      <footer>
          <a href="<%=path %>/login.jsp">系统后台</a>
      </footer>
  </div>
</body>
</html>
