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
</div>
<%@include file="../layout/t_foot.jsp" %>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'/teacher/CourseInfo'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', title: 'ID', sort: true}
                ,{field:'courseId', title: '课程号'}
                ,{field:'courseName', title: '课程名'}
                ,{field:'uesrId', title: '教师工号'}
                ,{field:'userName', title: '教师名'}
                ,{field:'courseTime',  title: '创建时间'}
                ,{field:'address', title: '上课地点'}
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