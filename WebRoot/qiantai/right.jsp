<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 
<%
  String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
      <div id="sidebar_container" style="margin-top: 13px;">
          <div class="sidebar" style="margin-top: 1px;">
	             <jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
          </div>
          <div class="sidebar" style="margin-top: -8px;">
	          <s:action name="orgSuoyou" executeResult="true" flush="true" namespace="/"></s:action> 
          </div>
          <div class="sidebar" style="margin-top: -8px;">
	          <c:forEach items="${sessionScope.cateLogList}" var="catelog" varStatus="ss">
	              <li style="margin-top: 8px;"><a href="<%=path %>/zhutiByCatelog.action?catelogId=${catelog.catelogId }">&raquo; ${catelog.catelogName }</a></li>
              </c:forEach>
          </div>
          <div class="sidebar" style="margin-top: -8px;">
	            <form action="<%=path %>/chongwuRes.action" name="fd" method="post">
					<table align="left" border="0" cellpadding="1" cellspacing="1">
						<tr align='right'>
							<td style="width: 80px;vertical-align: middle;" align="right">
								关键字：
					                </td>
							<td align="left">
							<input name="biaoti" type="text" style="width: 80px;"/>
							<input type="submit" value="查询"/>&nbsp; 
							</td>
						</tr>
					</table>
               </form>
          </div>
          <div class="sidebar" style="margin-top: -8px;">
	             <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
          </div>
	  </div>
  </body>
</html>
