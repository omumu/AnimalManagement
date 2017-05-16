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
  body {background-image:url(<%=path %>/images/beijing3.png);}
  </style>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
 <link rel="stylesheet" type="text/css" href="<%=path %>/css/component.css" />
	  <link rel="stylesheet" type="text/css" href="<%=path %>/css/demo.css" />
	   <link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
	
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin.js"></script>
       
        <script language="javascript">
           function chongwuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/chongwuDel.action?id="+id;
               }
           }
           
           
           function lingyang(id)
           {
               if(confirm('您确定吗？'))
               {
                   window.location.href="<%=path %>/lingyang.action?id="+id;
               }
           }
           
           function chongwuPre(id)
           {
                   window.location.href="<%=path %>/chongwuPre.action?id="+id;
           }
           
           
           
           function over(picPath)
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }
		   
		   
		   function lingyangMana(chongwuId)
           {
               var url="<%=path %>/lingyangMana.action?chongwuId="+chongwuId;
               window.location.href=url;
           }
		   
       </script>
        <script type="text/javascript">
  
  function chkvalue(){
    	
	   var name=document.getElementById("input-4").value;
	  if(document.getElementById("input-4").value==""){
		  alert("查找条件不能为空!");
	  }
	  else{
		  
		  if(document.getElementById("selectoption").value==1){
	   window.location.href="<%=path %>/chongwuserch.action?biaoti="+name; }
	  
		  if(document.getElementById("selectoption").value==2){
			  
			  window.location.href="<%=path %>/chongwuserch2.action?zt="+name;
		  }
	  }
	 
  }
  
  </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
	
	        <span class="input input--hoshi">
	        <select id="selectoption" style="font-size:20px"><option value="1">信息标题搜索</option>
						<option value="2">状态搜索</option>
						</select>
					<input class="input__field input__field--hoshi" type="text" id="input-4" style="font-size:22px" onblur="chkvalue()"/>
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
						<!-- <span class="input__label-content input__label-content--hoshi" style="font-size:15px">信息标题搜索</span> -->
						
					</label>
				</span><br>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
					<td width="24%">信息标题</td>
					<td width="10%">宠物名称</td>
					<td width="10%">年龄</td>
					
					<td width="10%">图片</td>
					<td width="10%">发布时间</td>
					<td width="10%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
		         <c:forEach items="${requestScope.chongwuserch2}" var="chongwu" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chongwu.biaoti}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.nianling}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/${chongwu.fujian}')" onmouseout = "out()" style="cursor:hand;">
							查看图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.fabushi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.zt}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="chongwuDel(${chongwu.id})"/>
						<c:if test="${chongwu.zt=='待领养'}">
					        <input type="button" value="领养申请" onclick="lingyangMana(${chongwu.id})"/>
					        <input type="button" value="设置领养" onclick="lingyang(${chongwu.id})"/>
					    </c:if>	
						
					</td>
				</tr>
				</c:forEach>
		        <c:forEach items="${requestScope.chongwuserch}" var="chongwu" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chongwu.biaoti}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.nianling}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/${chongwu.fujian}')" onmouseout = "out()" style="cursor:hand;">
							查看图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.fabushi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.zt}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="chongwuDel(${chongwu.id})"/>
						<c:if test="${chongwu.zt=='待领养'}">
					        <input type="button" value="领养申请" onclick="lingyangMana(${chongwu.id})"/>
					        <input type="button" value="设置领养" onclick="lingyang(${chongwu.id})"/>
					    </c:if>	
						
					</td>
				</tr>
				</c:forEach>
				<c:forEach items="${requestScope.chongwuList}" var="chongwu" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chongwu.biaoti}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.nianling}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/${chongwu.fujian}')" onmouseout = "out()" style="cursor:hand;">
							查看图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.fabushi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chongwu.zt}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="chongwuDel(${chongwu.id})"/>
						<c:if test="${chongwu.zt=='待领养'}">
					        <input type="button" value="领养申请" onclick="lingyangMana(${chongwu.id})"/>
					        <input type="button" value="设置领养" onclick="lingyang(${chongwu.id})"/>
					    </c:if>	
						
					</td>
				</tr>
				</c:forEach>
			</table>
			
		    <div id="tip" style="position:absolute;display:none;border:0px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="200" width="260"></TD>
				</TR>
			</TABLE>
		    </div>
	</body>
</html>
