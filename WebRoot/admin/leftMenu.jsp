<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	
	<link rel="stylesheet" href="<%=path %>/css/leftMenu.css" type="text/css"></link>
  
    <script type="text/javascript" src="<%=path %>/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-common.js"></script>
	
    <script type="text/javascript">
        var state = 0;
        $(document).ready(function () {
            /********* 菜单收缩效果***********/
            $(".navcontent").hide();
            $(".navhead").click(function () {
                $(".navcontent").not($(this).next()).hide();
                $(this).next().slideToggle(200);
                $("a[type='Module']").not($(this)).attr("class", "navhead");
                if ($(this).attr("class") == "navhead") {
                    $(this).attr("class", "navheadOpen");
                }
                else {
                    $(this).attr("class", "navhead");
                }
            });
            $(".navhead").first().click();
        });
    </script>
    
    <style type="text/css">
        html
        {
            _overflow-x: hidden;
            height: 100%;
        }
        body
        {
            background-color: #D9F3FF;
            padding: 0px;
            margin: 0px;
            height: 100%;
        }
        ul
        {
            margin: 0px;
            padding: 0px;
        }
        li
        {
            list-style: none;
            margin: 0px;
            padding: 0px;
        }
    </style>
  </head>
  
  <body style="margin: 0px;">
        <div id="Menu" style="width: 190px; float: left; margin: 2px 0px 0px 2px; _margin-left: 2.5px;overflow: hidden;">
            <div style="margin-left: 2px; width: 180px; height: 25px; vertical-align: middle;line-height: 25px; font-size: 16px; font-weight: bold; color: White;font-family: 微软雅黑; background-image: url('<%=path %>/images/menutop.png')"> <!-- 管理菜单 -->
            </div>
            <ul id="identifier">
                <li><a class="navhead" type='Module' style="font-family: 微软雅黑;">
                    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;修改登陆密码</a>
                    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/admin/userinfo/userPw.jsp" style="font-family: 微软雅黑;">修改登陆密码</a></li>
	                </ul>
                </li>
				<li><a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;注册用户管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />
						&nbsp;<a target="main" href="<%=path %>/userMana.action" style="font-family: 微软雅黑;">注册用户管理</a></li>
				    </ul>
				</li>
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;宠物类别管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/orgMana.action" style="font-family: 微软雅黑;">宠物类别管理</a></li>
				    </ul>
				</li>
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;宠物领养管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/chongwuMana.action" style="font-family: 微软雅黑;">宠物领养管理</a></li>
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/admin/chongwu/chongwuAdd.jsp" style="font-family: 微软雅黑;">发布宠物信息</a></li>
				    </ul>
				</li>
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;留言信息管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/liuyanMana.action" style="font-family: 微软雅黑;">留言信息管理</a></li>
				    </ul>
				</li>
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;新闻资讯管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/xinwenMana.action" style="font-family: 微软雅黑;">新闻资讯管理</a></li>
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/admin/xinwen/xinwenAdd.jsp" style="font-family: 微软雅黑;">添加新闻资讯</a></li>
				    </ul>
				</li>
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;系统公告管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/gonggaoMana.action" style="font-family: 微软雅黑;">系统公告管理</a></li>
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/admin/gonggao/gonggaoAdd.jsp" style="font-family: 微软雅黑;">添加系统公告</a></li>
				    </ul>
				</li>
				
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;论坛信息管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/catelogMana.action" style="font-family: 微软雅黑;">论坛版块管理</a></li>
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/zhutiMana.action" style="font-family: 微软雅黑;">帖子信息管理</a></li>
				    </ul>
				</li>
				
				<li>
				    <a class="navhead" type='Module' style="font-family: 微软雅黑;">
				    <img style='vertical-align:middle' src="<%=path %>/images/group.png" />&nbsp;宠物寄养管理</a>
				    <ul class="navcontent">
						<li><img  style='vertical-align:middle' src="<%=path %>/images/vcard_add.png" />&nbsp;
						<a target="main" href="<%=path %>/careList.action" style="font-family: 微软雅黑;">寄养信息管理</a></li>
				    </ul>
				</li>
            </ul>
            <div style="margin-left: 2px; width: 180px; height: 28px; background-image: url('<%=path %>/images/foot.png')"></div>
        </div>
</body>
</html>
