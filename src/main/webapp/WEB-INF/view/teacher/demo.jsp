<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>

    <div class="layui-body">
        <div style="padding: 15px;">
        <!-- 内容主体区域 -->
        <div class="demoTable">
            <div class="layui-inline">
             学院：
            </div>
            <div class="layui-inline">
                 <input class="layui-input" name="faculty" id="faculty" autocomplete="off">
            </div>

            <div class="layui-inline">
               用户名：
            </div>
            <div class="layui-inline">
                 <input class="layui-input" name="username" id="username" autocomplete="off">
            </div>

            <button class="layui-btn" data-type="reload">搜索</button>
        </div>

                <table  class="layui-hide" id="test"></table>
            <script type="text/html" id="toolbarDemo">
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
                    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
                    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
                </div>
            </script>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>


        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/user/queryUsers'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', title: 'ID', sort: true}
                    ,{field:'userName', title: '用户名'}
                    ,{field:'faculty', title: '学院'}
                    ,{field:'sex', title: '性别'}
                    ,{field:'account', title: '账号'}
                    ,{field:'password',  title: '密码'}
                    ,{field:'creatTime', title: '注册时间'}
                    ,{field:'modifyTime',  title: '修改时间'}
                    ,{field:'phone', title: '联系电话'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });






        var $ = layui.$, active = {
            reload: function(){
                var faculty = $('#faculty');
                var username=$('#username');
                //执行重载
                table.reload('test', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        key: {
                            faculty: faculty.val(),
                            userName:username.val(),
                        }
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


            //头工具栏事件
            table.on('toolbar(test)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id);
                switch(obj.event){
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：'+ data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选': '未全选');
                        break;
                };
            });

            //监听行工具事件
            table.on('tool(test)', function(obj){
                var data = obj.data;
                //console.log(obj)
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del();
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    layer.prompt({
                        formType: 2
                        ,value: data.email
                    }, function(value, index){
                        obj.update({
                            email: value
                        });
                        layer.close(index);
                    });
                }
            });


        });




    </script>
</div>
</body>
</html>