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
            数据分析，根据老师项目数显示个图

            <table  class="layui-hide" id="test"></table>
        </div>

    </div>
    <%@include file="../layout/t_foot.jsp" %>

</div>
</body>
</html>