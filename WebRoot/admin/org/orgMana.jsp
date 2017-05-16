<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<style type="text/css">
  body {background-image:url(<%=path %>/images/beijing1.png);}
  </style>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link href="<%=path %>/css/base.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/css/dtree.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=path %>/js/dtree.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<title></title>
		<script type="text/javascript">
		    var id=null;
		    var leixing=null;
		    function onClickTreeNode(nodeId,leixing1)
		    {
		        id=nodeId;
		        leixing=leixing1;
		    }
		    
		    function org_ding_add()
		    {
				 var url="<%=path %>/admin/org/org_ding_add.jsp";
				 window.location.href=url;
		    }
		    
		    
		    function org_xia_add()
		    {
				if(id==null)
				{
				     alert("请选择类别");
				     return false;
				}
				if(leixing=="88888")
				{
				     alert("请选择类别，不要乱选择");
				     return false;
				}
				else
				{
				     var url="<%=path %>/admin/org/org_xia_add.jsp?p_org_id="+id;
				     window.location.href=url;
				}
		    }
		    
		    function orgDel()
		    {
				if(id==null)
				{
				     alert("请选择类别");
				}
				else
				{
				     if(confirm('您确定删除吗？谨慎操作啊'))
		             {
		                  var url="<%=path %>/orgDel.action?id="+id;
				          window.location.href=url;
		             }
				}
		    }
		</script>
	</head>

	<BODY>
	<div class="body-box">
		<div class="dtree">
			<script type="text/javascript">
				d = new dTree('d');
		        d.add(0,-1,'树形图');//必须有这句
				//d.add(1,0,'Node 1','example01.html');
				//d.add(2,0,'Node 2','example01.html');
				//d.add(7,0,'Node 4','#');
				<c:forEach items="${requestScope.orgList}" var="org" varStatus="ss">
		            d.add(${org.id},<c:if test="${org.p_org_id=='0'}">0</c:if><c:if test="${org.p_org_id !='0'}">${org.p_org_id}</c:if>,'${org.mingcheng}',"javaScript:onClickTreeNode('${org.id}','${org.leixing}')","",null,null,null,'no');
		        </c:forEach>
				document.write(d);
			</script>
		</div>
		<br>
		&nbsp;&nbsp;
		<input type="button" class="ButtonCss" value="添加类别" onclick="org_ding_add()" style="width:100px;">
		<input type="button" class="ButtonCss" value="删除" onclick="orgDel()" style="width:100px;">
		
	</div>
	</body>
</html>
