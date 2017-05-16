<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />

<script type="text/javascript" src="<%=path%>/js/lunbo.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function getLabelsGet(){ 
	/* alert("ok"); */
	var xmlHttp; 
	if (window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		} else if (window.XMLHttpRequest) { 
		xmlHttp=new XMLHttpRequest(); 
		}
　　if (xmlHttp==null){ 
　　　　alert('您的浏览器不支持AJAX！'); 
　　　　return; 
　　	} 
　　	var careTime = document.getElementById('careTime').value; 
	var careDesc = document.getElementById('careDesc').value;
	var careStartDate = document.getElementById('careStartDate').value;
	var carePhone = document.getElementById('carePhone').value; 

	/* alert(careTime);
	alert(careDesc);
	alert(careStartDate);
	alert(carePhone); */
　　	var url="addCare.action?careTime="+careTime+"&careDesc="+careDesc+"&careStartDate="+careStartDate+"&carePhone="+carePhone+"&random="+Math.random(); 
　	xmlHttp.open("GET",url,true); 
　　	xmlHttp.send(); 
　　	xmlHttp.onreadystatechange=function() { 
　　		if(xmlHttp.readyState==4){
            if(xmlHttp.status=200){
                
            	var data=eval('('+xmlHttp.responseText+')'); //json解析方法JSON.parse 或者 eval('('+xhr.responseText+')')
        		//alert(data.data);
        		if(data.data=='errorArg'){
        			alert("参数错误！");
        		}
        		if(data.data=='errorPhone'){
        			alert("电话号码格式错误！");
        		}
        		if(data.data=='ok'){
        			alert("请求成功");
        			window.location.href="<%=path %>/preCare.action";
        		}
        		 
            	
            	
            	
            }
        }
}
} 
</script>

<style type="text/css">
.c1-bline {
	border-bottom: #999 1px dashed;
	border-top: 1px;
}

.f-right {
	float: right
}

.f-left {
	float: left
}

.clear {
	clear: both
}

#pageCode ul li {
	float: left;
}

#pageCode ul li a {
	border: 1px solid #ccc;
	padding: 2px 10px;
	list-style: none;
	margin: 0;
}
</style>
</head>

<body>
	<div id="main">
		<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>

		<div id="site_content">
			<jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
			<div class="content">
				<div
					style="width: 754px; margin-top: 1px; padding-bottom: 5px; margin-top: 5px;">
					<div
						style="height:26px;background:url(<%=path%>/images/guangguang.PNG);font-size: 14px;color:#de3237;">
						<span
							style="float: left; font-family: 微软雅黑; font-size: 14px; margin-top: 3px; margin-left: 10px;">
							宠物寄养</span> <span
							style="float: right; font-family: 微软雅黑; font-size: 14px; margin-top: 3px;">&nbsp;</span>
					</div>
					<div style="border: 1px solid #A9A9A9">
						<div id="publishShow" style="margin: 2px;">
							<div style="width: 50%; margin: 0 auto;">
								<form action="<%=path%>/addCare.action" method="post"
									enctype="multipart/form-data">
									寄养时间： <select name="careTime" id="careTime">
										<option value="1">1天</option>
										<option value="2">2天</option>
										<option value="3">3天</option>
										<option value="4">4天</option>
										<option value="5">5天</option>
										<option value="6">6天</option>
										<option value="7">7天</option>
									</select> (￥100元/天) <br> 寄养备注：<input type="text"
										style="width: 50%; margin-top: 20px;" name="careDesc"
										id="careDesc" value="${c.careDesc }" /> <br /> 开始时间：<input
										type="text" style="width: 50%; margin-top: 20px;"
										name="careStartDate" value="${c.careStartDate }"
										onClick="WdatePicker()" id="careStartDate" /> <br /> 寄养人电话：<input
										type="text"
										style="width: 50%; margin-top: 20px; margin-bottom: 20px;"
										name="carePhone" value="${c.carePhone }" id="carePhone" /> <br />
									<input type="button" value="提交" style="margin-left: 20px;"
										onclick="getLabelsGet()"> <input type="reset"
										value="重置" style="margin-left: 40px;">
									<p>${errorMsg }</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





		<br class="clear" />
		<footer> <a href="<%=path%>/login.jsp">系统后台</a> </footer>
	</div>
</body>
</html>
