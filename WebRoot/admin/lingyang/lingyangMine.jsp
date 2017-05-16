<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	 <style type="text/css">
  body {background-image:url(<%=path %>/images/beijing2.png);}
  </style>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function lingyangDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/lingyangDel.action?id="+id;
               }
           }
           
           function lingyangHuifu(id)
           {
                   window.location.href="<%=path %>/admin/lingyang/lingyangHuifu.jsp?id="+id;
           }
           
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="12" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">姓名</td>
					<td width="10%">住址</td>
					<td width="10%">联系电话</td>
					
					<td width="16%">自我介绍</td>
					<td width="16%">回复信息</td>
		        </tr>	
				<c:forEach items="${requestScope.lingyangList}" var="lingyang" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#CCFFFF';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${lingyang.xingming}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${lingyang.zhuzhi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${lingyang.lianxi}
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					    ${lingyang.jieshao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${lingyang.huifu}
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
