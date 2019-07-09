<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>公司管理列表</title>
    <link rel="stylesheet" href="../static/CSS/register.css">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">

    <script src="../layui/layui.js"></script>
    <script src="../static/JS/jquery-1.12.4.js"></script>

</head>
<body>
<form action="company" method="post">
    <input type="hidden" name="method" value="list"/><%--param.id也可以--%>
    <table border="1" width="480">
        <tr>
            <td>公司</td>
            <td><input type="text" name="name" size="20"></td>
            <td>老板</td>
            <td><input type="text" name="c_boss" size="20"></td>
        </tr>
        <tr>
            <td>年限</td>
            <td><input type="text" name="start_year" size="5"> —
                <input type="text" name="end_year" size="5"></td>
            <td>地址</td>
            <td><input type="text" name="c_city" size="20"></td>
            <td><input type="submit" value="查询"></td>
        </tr>
    </table>
</form>
<input type="button" value="添加" onclick="location.href='company?method=input'">


<table border="1" style="width: 100% ;height: 100%;text-align: center;" lay-filter="parse-table-demo" class="layui-hide" id="test">
    <tr>
        <th>序号</th>
        <th>ID</th>
        <th>公司</th>
        <th>老板</th>
        <th>城市</th>
        <th>年限</th>
        <th>操作</th>
    </tr>

    <%--@elvariable id="companyList" type="java.util.List"--%>
    <c:forEach var="company" items="${companyList}" varStatus="vs">

        <tr>
            <td>${vs.count}</td>
            <td>${company.id}</td>
            <td>${company.name}</td>
            <td>${company.c_boss}</td>
            <td>${company.c_city}</td>
            <td>${company.c_year}</td>
            <td>
                <a href="?method=input&id=${company.id}">修改</a>
                <a href="?method=delete&id=${company.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="layui-btn-group demoTable" style="margin-bottom: 10px;">
    <button class="layui-btn" data-type="parseTable">立即转化为数据表格</button>
</div>
<%--<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>--%>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'/demo/table/user/'
            ,cols: [[
                {field:'num', width:80, title: 'num', sort: true},
                {field:'id', width:80, title: 'ID', sort: true}
                // ,{field:'username', width:80, title: '用户名'}
                ,{field:'username', width:80, title: '公司'}
                ,{field:'sex', width:80, title: '性别', sort: true}
                ,{field:'city', width:80, title: '城市'}
                ,{field:'sign', title: '签名', minWidth: 150}
                ,{field:'experience', width:80, title: '积分', sort: true}
                ,{field:'score', width:80, title: '评分', sort: true}
                ,{field:'classify', width:80, title: '职业'}
                ,{field:'wealth', width:135, title: '财富', sort: true}
            ]]
            ,page: true
        });
    });
</script>
</body>
<%--<body>--%>
<%--     <h1>layui表格</h1>--%>
<%--     <div>--%>
    <%--             <!-- 查询栏 -->--%>
    <%--        <form class="search-form layui-form">--%>

    <%--            <div class="layui-form-item layui-inline">--%>
    <%--                <label class="layui-form-label">员工名称</label>--%>
    <%--                <input class="layui-input" name="name" type="text" style="width: 165px;">--%>
    <%--            </div>--%>
    <%--            <div class="layui-form-item layui-inline search">--%>
    <%--                <button class="layui-btn layui-btn-normal" lay-filter="searchBtn" lay-submit>查询</button>--%>
    <%--            </div>--%>
    <%--        </form>--%>
    <%--        <div>--%>
    <%--            <table class="layui-hide" id="test" lay-filter="test3" ></table>--%>
    <%--        </div>--%>
    <%--     </div>--%>
