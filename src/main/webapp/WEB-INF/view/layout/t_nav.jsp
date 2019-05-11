<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-header">
    <div class="layui-logo">高校讲师科研教育管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                <%

                    String name=(String)request.getAttribute("name");
                %>
                <%=name%>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="/PersonDetail">个人资料</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/user/exit">退出登录</a></li>
    </ul>
</div>