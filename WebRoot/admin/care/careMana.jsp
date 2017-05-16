
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
  body {background-image:url(<%=path %>/images/beijing3.png);}
  </style>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />

<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />

<style type="text/css">
#pageCode{
margin-left:  20px;
}
#pageCode a{ 
border: 1px solid #333;
padding: 5px; 
}
</style>

<script language="javascript">
           function catelogDel(catelogId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/catelogDel.action?catelogId="+catelogId;
               }
           }
           
           
           function catelogAdd()
           {
                 var url="<%=path%>
	/admin/catelog/catelogAdd.jsp";
		window.location.href = url;
	}
</script>




<script language="JavaScript">
        function doSearchKey(){
            if(document.all.searchKeyValue.value=="")
            {    
                alert("请输入查询关键字!");
            }else{
                window.location.href="careList?queryKeyValue="+document.all.searchKeyValue.value;
             }
        }
       
    </script>

</head>

<body leftmargin="11" topmargin="11"
	background='<%=path%>/images/allbg.gif'>
       
	<table width="100%" border="0" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA">		
		<tr bgcolor="#E7E7E7">
			<td height="14" colspan="9" background="<%=path%>/images/tbg.gif">&nbsp;&nbsp;</td>
		</tr>
		<tr bgcolor="#E7E7E7">
			<td height="14" colspan="9" background="<%=path%>/images/tbg.gif">
			<form action="careList.action"> 
			<input type="text" name="searchContent"  />
			<input type="submit" value="搜索" /> (*可搜索 备注 、 用户电话 、用户姓名)
			</form>
			</td>
		</tr>
		
		<tr align="center" bgcolor="#FAFAF1" height="22">
		
			<td width="10%">ID</td>
			<td width="20%">备注</td>
			<td width="10%">时间（天）</td>
			<td width="10%">用户</td>
			<td width="10%">状态</td>
			<td width="10%">用户所留电话</td>
			<td width="10%">开始时间</td>
			<td width="10%">总价</td>
			<td width="10%">操作</td>
		</tr>
		
			<c:forEach var="c" items="${cList }">
			
			<tr align='center' bgcolor="#FFFFFF"
			onMouseMove="javascript:this.bgColor='red';"
			onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			   
				<td bgcolor="#FFFFFF" align="center">${c.careId }</td>
				<td bgcolor="#FFFFFF" align="center">${c.careDesc }</td>
				<td bgcolor="#FFFFFF" align="center">${c.careTime }</td>
				<td bgcolor="#FFFFFF" align="center">${c.careUserRealName }</td>
				<td bgcolor="#FFFFFF" align="center">${c.careState eq 0?"未审核":"审核通过" }</td>
				<td bgcolor="#FFFFFF" align="center">${c.carePhone }</td>
				<td bgcolor="#FFFFFF" align="center">${c.careStartDate }</td>
				<td bgcolor="#FFFFFF" align="center">${c.carePrice }</td>
				<td bgcolor="#FFFFFF" >
				<a  href="<%=path %>/updateCareState.action?careId=${c.careId}&page=${page}"
				 style="display: block; padding: 2px 5px; width: 30px;border: 1px solid #333;">通过</a>
					
				<a  href="<%=path %>/deleteCare.action?careId=${c.careId}&page=${page}"
				 style="display: block; padding: 2px 5px; width: 30px;border: 1px solid #333;">删除</a>
				 
						
				</td>	
				</tr>
			</c:forEach>
	
	</table>
	
	<p id="pageCode">${pageCode }</p>
	
</body>
</html>