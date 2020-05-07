<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="util.checkUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="static/JS/jquery-1.12.4.js"></script>
    <script src="layui/layui.js"></script>
    <style>
        .addtr {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-main">
            <a class="logo" href="/">
                <img src="${pageContext.request.contextPath}/static/img/logo.jpg" alt="layui"
                     style="border-radius: 50%;width: 32px;height: 32px;float:left;margin-top:10px;">
            </a>
            <h1 class="layui-nav-item"
                style="height: 50px;width: 500px;float:left;margin-left: 20px;color:#cccccc;font-family:微软雅黑;line-height: 50px;font-size: 20px;">
                个人中心
            </h1>
            <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
            <ul class="layui-nav" style="float: right;">
                <li class="layui-nav-item layui-this">
                    <a href="#"><i class="layui-icon">&#xe770;</i>个人中心</a>
                </li>
                <li class="layui-nav-item">
                    <a href="homePage.jsp?src=book?method=list&u_id=<%=session.getAttribute("u_id").toString()%>&identify=<%=session.getAttribute("identify")%>"><i
                            class="layui-icon">&#xe68e;</i>主页</a>
                </li>


                <li class="layui-nav-item">
                    <a href="index.jsp" target="_self"><i class="layui-icon">&#xe65c;</i>注销</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-main">

        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li id='li1' class="layui-this">个人信息</li>
                <li id="li2">我的借阅
                </li>
                <li id="li3">我的反馈
                </li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <div id='div1' class="layui-tab-item layui-show">

                    <!-- 内容1 -->
                    <form class="layui-form " action="" style="margin-top:30px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空"
                                       value="<%=session.getAttribute("username")%>" autocomplete="off"
                                       class="layui-input" readonly="readonly">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">生日</label>
                                <div class="layui-input-inline">
                                    <input type="date" name="birthday" id="date" class="layui-input" value=""
                                           disabled="">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">年龄</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="age" value="" autocomplete="off" class="layui-input"
                                           id="age" readonly="readonly">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">手机号码</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="phone" lay-verify="phone" value=""
                                           autocomplete="off" class="layui-input" readonly="readonly" id="tel">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-inline">
                                <%--<textarea placeholder="" class="layui-textarea"></textarea>--%>
                                <input type="text" value="安徽科技学院" class="layui-input" readonly="readonly">
                            </div>
                        </div>


                        <div class="layui-form-item" id="checkNumber" style="display: none">
                            <div class="layui-inline">
                                <label class="layui-form-label">验证码</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="confirm" lay-verify="required" lay-reqtext="验证码错误"
                                           autocomplete="off" class="layui-input">

                                </div>
                            </div>
                            <div class="layui-inline" id="kaptcha">
                                <img title="点击更换" src="Kaptcha.jpg" alt="验证码"
                                     style="width: 100px;height: 40px;cursor: pointer;" id="kaptcha_img">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" id="change">修改</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 内容2 -->
                <div id="div2" class="layui-tab-item">
                    <button class="layui-btn" title="点击隐藏已归还记录" id="btn_hidden">隐藏</button>
                    <table class="layui-table" id="demo" border="1" style="text-align: center;">
                        <tr>
                            <th style="text-align: center;" width="40">序号</th>
                            <th style="text-align: center;" width="60">用户ID</th>
                            <th style="text-align: center;" width="60">书ID</th>
                            <th style="text-align: center;" width="140">书名</th>
                            <th style="text-align: center;" width="140">借阅时间</th>
                            <th style="text-align: center;" width="140">应归还时间</th>
                            <th style="text-align: center;" width="140">借阅状态</th>
                            <th style="text-align: center;" width="200">操作</th>
                            <th style="text-align: center;display: none;" width="200">id</th>
                        </tr>
                    </table>
                </div>
                <%--内容3--%>
                <div id="div3" class="layui-tab-item">
                    <table class="layui-table" id="feedBack" border="1" style="text-align: center;">
                        <tr>
                            <th style="text-align: center;" width="40">序号</th>
                            <th style="text-align: center;" width="60">用户ID</th>
                            <th style="text-align: center;" width="60">反馈类型</th>
                            <th style="text-align: center;" width="140">反馈内容</th>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<script>

    $(function () {
        if (<%=request.getParameter("isReturn")%>) {
            alert('已提交申请,请等待管理员审核!');
        }

        $("#kaptcha_img").click(function () {
            $(this).hide().attr('src', this.src + '?' + new Date().getTime()).fadeIn();
        });
        var url = window.location.href;
        if (url.indexOf("flag") !== -1) {
            $("#demo").find("tr:not(:first)").empty("");
            go();
        }
        if(url.indexOf('show') !== -1){
            $('div').removeClass('layui-show');
            $("li").removeClass('layui-this');
            $('#li3').addClass('layui-this');
            $("#div3").addClass('layui-show');
            $("#feedBack").find("tr:not(:first)").empty("");
            feedBack();
        }
        $("#li2").click(function () {
            $("#demo").find("tr:not(:first)").empty("");
            f();
        });
        $("#li3").click(function () {
            $("#feedBack").find("tr:not(:first)").empty("");
            feedBack();
        })
    });

    $(function () {
        // var btn = document.getElementById("btn_hidden");
        $("#btn_hidden").click(function () {
            var btnText = $(this).text();
            // console.log(btnText);
            var trArr = document.getElementsByTagName("tr");
            if (btnText === "隐藏") {
                for (var i = 0; i < trArr.length; i++) {
                    (function (i) {
                        // var btnState = $(trArr[i].lastChild).attr("id");
                        var btnState = $(trArr[i].children).eq(-2);
                        if ($(btnState).text() === "归还") {
                            trArr[i].style.display = "none";
                        }
                    })(i);
                }
                $(this).text("显示");
                $(this).attr("title", "点击显示已归还记录");
            } else {
                for (var j = 0; j < trArr.length; j++) {
                    (function (j) {
                        // var btnState = $(trArr[i].lastChild).attr("id");
                        var btnState = $(trArr[j].children).eq(-2);
                        if ($(btnState).text() === "归还") {
                            trArr[j].style.display = "";
                        }
                    })(j);
                }
                $(this).text("隐藏");
                $(this).attr("title", "点击隐藏已归还记录");
            }
        });
    });

    $(function () {
        // $("button").click(function (ev) {//获取点击id
        $(document).on('click', 'button', function (ev) {
            ev.preventDefault();
            var sure = false;
            var sid = $(this).attr("id");
            if (sid !== "change" && sid !== "btn_hidden") {
                var id = sid.split("+")[0];
                var btn = document.getElementById(id);
                var state = sid.split("+")[1];
                if (state === "借阅")
                    layui.use('layer', function () {
                        var layer = layui.layer;

                        layer.open(
                            {
                                title: '',
                                content: '是否提交还书申请？',
                                closeBtn: true,
                                shade: 0.3,
                                move: false,
                                yes: function (index) {
                                    sub(id);
                                    layer.close(index);
                                }
                            }
                        );
                    });
                else if(state == '归还') {
                    alert("您已归还此书，请勿重复归还!");
                }else{
                    alert("您已提交申请，请等待管理员审核!");
                }
            }
        });

    });

    function sub(id) {
        <%--<%checkUser.updateState(id,"待审核");%>--%>
        location.href = 'book?method=returnBooks&rbid=' + id+'&state=待审核';
    }

    function f() {
        <%
        session.setAttribute("u_id",session.getAttribute("u_id"));
        %>
        <%
        List<String> list = new LinkedList<>();
        try {
        list = checkUser.queryBorrow(list,session.getAttribute("u_id").toString());
        }catch (Exception e) {
        e.printStackTrace();
        }
        int k = 0;
        for(String string : list) {
            String data[] = string.split(",");
            %>

        var tr = document.createElement('tr');
        tr.class = '.last_tr';
        var tdd = document.createElement('td');
        tdd.innerText = <%=k%>;
        tr.appendChild(tdd);
        <%
            String bid=null;
            for (int i = 0; i < 6; i++) {
                %>
        var td = document.createElement('td');
        td.innerText = '<%=data[i]%>';
        tr.append(td);
        <%
                bid = data[1] + ":" + data[6] + "+" + data[5];
            }
            %>

        var ttdd = document.createElement('td');
        ttdd.innerHTML = "<button class=\"layui-btn\" id=\"<%=bid%>\">还书</button>";
        tr.append(ttdd);
        $(tr).addClass("addtr");
        $("#demo").append(tr);
        <%
          k++;
        }
        %>

    }

    function feedBack() {
        <%
        session.setAttribute("u_id",session.getAttribute("u_id"));
        %>
        <%
        List<String> feedBackList = new LinkedList<>();
        try {
        feedBackList = checkUser.queryFeedBack(feedBackList,session.getAttribute("u_id").toString());
        }catch (Exception e) {
        e.printStackTrace();
        }
        int k1 = 0;
        for(String string : feedBackList) {
            String data[] = string.split(",");
            %>

        var tr = document.createElement('tr');
        tr.class = '.last_tr';
        var tdd = document.createElement('td');
        tdd.innerText = <%=k1%>;
        tr.appendChild(tdd);
        <%
            for (int i = 0; i < 3; i++) {
                %>
        var td = document.createElement('td');
        td.innerText = '<%=data[i]%>';
        tr.append(td);

        $(tr).addClass("addtr");
        $("#feedBack").append(tr);
        <%
        }
          k1++;
        }
        %>

    }

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

        //监听提交
        // form.on('submit(demo1)', function(data){
        // layer.alert(JSON.stringify(data.field), {
        // title: '最终的提交信息'
        // });
        // return false;
        // });
    });

    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                    , content: '内容' + (Math.random() * 1000 | 0)
                    , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            , tabDelete: function (othis) {
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            , tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

    });

    function go() {
        $('#div1').removeClass('layui-show');
        $('#div2').addClass('layui-show');
        $('#li1').removeClass('layui-this');
        $('#li2').addClass('layui-this');
        f();
    };

    $(function () {
        $("#change").click(function () {
            var change = document.getElementById("change");
            var text = change.innerText;
            if (text === "修改") {
                $("input").removeAttr("readOnly");
                /*$("#man").removeAttr("disabled");
                $("#woman").removeAttr("disabled");*/
                change.innerText = "提交";
                var chenkNumber = document.getElementById("checkNumber");
                checkNumber.style.display = "block";
            } else {

            }
        })
    });

    $(function () {
        window.onload = function () {
            <%
                session.setAttribute("u_id",session.getAttribute("u_id"));
                String msg = "";
                try {
                    msg = checkUser.queryUser(msg,session.getAttribute("u_id").toString());
                }catch (Exception e) {
                    e.printStackTrace();
                }
                String meta[] = msg.split(":");
            %>


            //日期栏赋值
            var date = "<%=meta[1]%>";
            var date1 = new Date(date);
            //格式化日，如果小于9，前面补0
            var day = ("0" + date1.getDate()).slice(-2);
            //格式化月，如果小于9，前面补0
            var month = ("0" + (date1.getMonth() + 1)).slice(-2);
            //拼装完整日期格式
            var today = date1.getFullYear() + "-" + (month) + "-" + (day);
            //完成赋值
            $('#date').val(today);


            //年龄栏赋值
            $("#age").val("<%=meta[2]%>");

            //电话栏赋值
            $("#tel").val("<%=meta[3]%>");
        }
    });

</script>

</body>
</html>