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
              if( document.form1.userName.value=="")
              {
	               alert("请输入账号");
	               return false;
              }
              if( document.form1.userPw.value=="")
              {
	               alert("请输入密码");
	               return false;
              }
              
                if(document.form1.userTel.value !="")
				{
				    var sMobile = document.form1.userTel.value; 
					    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile)))
					    { 
					        alert("请输入正确的11位手机号"); 
					        return false; 
					    }
				}
				
				if(document.form1.userEmail.value !="")
				{
				      if (!isEmail(document.form1.userEmail.value))
				      {
					  alert("您输入的邮箱有误,请重新核对后再输入!");
					  return false;
				      }
				    
				}
				
              document.form1.submit();
        }
        
        function isEmail(str)
		{
		    var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
		    return reg.test(str);
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
		           <form action="<%=path %>/userReg.action" name="form1" method="post">
	                                  <table width="108%"  border="0" cellpadding="8" cellspacing="1" bgcolor="#CBD8AC">
									<tr bgcolor="#EEF4EA">
								        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>&nbsp;</span></td>
								    </tr>
								    <tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									                  账号：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="userName" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        密码：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="userPw" style="width: 288px;"  value="000000"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        姓名：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="userRealname" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        性别：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="radio" name="userSex" value="男" checked="checked"/>男
									         &nbsp;&nbsp;
									         <input type="radio" name="userSex" value="女"/>女
									         
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        住址：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="userAddress" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        电话：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="userTel" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="32">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        邮箱：
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
									         <input type="text" name="userEmail" style="width: 288px;"/>
									    </td>
									</tr>
									<tr align='center' bgcolor="#FFFFFF" height="30">
									    <td width="10%" bgcolor="#FFFFFF" align="right">
									        &nbsp;
									    </td>
									    <td width="90%" bgcolor="#FFFFFF" align="left">
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
