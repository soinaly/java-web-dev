<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2019/9/27
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.bo.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>首页</title>
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
    h2, h3 {
      color: rgb(73, 73, 73);
    }
    #search {
      height: 80px;
      background-color: rgb(246, 246, 241);
      display: flex;
      align-items: center;
      padding-left: 8%;
      margin-bottom: 10px;
    }
    .search-input {
      flex: 0 0 40%;
      height: 35px;
      background-color: #fff;
      border: none;
      border-radius: 3px;
      margin-left: 50px;
    }
    .search-btn {
      width: 35px;
      height: 35px;
      background-color: rgb(155, 154, 143);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .search-btn img {
      width: 50%;
      height: 50%;
    }
    .card {
      height: 180px;
      margin: 20px 5px 20px 5px;
    }
    .card img {
      width: 100%;
      height: 90%;
    }
    .card p {
      font-size: 13px;
      color: #9b9b9b;
    }
    .col-4 img {
      margin: 10px 5px 20px 5px;
      width: 80%;
    }
    hr {
      width: 90%;
      color: #eee;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<%
  List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<%--使用jsp的include动作，将top.jsp页面包含进来，这个顶部导航可以给各个页面共享--%>
<div id="top">
  <jsp:include page="top.jsp"/>
</div>

<%--搜索区--%>
<div id="search">
  <h2>读书时刻</h2>
  <input type="text" placeholder="书名、作者、ISBN" class="search-input">
  <div class="search-btn">
    <img src="images/search.png" alt="">
  </div>
</div>

<%--主体内容区--%>
<div class="container">
  <div class="row">
    <%--左侧2/3主体部分--%>
    <div class="col-8">
      <h3>新书速递</h3>
      <hr>
      <div class="row">
        <%--遍历图书数据集合，将每个图书对象放入页面对象--%>
        <%
          for (Book book : bookList) {
            pageContext.setAttribute("book", book);
        %>
        <%--引用col-2表示每行显示5本，再追加card细节样式--%>
        <div class="col-2 card">
          <%--点击每本图书封面图，地址栏跳转为/detail/id,进入图书详情Servlet--%>
          <a href="${pageContext.request.contextPath}/detail/${book.id}">
            <img src="images/${book.cover}" alt="">
          </a>
          <p style="color: rgb(51, 119, 178)">${book.name}</p>
          <p>${book.author}</p>
        </div>
        <%
          }
        %>
      </div>
    </div>
    <div class="col-4">
      <h3>热门标签</h3>
      <hr>
      <a href="https://weather.com"><img src="images/right.png" alt=""></a>
      <hr>
      <img src="images/right2.png" alt="">
    </div>
  </div>

  <footer>
    <ul>
      <li>@2015-2019</li>
      <li>niit.edu.cn,</li>
      <li>all rights reserved</li>
      <li>南工院计算机学院</li>
    </ul>
    <ul>
      <li>联系我们</li>
      <li>帮助中心</li>
      <li>法律声明</li>
      <li>移动合作</li>
    </ul>
  </footer>
</div>
</body>
</html>