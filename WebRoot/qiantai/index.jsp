<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
    <script type="text/javascript" src="<%=path %>/js/lunbo.js"></script>
    
	<script type="text/javascript">
	    
	</script>
	
	<style type="text/css">
		.c1-bline{border-bottom:#99CC99 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>
  </head>
   
  <body bgcolor="red">
  
  <div id="main">
	  <jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>

      <div id="site_content">
	      <jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
	      <div class="content">
	                 <div style="width:754px;padding-bottom:1px;bgcolor:#CCFFCC;">
					      <div style="height:26px;background:url(<%=path %>/images/guangguang.PNG);font-size: 14px;color:#de3237;">
					         <span style="float:left;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;margin-left: 10px;">系统公告</span>
							 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
					      </div>
					      <div style="border:1px solid #A9A9A9;">
					           <c:forEach items="${requestScope.gonggaoList}" var="gonggao">
								   <div class="c1-bline" style="padding:5px 0px;margin-top: 6px;">
								       <div class="f-left" style="margin-left: 10px;">
									         <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
								             <a href="<%=path %>/gonggaoDetailQian.action?gonggaoId=${gonggao.gonggaoId}">${gonggao.gonggaoTitle}</a>
								       </div>
								      <div class="f-right" style="margin-right: 10px;">${gonggao.gonggaoData}</div>
								      <div class="clear"></div>
								   </div>
							   </c:forEach>
							   <br/>
					      </div>
					 </div>
					 <div style="width:754px;padding-bottom:1px;margin-top: 5px;">
					      <!-- <div style="height:26px;background:url(<%=path %>/images/guangguang.PNG);font-size: 14px;color:#de3237;">
					         <span style="float:left;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;margin-left: 10px;">新闻资讯</span>
							 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
					      </div> -->
					      <div style="border:0px solid #A9A9A9;">
					                <div id="imgADPlayer"></div>
									<script>
										/* PImgPlayer.addItem( "恩恩", "http://www.pomoho.com", "/dgwz/lunbo/10.jpg");
										PImgPlayer.addItem( "test2", "http://www.pomoho.com", "/dgwz/lunbo/11.jpg");
										PImgPlayer.addItem( "test3", "http://www.pomoho.com", "/dgwz/lunbo/12.jpg"); */
										<c:forEach items="${requestScope.xinwenList }" var="xinwen" varStatus="ss">
										    PImgPlayer.addItem( "${xinwen.biaoti}", "<%=path %>/xinwenDetailQian.action?id="+${xinwen.id}, "<%=path %>/${xinwen.fujian}");
										</c:forEach>
										
										PImgPlayer.init( "imgADPlayer", 753, 260 );
									</script>
					     </div>
					 </div>
					 <div style="width:754px;margin-top: 1px;padding-bottom:5px;margin-top: 5px;">
					      <div style="height:26px;background:url(<%=path %>/images/guangguang.PNG);font-size: 14px;color:#de3237;">
					         <span style="float:left;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;margin-left: 10px;">最新发布</span>
							 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
					      </div>
					      <div style="border:1px solid #A9A9A9">
							   <TABLE class=main border=0 cellSpacing=9 cellPadding=9 height=115>
					              <TR>
					                  <c:forEach items="${requestScope.chongwuList}" var="chongwu" varStatus="sta">
					                    <c:if test="${sta.index%4==0}">
					                       </tr><tr>
					                    </c:if>
						                <TD>
						                  <TABLE onmouseover="this.style.backgroundColor='#FF6600'" onmouseout="this.style.backgroundColor='#C76114'" border=0 cellSpacing=1 cellPadding=2 bgColor=#e1e1e1>
						                    <TR>
						                      <TD bgColor=#ffffff  align="center">
						                           <center>
						                              <A href="<%=path %>/chongwuDetailQian.action?id=${chongwu.id}">
						                              <IMG border=0 src="<%=path %>/${chongwu.fujian}" width=172 height=130></A>
						                           </center>
						                           <center>
						                              <A href="<%=path %>/chongwuDetailQian.action?id=${chongwu.id}">
						                              <FONT color=#6666CC><c:out value="${fn:substring(chongwu.biaoti, 0, 12)}" escapeXml="false"></c:out>..</FONT></A>
						                              <BR>
						                           <center>
						                      </TD>
						                    </TR>
						                  </TABLE>
						                </TD>
					                </c:forEach>
					              </TR>
				                 </TABLE>
							   <br/> 
					      </div>
					 </div>
	      </div>
      </div>
      
      
      
      
      
      <footer >
          <a href="<%=path %>/login.jsp">系统后台</a>
      </footer>
  </div>
</body>
</html>