<%--     --%>
<%--     <div id="E_add_edit" style="display:none">--%>
    <%--         <form class="layui-form" style="padding:20px">--%>
    <%--             <!-- 用户名 -->--%>
    <%--             <div class="layui-form-item emp-name">--%>
    <%--                 <label class="layui-form-label" >用户名</label>--%>
    <%--                 <div class="layui-input-inline">--%>
    <%--                     <input class="layui-input" type="text" placeholder="请输入用户名">--%>
    <%--                 </div>--%>
    <%--             </div>--%>
    <%--             <!-- 确定 -->--%>
    <%--            <div style="text-align: center; border: none">--%>
    <%--                <button class="layui-btn layui-btn-normal" lay-filter="saveBtn" lay-submit>确定</button>--%>
    <%--            </div>--%>
    <%--         </form>--%>
    <%--     </div>--%>
<%--     --%>
<%--    <script type="text/html" id="barDemo">--%>
    <%--         <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <%--         <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
    <%--         <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
    <%--    </script>--%>
<%--<script>--%>

    <%--layui.use(['table','layer','laypage','form'],function(){--%>


        <%--var table=layui.table;--%>
        <%--var layer = layui.layer;--%>
        <%--var form = layui.form;--%>
        <%--var laypage = layui.laypage;--%>
        <%--var data;  //保存数据  --%>
        <%--var postData={--%>
            <%--name:"cw",--%>
            <%--pageNumber:1,--%>
            <%--pageSize:10--%>

        <%--};--%>

        <%--//发送ajax  列表查询ajax--%>
        <%--function send(postData){--%>
            <%--$.ajax({--%>
                <%--type: "POST",//请求的方式--%>
                <%--url: "util.user_pwd",//请求的接口--%>
                <%--data: postData,//参数（可传可不传递）--%>
                <%--dataType: "json",//数据类型--%>
                <%--async:false,--%>
                <%--success: function (res) {--%>
                    <%--data=res.content.records;--%>
                    <%--resultData=res.content.records;--%>
                    <%--//console.log("data1  "+data[0].id);--%>
                <%--},--%>

                <%--error:function(err){--%>
                    <%--//失败之后执行（我不管，失败别找我i）--%>
                    <%--obj=err;--%>
                    <%--alert("数据不存在");--%>
                <%--}--%>
            <%--})--%>
        <%--}--%>

        <%--var infoTable;--%>
        <%--var--%>
            <%--// 表单需要的变量--%>
            <%--infoOptions = {--%>
                <%--elem: '#test',--%>
                <%--// width: 347,--%>
                <%--limits: [10],--%>
                <%--cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增--%>
                <%--cols: [[--%>
                    <%--//{field: 'id', title: 'ID',width:20, fixed: 'left'}--%>
                    <%--{field: 'id', title: 'ID', type:'checkbox', width:120, sort: true, fixed: 'left'}--%>
                    <%--,{field: 'accountno', title: '编号', width:120}--%>
                    <%--,{field: 'name', title: '用户名', width:120,edit:'text'}--%>
                    <%--,{field: 'idcard', title: '身份证', width:220}--%>
                    <%--,{field: 'password', title: '密码', width:120,edit:'text'}--%>
                    <%--,{field: 'status', title: '状态', width:120}--%>
                    <%--,{fixed: 'right',title: '操作', width:178, align:'center', toolbar: '#barDemo'}--%>
                <%--]],--%>
                <%--data: []--%>
            <%--};--%>
        <%--//  页面初始化--%>

        <%--// 查询         ------------------------------------------%>
        <%--//监听提交  --%>
        <%--form.on('submit(searchBtn)', function(data){--%>
            <%--//layer.msg(JSON.stringify(data.field));--%>
            <%--var str=JSON.stringify(data.field);--%>
            <%--var data;--%>
            <%--layer.msg(str);--%>
            <%--// 转换 {"name":"gsfs"}--%>
            <%--var json = eval('('+str+')');--%>

            <%--postData.name=json.name;//直接取值 结果0--%>
            <%--console.log("name: "+name);--%>
            <%--init();--%>
            <%--return false;--%>
        <%--});--%>

        <%--// 表格初始化 --------------------%>
        <%--function init (){--%>
            <%--// 列表请求--%>
            <%--send(postData);--%>
            <%--// 完成表格数据--%>
            <%--$.extend(infoOptions, {data: data});--%>
            <%--infoOptions.page = {--%>
                <%--curr: 1--%>
            <%--};--%>
            <%--console.log("data1  "+data[0].id);--%>
            <%--table.render(infoOptions);--%>

            <%--data=null;--%>
        <%--}--%>
        <%--// 页面初始化-----------------------------------%>
        <%--init();--%>

        <%--var postData_add_edit={--%>
            <%--id:"NULL",--%>
            <%--name:"NULL",--%>
            <%--accountno:"NULL",--%>
            <%--password:"NULL",--%>
            <%--status:"NULL",--%>
            <%--idcard:"NULL"--%>
        <%--};--%>
        <%--var message;--%>
        <%--//发送ajax  新增修改ajax--%>
        <%--function sendAE(postData_add_edit){--%>
            <%--$.ajax({--%>
                <%--type: "POST",//请求的方式--%>
                <%--url: "/main/version1/updateemp/"+new Date().getTime(),//请求的接口--%>
                <%--data: postData_add_edit,//参数（可传可不传递）--%>
                <%--dataType: "json",//数据类型--%>
                <%--async:false,--%>
                <%--success: function (res) {--%>
                    <%--console.log("msg "+message);--%>
                    <%--if(res.code==200){--%>
                        <%--console.log("ajax msg"+res.message);--%>
                        <%--message=res.message;--%>
                    <%--}--%>
                <%--},--%>
                <%--error:function(err){--%>
                    <%--alert("系统出错了")--%>
                <%--}--%>
            <%--})--%>
        <%--}--%>
        <%--// 新增修改初始化 --------------------%>
        <%--function init_AE (){--%>
            <%--sendAE(postData_add_edit);--%>
            <%--// 列表请求--%>
            <%--send(postData);--%>
            <%--// 完成表格数据--%>
            <%--$.extend(infoOptions, {data: data});--%>
            <%--infoOptions.page = {--%>
                <%--curr: 1--%>
            <%--};--%>
            <%--console.log("data1  "+data[0].id);--%>
            <%--table.render(infoOptions);--%>

            <%--data=null;--%>
        <%--}--%>
        <%--// 监听 单元格，能进行编辑单元格  只有表头加了 edit 属性才能修改  --%>
        <%--table.on('edit(test3)',function(obj){--%>
            <%--var value=obj.value; //得到修改后的值--%>
            <%--var data=obj.data;  //得到所在行的所有键值--%>
            <%--var field=obj.field;  //得到字段 pwd name           --%>
            <%--postData_add_edit.id=data.id;--%>

            <%--if(field==='name'){--%>
                <%--postData_add_edit.name=value;--%>
                <%--console.log("name "+postData_add_edit.name);--%>
            <%--}--%>
            <%--if(field==='password'){--%>
                <%--postData_add_edit.password=value;--%>
                <%--console.log("password "+postData_add_edit.password);--%>
            <%--}--%>
            <%--//layer.msg('[ID: '+data.id+']'+field+' 字段给改为 '+value);--%>
            <%--init_AE ();--%>
        <%--});--%>

        <%--//  操作  查看 编辑 删除-------------------------------------%>

        <%--// 监听表格复选框 选择--%>
        <%--table.on('tool(test3)',function(obj){--%>
            <%--console.log(obj);--%>
        <%--});--%>
        <%--//监听工具条--%>
        <%--table.on('tool(test3)', function(obj){--%>
            <%--var data = obj.data;--%>
            <%--if(obj.event === 'detail'){--%>
                <%--layer.msg('ID：'+ data.id + ' 的查看操作');--%>
            <%--} else if(obj.event === 'del'){--%>
                <%--layer.confirm('真的删除行么'+data.id, function(index){--%>
                    <%--obj.del();--%>
                    <%--layer.close(index);--%>
                <%--});--%>
            <%--} else if(obj.event === 'edit'){--%>
                <%--layer.alert('编辑行：<br>'+ JSON.stringify(data))--%>
            <%--}--%>
        <%--});       --%>
    <%--});--%>
<%--</script>--%>
<%--</body>--%>
</html>