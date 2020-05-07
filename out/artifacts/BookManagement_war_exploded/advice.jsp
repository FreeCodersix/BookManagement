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
                <li class="advice_nav" id="advice1">问题</li>
                <li class="advice_nav" id="advice2">投诉</li>
                <li class="advice_nav" id="advice3">意见和建议</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <div id="advice_item1" class="layui-tab-item">
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
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="return false">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>

                </div>
                <div id="advice_item2" class="layui-tab-item">
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
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="return false">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>

                </div>
                <div id="advice_item3" class="layui-tab-item">
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
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="return false">立即提交</button>
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
            $(".layui-tab-item").removeClass("layui-show");
            let idn_id = "<%=request.getParameter("nav_id")%>";
            if(idn_id=="advice1" || idn_id=="advice4"){
                idn_id = 'advice1'
            }else if(idn_id == "advice2" || idn_id=="advice5"){
                idn_id = 'advice2'
            }else{
                idn_id = 'advice3'
            }
            var idn = document.getElementById(idn_id);
            idn.className="advice_nav layui-this";
            if(idn.id=="advice1" || idn.id=="advice4"){
                $("#advice_item1").addClass("layui-show")
            }else if(idn.id == "advice2" || idn.id=="advice5"){
                $("#advice_item2").addClass("layui-show")
            }else{
                $("#advice_item3").addClass("layui-show")
            }
            return false;
        };
        $(function () {
            $("#kaptcha_img").click(function () {
                $(this).hide().attr('src', this.src + '?' + new Date().getTime()).fadeIn();
            });


        });
        $('button[type=submit]').click(function () {

            var type = $('div.layui-show input[name=type]').val();
            var content = $('div.layui-show textarea.layui-textarea').val();
            var u_id = window.parent.location.href.split('u_id=')[1]
                console.log(u_id)
                $.getJSON(
                    "book?method=saveFeedBack",
                    {
                        "u_id": u_id,
                        "type": type,
                        "content":content
                    },
                    function (result) {
                        console.log(result.msg)
                        if(result.msg=='true'){
                            alert("反馈成功！")
                            window.parent.location.href = "http://localhost:8080/center.jsp?u_id="+u_id+"&show=3"
                        }
                    }
                );
        })
        // layui.use(['form', 'layedit', 'laydate'], function(){
        //     var form = layui.form
        //         ,layer = layui.layer
        //         ,layedit = layui.layedit
        //         ,laydate = layui.laydate;
        //
        //
        //     //创建一个编辑器
        //     var editIndex = layedit.build('LAY_demo_editor');
        //
        //     //自定义验证规则
        //     form.verify({
        //         title: function(value){
        //             if(value.length < 5){
        //                 return '标题至少得5个字符啊';
        //             }
        //         }
        //         ,pass: [
        //             /^[\S]{6,12}$/
        //             ,'密码必须6到12位，且不能出现空格'
        //         ]
        //         ,content: function(value){
        //             layedit.sync(editIndex);
        //         }
        //     });
        //
        //
        //
        // });
        // layui.use('element', function(){
        //     var $ = layui.jquery
        //         ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
        //
        //     //触发事件
        //     var active = {
        //         tabAdd: function(){
        //             //新增一个Tab项
        //             element.tabAdd('demo', {
        //                 title: '新选项'+ (Math.random()*1000|0) //用于演示
        //                 ,content: '内容'+ (Math.random()*1000|0)
        //                 ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
        //             })
        //         }
        //         ,tabDelete: function(othis){
        //             //删除指定Tab项
        //             element.tabDelete('demo', '44'); //删除：“商品管理”
        //
        //
        //             othis.addClass('layui-btn-disabled');
        //         }
        //         ,tabChange: function(){
        //             //切换到指定Tab项
        //             element.tabChange('demo', '22'); //切换到：用户管理
        //         }
        //     };
        //
        //
        //
        // });
    </script>
</body>
</html>