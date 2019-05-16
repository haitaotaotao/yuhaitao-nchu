<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="techermanager.pojo.User" %>
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
            <table  class="layui-hide" id="test"></table>
        </div>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        </script>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/teacher/PersonDetail'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', title: 'ID', sort: true}
                    ,{field:'userName', title: '用户名'}
                    ,{field:'account', title: '账号'}
                    ,{field:'creatTime', title: '注册时间'}
                    ,{field:'faculty', title: '学院'}
                    ,{field:'sex', title: '性别'}
                    ,{field:'modifyTime',  title: '修改时间'}
                    ,{field:'phone', title: '联系电话'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });

    </script>
</div>
</body>
</html>