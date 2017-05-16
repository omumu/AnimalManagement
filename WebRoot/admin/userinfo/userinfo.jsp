<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
  <style type="text/css">
  body {background-image:url(<%=path %>/images/beijing3.png);}
  </style>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
    
    <script type="text/javascript">
        function check1()
        {
              /* if(document.form1.userName.value=="")
              {
	               alert("请输入账号");
	               return false;
              } */
              if(document.form1.userPw.value=="")
              {
	               alert("请输入密码");
	               return false;
              }
              if(document.form1.userRealname.value=="")
              {
	               alert("请输入姓名");
	               return false;
              }
              document.form1.submit();
        }
        
        function up()
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
    </script>
  </head>
  
  <body style="margin: 15px;">
	
	                 <form action="<%=path %>/userEditMe.action" name="form1" method="post">
	                      <table bgcolor="#CCCCFF" width="70%"  border="0" cellpadding="1" cellspacing="1" >
							<tr bgcolor="#EEF4EA" style="height: 10px;">
						        <td colspan="2" class='title'><span>&nbsp;</span></td>
						    </tr>
						    <tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							                  账号：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userName" style="width: 288px;" value="${sessionScope.user.userName }" disabled="disabled"/>
							         (账号只读)
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        密码：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userPw" style="width: 288px;"  value="${sessionScope.user.userPw }"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        姓名：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userRealname" value="${sessionScope.user.userRealname }"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        性别：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userSex" value="${sessionScope.user.userSex }"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        住址：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userAddress" style="width: 288px;" value="${sessionScope.user.userAddress }"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        电话：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userTel" style="width: 288px;" value="${sessionScope.user.userTel }"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="28">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        邮箱：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							         <input type="text" name="userEmail" style="width: 288px;" value="${sessionScope.user.userEmail }"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="30">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							        &nbsp;
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							       <input type="hidden" name="userId" value="${sessionScope.user.userId }"/>
							       <input type="button" value="提交" onclick="check1()"/>&nbsp; 
							       <input type="reset" value="重置"/>&nbsp;
							    </td>
							</tr>
						 </table>            
                     </form>                          
	            
</body>
</html>
