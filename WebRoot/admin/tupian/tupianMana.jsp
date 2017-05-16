<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
	    
	    <script type="text/javascript">
	       function tupianAdd()
           {
              var url="<%=path %>/admin/tupian/tupianAdd.jsp?xinwenId=${requestScope.xinwenId}";
              window.location.href=url;
           }
           
           function tupianDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/tupianDel.action?id="+id;
               }
           }
	    </script>
	</head>

	<body style="margin-left: 20px;">
	    <c:forEach items="${requestScope.tupianList}" var="tupian" varStatus="ss">
			<TABLE cellpadding="6" cellspacing="6">
				<TR>
					<td>
					   <img src="<%=path %>/${tupian.fujian }" alt="" width="300" height="200"/>
					   <a href="#" onclick="tupianDel(${tupian.id })">删除</a>
					</td>
				</TR>
				<TR>
					<td><c:out value="${tupian.jieshao }" escapeXml="false"></c:out></td>
				</TR>
				<tr>
				   <td>
				       <hr style="BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted" color=blue size=1 width="100%"/>
				   </td>
				</tr>
			</TABLE>
		</c:forEach>
		
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="添加图片" style="width: 120px;" onclick="tupianAdd()" />
	</body>
</html>
