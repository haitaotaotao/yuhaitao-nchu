<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
<link rel="stylesheet" href="/css/layui.css"  media="all">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>
    <div class="layui-body">
        <div style="padding: 15px;">
            <!-- 内容主体区域 -->
            <div class="demoTable">
                <div class="layui-inline">
                    科研项目名：
<%--                    查询功能无法实现--%>
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="itemName" id="itemName" autocomplete="off">
                </div>

                <button class="layui-btn" data-type="reload">搜索</button><br>
<%--                假的交互客服--%>
                <a href="tencent://message/?uin=2083552705&Site=400301.com&Menu=yes">客服咨询</a><br>
                <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>

            </div>
            <table  class="layui-hide" id="test"></table>
        </div>
        <script type="text/html" id="barDemo">
            <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
            <a class="layui-btn layui-btn-xs layui-icon" id="test3" lay-event="edit" type="=file">选择文件</a>
<%--            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">撤销</a>--%>
        </script>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <script src="/js/layui.js" charset="utf-8"></script>
    <script>

        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/item/ItemInfo'
                ,cellMinWidth: 75 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', title: 'ID', sort: true}
                    ,{field:'itemName', title: '科研项目名'}
                    ,{field:'uesrId', title: '教师工号'}
                    ,{field:'userName', title: '教师名'}
                    ,{field:'statusName', title: '状态'}
                    ,{field:'creatTime',  title: '创建时间'}
                    ,{field:'file', title: '文件地址'}
                    ,{field:'remark', title: '备注'}
                    ,{field:'deadLine', title: '期限'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            layui.use('upload', function(){
                var $ = layui.jquery
                    ,upload = layui.upload;

                upload.render({
                    elem: '#test3'
                    ,url: '/upload/'
                    ,accept: 'file' //普通文件
                    ,done: function(res){
                        console.log(res)
                    }
                });
            });

            var $ = layui.$, active = {
                reload: function(){
                    var itemName=$('#itemName');
                    //执行重载
                    table.reload('test', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            key: {
                                itemName:itemName.val(),
                            }
                        }
                    });
                }
            };

            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });

    </script>
</div>
</body>
</html>