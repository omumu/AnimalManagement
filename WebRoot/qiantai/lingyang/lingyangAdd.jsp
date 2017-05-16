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
	    function check()
        {
              if( document.form1.xingming.value=="")
              {
	               alert("请输入姓名");
	               return false;
              }
              if( document.form1.lianxi.value=="")
              {
	               alert("请输入联系电话");
	               return false;
              }
              document.form1.submit();
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
	          <div>
		           <form action="<%=path %>/lingyangAdd.action" name="form1" method="post">
	                              <table width="108%"  border="0" cellpadding="8" cellspacing="1" bgcolor="#CBD8AC">
									<tr bgcolor="#EEF4EA">
								        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>&nbsp;</span></td>
								    </tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="15%" bgcolor="#FFFFFF" align="right">
									        您的姓名：
									    </td>
									    <td width="85%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="xingming" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="15%" bgcolor="#FFFFFF" align="right">
									        家庭住址：
									    </td>
									    <td width="85%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="zhuzhi" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="15%" bgcolor="#FFFFFF" align="right">
									        联系方式：
									    </td>
									    <td width="85%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="lianxi" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="15%" bgcolor="#FFFFFF" align="right">
									       自我介绍：
									    </td>
									    <td width="85%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="jieshao" style="width:560px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="30">
									    <td width="15%" bgcolor="#FFFFFF" align="right">
									        &nbsp;
									    </td>
									    <td width="85%" bgcolor="#FFFFFF" align="left">
									       <input type="hidden" name="chongwuId" value="<%=request.getParameter("chongwuId") %>"/>
									       <input type="button" value="提交" onclick="check()"/>&nbsp; 
									       <input type="reset" value="重置"/>&nbsp;
									    </td>
									</tr>
								 </table>   
                              </form>
	          </div>
	      </div>
      </div>
      
      
      
      
      
      <footer>
          <a href="<%=path %>/login.jsp">系统后台</a>
      </footer>
  </div>
</body>
</html>
