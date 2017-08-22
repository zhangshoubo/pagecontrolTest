<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/15
  Time: 下午3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <%--<script>--%>
        <%----%>
        <%--$(document).ready(function () {--%>
            <%--//文档加载完毕 要执行的内容,相当于window.onload--%>
        <%--})--%>
        <%--$(function () {--%>
            <%--//和上述的两种上是等价--%>

        <%--})--%>
    <%--</script>--%>
</head>
<body>
    <div id="div1"></div>
    <%--emment语法--%>
    <div>a</div>
    <div>b</div>
    <div>c</div>
    <div>d</div>
    <div>e</div>
    <div>f</div>
    <div>g</div>


    <div class="aaa">
        <ul>
            <li></li>
        </ul>
    </div>


    <div class="aaa">
        <li></li>
    </div>

    <div>
        <ul>
            <li></li>
        </ul>
        <span></span></div>

    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>

    <ol>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ol>

    <div>
        <header>
            <ul>
                <lli></lli>
                <lli></lli>
            </ul>
        </header>
        <footer>
            <p></p>
        </footer>
    </div>
    <div>
        <ul>
            <li></li>
        </ul>
        <span></span></div>








</body>
<script>
    //获取标签, html方法 相当于innerHTML ,html 赋值与取值一起的
    //html 放有值就是赋值,没有就是取值
    //val(),text() attr() 都是一样的,
    $("#div1").html("aaaaa")
    console.log($("#div1").html())

    //给标签赋值新的属性
    $("#div1").attr("class","divclass")
    console.log($("#div1").attr("class"))

    //如果获取一堆的标签对象
    $("div").html("明天下雨")
    $("div").first().html("五环")
    $("div").last().html("五环")
    $("div").eq(1).html("第几个")










</script>
</html>
