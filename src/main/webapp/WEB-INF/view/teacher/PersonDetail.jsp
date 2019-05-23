<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="techermanager.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>
    <div class="layui-body">
        <%
            User user = (User) request.getAttribute("user");
        %>

        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名:
                </label>
                <div class="layui-input-block">
                    <%=user.getUserName()%>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">账号:
                </label>
                <div class="layui-input-block">
                    <%=user.getAccount()%>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">密码:
                </label>

                <div class="layui-input-block">
                    <%=user.getPassword()%>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">手机号:
                </label>

                <div class="layui-input-block">
                    <%=user.getPhone()%>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所在学院
                </label>
                <div class="layui-input-block">
                    <%=user.getFaculty()%>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">权限
                </label>

                <div class="layui-input-block">
                    <% if (user.getStatus()==0){

                        %>
                    <span>管理员</span>
                    <%
                            } else {%>

                    <span>普通</span>

                    <%}
                    %>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别
                </label>
                <div class="layui-input-block">
                    <%=user.getSex()%>
                </div>
            </div>

            <a class="layui-btn layui-btn-primary" href="/EditUser">编辑</a>

        </form>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
</div>
</body>
</html>