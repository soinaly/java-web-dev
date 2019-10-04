<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2019/10/3
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bo.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-size: 14px;
            color: #333333;
            overflow-x: hidden;
        }

        /*flex布局的基础设置，将一行看作12列*/
        .row {
            display: flex;
            /*四个内边距*/
            padding: 5px 5px 5px 5px;
            /*允许换行，这样用一个row套若干个column即可*/
            flex-wrap: wrap;
        }

        /*父元素等宽*/
        .col-12 {
            flex: 0 0 99%;
        }

        /*父元素2/3*/
        .col-8 {
            flex: 0 0 66%;
        }

        /*父元素一半*/
        .col-6 {
            flex: 0 0 48%;
        }

        /*父元素1/3*/
        .col-4 {
            flex: 0 0 33%;
        }

        /*父元素1/4*/
        .col-3 {
            flex: 0 0 24%;
        }

        /*父元素1/6*/
        .col-2 {
            flex: 0 0 16.6%;
        }

        /*超链接样式，颜色，无下划线*/
        a, a:link {
            color: #eee;
            text-decoration: none;
        }

        /*伪类样式，鼠标悬停颜色*/
        a:hover {
            color: #fff;
        }

        #top {
            height: 50px;
            background: linear-gradient(to bottom,  rgb(77, 182, 172),rgb(84, 86, 82));
            color: #d5d5d5;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-left: 20px;
            padding-right: 50px;
        }

        #top ul {
            display: flex;
            align-items: center;
            list-style: none;
        }

        #top ul li {
            flex: 0 0 60px;
        }

        .avatar {
            width: 33px;
            height: 33px;
            border-radius: 50%;
        }

        .container {
            width: 85%;
            margin: 0 auto;
        }

        footer {
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-top: 1px dashed #ddd;
        }

        footer ul {
            list-style: none;
            display: flex;
            padding: auto 10px auto 10px;
        }

        footer ul li {
            font-size: 12px;
            color: #aaaaaa;
            margin-right: 10px;
        }
        .explore {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgb(237, 244, 237);
            height: 80px;
            padding-left: 8%;
            padding-right: 10px;
        }
        .nav {
            display: flex;
            align-items: center;
            list-style: none;
        }
        .nav li {
            color: rgb(61, 133, 73);
            font-size: 18px;
            margin-right: 20px;
        }
        .search-input {
            flex: 0 0 30%;
            height: 35px;
            background-color: #fff;
            border: none;
            border-radius: 3px;
            margin-left: 50px;
            color: rgb(187, 187, 202);
            font-size: 16px;
        }
        .info {
            display: flex;
        }
        .profile {
            width: 80px;
            height: 80px;
            border-radius: 5px;
        }
        h2 {
            color: rgb(73, 73, 73);
            margin-left: 15px;
        }
        .info-box {
            padding: 10px 10px 10px 10px;
            width: 90%;
            height: 240px;
            border: 1px solid #eee;
            border-radius: 5px;
            background-color: rgb(237, 244, 237);
        }
        .info-box .top {
            height: 80%;
            display: flex;
            border-bottom: 1px solid #e4e6e5;
        }
        .info-box .top img {
            width: 55%;
            height: 85%;
            margin-right: 5px;
            border-radius: 5px;
        }
        p {
            font-size: 13px;
            color: #333;
            padding-top: 5px;
            padding-bottom: 5px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .item {
            height: 80px;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .read {
            border-bottom: 1px solid #eee;
        }
        .read a {
            color: rgb(51, 119, 170);
            text-decoration: none;
        }
        .container {
            width: 85%;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    pageContext.setAttribute("user", user);
%>

<%--顶部区域，引入共用的top.jsp页面--%>
<div id="top">
    <jsp:include page="top.jsp"/>
</div>

<%--浏览区域--%>
<div class="explore">
    <ul class="nav">
        <li><a href="/index">首页</a></li>
        <li><a href="/index"> 浏览发现</a></li>
        <li><a href="/index"> 话题广场</a></li>
        <li><a href="/index">我的豆瓣</a></li>
    </ul>
    <label>
        <input type="text" placeholder="搜索你感兴趣的内容和人" class="search-input">
    </label>
</div>
<br>

<%--页面主题区域--%>
<div class="container">
    <div class="row">
        <%--左侧2/3区域--%>
        <div class="col-8">
            <div class="info">
                <img src="images/${user.avatar}" alt="" class="profile">
                <h2>${user.nickname}</h2>
            </div>
            <br>
            <div class="item">
                <ul class="nav">
                    <li>内容简介</li>
                </ul>
                <p>
                    二战后的巴黎。一个得了健忘症的男人被好心的私家侦探于特收留，获得了新的身份：居依•罗朗。
                    罗朗为于特当了八年助理侦探，在于特退休之际，决定揭开自己的经历与身世之谜。
                    他真的是一张照片上的那个年轻人，被许多人指认的那个南美外交官？他的记忆也许是在逃离德占区时丧失的？
                    在这部独特、优雅的小说中，帕特里克•莫迪亚诺塑造了一个寻找自己身份的男人。
                    他神秘的过去被掩藏在德占时期的巴黎，那是法兰西记忆的黑洞……</p>
            </div>
            <div class="item">
                <ul class="nav">
                    <li>作者简介</li>
                </ul>
                <p>帕特里克•莫迪亚诺，法国当代著名作家，2014年诺贝尔文学奖获得者。
                    莫迪亚诺1945年生于巴黎郊外布洛涅—比扬古地区，父亲是犹太金融企业家，母亲是比利时演员。1968年莫迪亚诺在伽利玛出版社出版处女作《星形广场》一举成名。
                    1972年的《环城大道》获法兰西学院小说大奖，1978年的《暗店街》获得龚古尔奖。1996年，莫迪亚诺获得法国国家文学奖。
                    他还分别于2010年和2012年获得法兰西学院奇诺•德尔•杜卡基金会世界奖和奥地利欧洲文学奖这两项终身成就奖。</p>
            </div>
            <div class="item">
                <ul class="nav">
                    <li>我读</li>
                </ul>
                <p>帕特里克·莫迪亚诺作品系列 (共26册), 这套丛书还有 《八月的星期天》,《青春咖啡馆》,《青春咖啡馆》,《凄凉别墅》,《来自遗忘的最深处》 等。</p>
            </div>
            <div class="item">
                <ul class="nav">
                    <li>留言板</li>
                </ul>
                <label>
                    <textarea cols="80" rows="5"></textarea>
                </label>
                <div>
                    <input type="button" value="留言">
                </div>
            </div>
        </div>

        <%-- 右侧1/3区域--%>
        <div class="col-4">
            <div class="info-box">
                <div class="top">
                    <img src="images/${user.avatar}" alt="">
                    <div>
                        <p>常居：${user.address}</p>
                        <p>账号：${user.account}</p>
                        <p>${user.joinDate}加入</p>
                    </div>
                </div>
                <br>
                <p>${user.nickname}</p>
            </div>
            <br>
            <div class="item">
                <ul class="nav">
                    <li>我的广播· · · · · · (全部)</li>
                </ul>
                <br>
                <div class="read">
                    <p><a href="">${user.nickname}</a>想读
                        <a href="https://book.douban.com">在豆瓣书店有售</a>
                    </p>
                    <p style="color: #9b9b9b;">2019年10月2日</p>
                </div>
                <div class="read">
                    <p><a href="">${user.nickname}</a>想读
                        <a href="https://book.douban.com">转让给其他二手平台？</a>
                    </p>
                    <p style="color: #9b9b9b;">2019年10月2日</p>
                </div>
                <div class="read">
                    <p><a href="">${user.nickname}</a>想读
                        <a href="https://book.douban.com">有694人想读,手里有一本闲着?</a>
                    </p>
                    <p style="color: #9b9b9b;">2019年10月2日</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>