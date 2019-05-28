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

        <form class="layui-form" style="margin-left: 20%;">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名:

                </label>
                <div style="margin-top: 11px;float: left;width: 50%;">
                    <div class="layui-input-inline" style="width: 100%;">
                        <input type="text" name="password" required lay-verify="required" value="<%=user.getUserName()%>" placeholder="请输入账号" autocomplete="off" class="layui-input" disabled>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">账号:
                </label>
                <div style="margin-top: 11px;float: left;width: 50%;">
                    <div class="layui-input-inline" style="width: 100%;">
                        <input type="text" name="password" required lay-verify="required" value="<%=user.getAccount()%>" placeholder="请输入账号" autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">密码:
                </label>

                <div style="margin-top: 11px;float: left;width: 50%;" >
                    <div class="layui-input-inline" style="width: 100%;">
                        <input type="text" name="password" required lay-verify="required" value="<%=user.getPassword()%>" placeholder="请输入密码" autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">手机号:
                </label>

                <div style="margin-top: 11px;float: left;width: 50%;">
                    <div class="layui-input-inline" style="width: 100%;">
                        <input type="text" name="password" required lay-verify="required" value="<%=user.getPhone()%>" placeholder="请输入手机号" autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所在学院:
                </label>
                <div style="margin-top: 11px;float: left;width: 50%;">
                    <div class="layui-input-inline" style="width: 100%;">
                        <input type="text" name="password" required lay-verify="required" value="<%=user.getFaculty()%>" placeholder="请输入学院" autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">权限:
                </label>

                <div style="float: left;">
                    <div>
                        <input type="checkbox"
                        <% if (user.getStatus()==0){
                        %>

                        <%
                        } else {%>
                               checked
                        <%}
                        %>
                               name="open" lay-skin="switch" lay-text="ON|OFF" disabled>
                    </div>

                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别:
                </label>
                <div style="float: left;">
                    <div class="">
                        <input type="radio" name="sex" value="男" title="男"
                        <% if("男".equals(user.getSex())){%>
                            checked
                        <%}%>
                        disabled>
                        <input type="radio" name="sex" value="女" title="女"
                            <% if("女".equals(user.getSex())){%>
                               checked
                            <%}%>
                        disabled>
                    </div>
                </div>
            </div>

            <a class="layui-btn" href="/EditUser" style="margin-left: 54%;">变更资料</a>

        </form>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
</div>
</body>
</html>