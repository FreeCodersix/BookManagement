<%--@elvariable id="book" type="train.entity.Book"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <link rel="icon" type="image/x-icon" href="../static/img/logo.jpg"/>
    <link rel="stylesheet" href="../static/CSS/register.css">
    <script src="../layui/layui.js"></script>
    <script src="../static/JS/jquery-1.12.4.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>申请借阅</legend>
</fieldset>

<form class="layui-form " id="form" action="book?method=borrowInsert" method="post" style="margin-top:30px;">
    <input type="hidden" name="b_id" value="${book.b_id}"/><%--param.id也可以--%>
    <input type="hidden" id="loanTime" name="loanTime" value=""/><%--param.id也可以--%>
    <input type="hidden" id="returnTime" name="returnTime" value=""/><%--param.id也可以--%>
    <input type="hidden" id="u_id" name="u_id" value=""/><%--param.id也可以--%>

    <%--书名：<input type="text" name="b_name" value="${book.b_name}" size="30">--%>
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" name="b_name" lay-verify="required" lay-reqtext="书名不能为空" placeholder="请输入书名"
                   autocomplete="off" class="layui-input" readonly="readonly" value="${book.b_name}">
        </div>
    </div>

    <%--类别：<input type="text" name="b_class" value="${book.b_class}" size="30">--%>
    <div class="layui-form-item">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-block">
            <input type="text" name="b_class" lay-verify="required" lay-reqtext="类别不能为空" placeholder="请输入类别"
                   autocomplete="off" class="layui-input" readonly="readonly" value="${book.b_class}">
        </div>
    </div>

    <%--数量：<input type="text" name="b_no" value="${book.b_no}" size="30">--%>
    <div class="layui-form-item">
        <label class="layui-form-label">数量</label>
        <div class="layui-input-block">
            <input type="text" name="b_no" lay-verify="required" lay-reqtext="数量不能为空" placeholder="请输入数量"
                   autocomplete="off" class="layui-input" readonly="readonly" value="${book.b_no}">
        </div>
    </div>

    <%--作者：<input type="text" name="b_author" value="${book.b_author}" size="30">--%>

    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
            <input type="text" name="b_author" lay-verify="required" lay-reqtext="作者不能为空" placeholder="请输入作者"
                   autocomplete="off" class="layui-input" readonly="readonly" value="${book.b_author}">
        </div>
    </div>

    <%--出版社：<input type="text" name="b_publisher" value="${book.b_publisher}" size="30"><br/>--%>
    <%--出版日期：<input type="text" name="b_pubDate" value="${book.b_pubDate}" size="30">--%>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出版社</label>
            <div class="layui-input-inline">
                <input type="text" name="b_publisher" readonly="readonly" autocomplete="off" class="layui-input"
                       value="${book.b_publisher}">

            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出版日期</label>
            <div class="layui-input-inline">
                <input type="date" name="b_pubDate" readonly="readonly" autocomplete="off" class="layui-input"
                       value="${book.b_pubDate}"
                       id="date" lay-verify="date">

            </div>
        </div>
    </div>

    <%--简介：<input type="text" name="b_comment" value="${book.b_comment}" size="30">--%>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" readonly="readonly" name="b_comment"
                      id="textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <%--<button class="layui-btn" lay-filter="demo1" id="mybtn">立即申请</button>--%>
            <input type="button" class="layui-btn" id="mybtn" value="立即申请">
        </div>
    </div>

    <script>
        window.onload = function (ev) {
            $("#textarea").text("${book.b_comment}");
            $("#loanTime").attr("value", getNowFormatDate());
            $("#returnTime").attr("value", getReturnFormatDate());
            $("#u_id").attr("value", '<%=session.getAttribute("u_id")%>');
        };
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;


            //日期
            laydate.render({
                elem: '#date'
            });
            laydate.render({
                elem: '#date1'
            });

            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [
                    /^[\S]{6,12}$/
                    , '密码必须6到12位，且不能出现空格'
                ]
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            //监听指定开关
            form.on('switch(switchTest)', function (data) {
                layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                    offset: '6px'
                });
                layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
            });
        });
        $(function () {
            $("#mybtn").click(function (ev) {//获取点击id
                ev.preventDefault();

                var form = document.getElementById("form");
                layui.use('layer', function () {
                    var layer = layui.layer;

                    layer.open(
                        {
                            title: '注意事项',
                            icon: 0,
                            content: '借阅时间从申请日开始，最长三个月。请在三个月内及时归还或者在系统中申请续借。',
                            closeBtn: 2,
                            shade: 0.3,
                            move: false,
                            yes: function (index) {
                                sub();
                                layer.close(index);
                            }
                        }
                    );
                });


            });
        });

        function sub() {
            form.submit();
        }

        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }

        function getReturnFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 4;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            if (month > 12) {
                month -= 12;
                year += 1;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }
    </script>
</body>
</html>