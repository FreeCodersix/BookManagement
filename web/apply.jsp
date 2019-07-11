<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>advice</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="layui/layui.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>
<div class="layui-main">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="apply_nav layui-this" id="apply1">申请借阅</li>
            <li class="apply_nav" id="apply2">申请归还</li>
            <li class="apply_nav" id="apply3">申请预定</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show">
                <!-- 内容1 -->
                <form class="layui-form " action="" style="margin-top:30px;">
                    <input type="hidden" name="state" value="借阅">

                <div class="layui-form-item">

                    <label class="layui-form-label">借阅</label>
                    <div class="layui-input-block">
                        <select name="conti" lay-filter="aihao" lay-verify="required">
                            <option value=""></option>
                            <option value="否" selected="">初借</option>
                            <option value="是">续借</option>
                        </select>
                    </div>

                </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">书名</label>
                        <div class="layui-input-block">
                            <input type="text" name="b_name" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">

                        <label class="layui-form-label">借阅时间</label>
                        <div class="layui-input-block">
                            <select name="loanTime" lay-filter="aihao" lay-verify="required">
                                <option value=""></option>
                                <option value="7" selected="">一周</option>
                                <option value="14">两周</option>
                                <option value="21">三周</option>
                                <option value="30">一个月</option>
                                <option value="60">两个月</option>
                                <option value="90">三个月</option>
                            </select>
                        </div>

                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block">
                            <textarea placeholder="选填" class="layui-textarea" name="r_ps"></textarea>
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
                    <input type="hidden" name="state" value="归还">

                    <div class="layui-form-item">

                        <label class="layui-form-label">归还</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" value="还书" disabled="disabled">
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">书名</label>
                        <div class="layui-input-block">
                            <input type="text" name="b_name" autocomplete="off" class="layui-input">
                        </div>
                    </div>



                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block">
                            <textarea placeholder="选填" class="layui-textarea" name="r_ps"></textarea>
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
                    <input type="hidden" name="state" value="预定">

                    <div class="layui-form-item">

                        <label class="layui-form-label">预定</label>
                        <div class="layui-input-block">
                            <input class="layui-input" type="text" value="预定" disabled="disabled">
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">书名</label>
                        <div class="layui-input-block">
                            <input type="text" name="b_name" autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block">
                            <textarea placeholder="选填" class="layui-textarea" name="r_ps"></textarea>
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
        $(".apply_nav").removeClass("layui-this");
        var idn = document.getElementById("<%=request.getParameter("apply_id")%>");
        idn.className="apply_nav layui-this";
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
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单初始赋值
        form.val('example', {
            "username": "贤心" // "name": "value"
            ,"password": "123456"
            ,"interest": 1
            ,"like[write]": true //复选框选中状态
            ,"close": true //开关状态
            ,"sex": "女"
            ,"desc": "我爱 layui"
        })


    });
</script>
</body>
</html>