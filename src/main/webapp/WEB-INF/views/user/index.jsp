<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/15
  Time: 上午9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--这个是bootstrap好用的前提,在最上边--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>

    <%--两侧留白--%>
    <div class="container">
        <div class="input-group">
            <input id="content" type="text" class="form-control" placeholder="你要写点什么...">
            <span class="input-group-btn">
        <button id="btn" class="btn btn-default" type="button">发布</button>
      </span>
        </div><!-- /input-group -->

        <table class="table table-striped" id="tab">

        </table>


    </div>
</body>
<script>
    //给按钮添加一个点击方法,获取输入框内的内容,在body 写省去 一个window.onload方法

    $("#btn").click(function () {
//       alert( $("#content").val())
        //1.发送输入框内的消息给服务器
        //>1 .首先定义一个消息发送的请求地址
        //地址为:/addnew
        //发送的参数: content=xxx
        //返回参数:  content=xxx
        //注意:实际工作中,上述的参数,都是参数列表
        //>2.使用ajax 请求数据

        //使用jquery 发送请求
        $.ajax({
            //url:请求的地址
            url:"/addnew",
            //请求的方式(method)
            type:"get",
            //请求附带的参数列表
            data:{
                content:$("#content").val()
            },
            //请求成功的回调方法:最终处理数据的方法
            success:function (result) {
                //这个result: 就是请求回来的数据
                console.log(result)
                addNewTr(0,result.content,0,0,0)
            }
        })
        //2.将发送成功的消息显示在table上
    })
    function addNewTr(id,content,upcount,downcount,how) {
        var tdleft=$("<td></td>").html("<p>"+content+"</p>")
        var tdright=$("<td></td>")
        //父标签 :append  子标签:appendTo
        tdright.append("顶:")
        $("<a href='#'></a>").html(upcount).appendTo(tdright)

        tdright.append("踩:")
        $("<a href='#'></a>").html(downcount).appendTo(tdright)

        $("<a href='#'>删除 </a>").appendTo(tdright).attr("num",id).click(delfunc)

        //将左右两个td 添加到tr中
        //<tr id="ss2"></tr>
        var trOb=$("<tr></tr>").append(tdleft).append(tdright).attr("id","ss"+id)

        //将生成的tr 添加到写好的table中
        $("#tab").append(trOb)
    }


    //新需求:显示历史消息
    //要求:每次加载完页面,要显示所有的历史消息

    function getAllMessage() {
        //从服务器请求数据到前端页面
        $.ajax({
            url:"getall",
            //默认为 get
            success:function (result) {
                for(var i =0; i<result.length;i++){
                    //遍历返回的数组,依次在table中添加一行
                    var msg=result[i];
                    addNewTr(msg.id,msg.content,msg.up,msg.down,0)
                }
            }
        })

    }
    //页面加载完毕,去请求所有的消息数据
    getAllMessage();

    //前后端开发的形式
    //1. 前后端 责任分离:
    //      前端只负责将数据不熟到复杂的页面中
    //      后台只负责将数据库的数据整合后发送json/xml 给前端
    //2.系统的耦合性降低
    //      前后端之间的交流仅限ajax 和json 数据
    //3.降低了维护成本
    //      前端的问题只有前端吃力,后台的问题由后台处理
    //      前后端出现了人员变动,对一边没影响



    var delfunc=function () {
        //1.获取a标签中的num属性,自定义的属性
        var aid = $(this).attr("num");
        $.ajax({
            url:"/delete",
            data:{
                id:aid
            },
            success:function () {
                window.location.reload();
            }
        })
        //2.拼接tr的id,进行删除
        $("#ss"+aid).remove()
    }


</script>
</html>
