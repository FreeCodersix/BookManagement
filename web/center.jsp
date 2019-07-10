<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="layui/layui.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>



<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-main">
            <a class="logo" href="/">
                <img src="/static/img/logo.jpg" alt="layui" style="border-radius: 50%;width: 32px;height: 32px;float:left;margin-top:10px;">
            </a>
            <h1 class="layui-nav-item" style="height: 50px;width: 500px;float:left;margin-left: 20px;color:#cccccc;font-family:微软雅黑;line-height: 50px;font-size: 20px;">
                个人中心
            </h1>
            <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
            <ul class="layui-nav" style="float: right;">
                <li class="layui-nav-item layui-this">
                    <a href="#">个人中心</a>
                </li>
                <li class="layui-nav-item">
                    <a href="homePage.jsp?src=book?method=list">主页<!--  --></a>
                </li>


                <li class="layui-nav-item">
                    <a href="index.jsp" target="_self">注销</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-main">

        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">个人信息</li>
                <li>我的订单</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <div class="layui-tab-item layui-show">

                    <!-- 内容1 -->
                    <form class="layui-form " action="" style="margin-top:30px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空" value="cw" autocomplete="off" class="layui-input" readonly="readonly">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="password" lay-verify="required" lay-reqtext="密码不能为空" value="123456" autocomplete="off" class="layui-input" readonly="readonly">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="男" title="男" checked="" readonly="readonly" disabled="">
                                <input type="radio" name="sex" value="女" title="女" readonly="readonly" disabled="">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">生日</label>
                                <div class="layui-input-inline">
                                    <input type="date" name="birthday" id="date" lay-verify="date" autocomplete="off" class="layui-input" readonly="readonly" value="2019-02-07" disabled="">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">年龄</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="age" value="22" autocomplete="off" class="layui-input" readonly="readonly">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">手机号码</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="phone" lay-verify="phone" value="18888888888" autocomplete="off" class="layui-input" readonly="readonly">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <%--<textarea placeholder="" class="layui-textarea"></textarea>--%>
                                <input type="text" value="安徽科技学院" readonly="readonly" class="layui-input">
                            </div>
                        </div>


                        <div class="layui-form-item" id="checknumber">
                            <div class="layui-inline">
                                <label class="layui-form-label">验证码</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="confirm" lay-verify="required" lay-reqtext="验证码错误" autocomplete="off" class="layui-input">

                                </div>
                            </div>
                            <div class="layui-inline">
                                <img title="点击更换" src="Kaptcha.jpg" alt="验证码" style="width: 100px;height: 40px;cursor: pointer;" id="kaptcha_img">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn">修改</button>
                            </div>
                        </div>
                    </form>


                </div>

                <div class="layui-tab-item">        <!-- 内容2 -->
                    <table class="layui-hide" id="demo"></table>

                </div>
            </div>
        </div>

    </div>
</div>
<script>
    $(function () {
        $("#kaptcha_img").click(function () {
            $(this).hide().attr('src', this.src + '?' + new Date().getTime()).fadeIn();
        });
    });
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

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
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
//        form.on('submit(demo1)', function(data){
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            });
//            return false;
//        });
    });
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
//        var layid = location.hash.replace(/^#test=/, '');
//        element.tabChange('test', layid);
//
//        element.on('tab(test)', function(elem){
//            location.hash = 'test='+ $(this).attr('lay-id');
//        });

    });

    layui.use('table', function(){
            var table = layui.table;

            //展示已知数据
            table.render({
                elem: '#demo'
                ,cols: [[ //标题栏
                    {field: 'id', title: 'ID', width: 80, sort: true}
                    ,{field: 'username', title: '用户名', width: 120}
                    ,{field: 'email', title: '邮箱', minWidth: 150}
                    ,{field: 'sign', title: '签名', minWidth: 160}
                    ,{field: 'sex', title: '性别', width: 80}
                    ,{field: 'city', title: '城市', width: 100}
                    ,{field: 'experience', title: '积分', width: 80, sort: true}
                ]]
                ,data: [{
                    "id": "10001"
                    ,"username": "杜甫"
                    ,"email": "xianxin@layui.com"
                    ,"sex": "男"
                    ,"city": "浙江杭州"
                    ,"sign": "人生恰似一场修行"
                    ,"experience": "116"
                    ,"ip": "192.168.0.8"
                    ,"logins": "108"
                    ,"joinTime": "2016-10-14"
                }]
                //,skin: 'line' //表格风格
                ,even: true
                //,page: true //是否显示分页
                //,limits: [5, 7, 10]
                //,limit: 5 //每页默认显示的数量
            });
    });


//    layui.use('table', function(){
//        var table = layui.table;
//
//        table.render({
//            elem: '#test'
//            ,url:'/demo/table/user/'
//            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
//            ,cols: [[
//                {field:'id', title: 'ID', sort: true}
//                ,{field:'username', title: '用户名'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
//                ,{field:'sex', title: '性别', sort: true}
//                ,{field:'city', title: '城市'}
//                ,{field:'sign', title: '签名'}
//                ,{field:'classify', title: '职业', align: 'center'} //单元格内容水平居中
//                ,{field:'experience', title: '积分', sort: true, align: 'right'} //单元格内容水平居中
//                ,{field:'score', title: '评分', sort: true, align: 'right'}
//                ,{field:'wealth', title: '财富', sort: true, align: 'right'}
//            ]]
//        });
//    });
</script>


</body>
</html>
