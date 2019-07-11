<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--suppress ALL --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>advice</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="layui/layui.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>
    <div class="layui-main">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="advice_nav layui-this" id="advice1">问题</li>
                <li class="advice_nav" id="advice2">投诉</li>
                <li class="advice_nav" id="advice3">意见和建议</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <div class="layui-tab-item layui-show">
                    <!-- 内容1 -->
                    <form class="layui-form " action="" style="margin-top:30px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">类型</label>
                            <div class="layui-input-block">
                                <input type="text" name="type" value="问题" autocomplete="off" class="layui-input" disabled="disabled">
                            </div>
                        </div>


                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">问题描述</label>
                            <div class="layui-input-block">
                                <textarea placeholder="请输入内容" lay-verify="required" lay-reqtext="请输入问题描述" class="layui-textarea"></textarea>
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="layui-tab-item">
                    <!-- 内容2 -->
                    <form class="layui-form " action="" style="margin-top:30px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">类型</label>
                            <div class="layui-input-block">
                                <input type="text" name="type" value="投诉" autocomplete="off" class="layui-input" disabled="disabled">
                            </div>
                        </div>


                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">投诉内容</label>
                            <div class="layui-input-block">
                                <textarea placeholder="请输入内容" lay-verify="required" lay-reqtext="请输入问题描述" class="layui-textarea"></textarea>
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="layui-tab-item">
                    <!-- 内容3 -->
                    <form class="layui-form " action="" style="margin-top:30px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">类型</label>
                            <div class="layui-input-block">
                                <input type="text" name="type" value="意见和建议" autocomplete="off" class="layui-input" disabled="disabled">
                            </div>
                        </div>


                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">具体内容</label>
                            <div class="layui-input-block">
                                <textarea placeholder="请输入内容" lay-verify="required" lay-reqtext="请输入问题描述" class="layui-textarea"></textarea>
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </div>

    <script>
        window.onload = function (ev) {
            $(".advice_nav").removeClass("layui-this");
            var idn = document.getElementById("<%=request.getParameter("nav_id")%>");
            idn.className="advice_nav layui-this";
            return false;
        };
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
    </script>
</body>
</html>