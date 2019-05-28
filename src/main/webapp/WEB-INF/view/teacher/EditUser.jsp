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
        <%
            User user=(User)request.getAttribute("user");


        %>
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" value="<%=user.getUserName()%>"  disabled="disabled" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">输入账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="uNo" value="<%=user.getAccount()%>" required  lay-verify="required" disabled="disabled" placeholder="请新用户账号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码框</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">建议密码为6位数以上</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input type="phone" name="phone" required lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新用户所在学院</label>
                    <div class="layui-input-block">
                        <select name="faculty" lay-verify="required">
                            <option value=""></option>
                            <option value="计算机学院">计算机学院</option>
                            <option value="软件学院">软件学院</option>
                            <option value="艺术学院">艺术学院</option>
                            <option value="测光学院">测光学院</option>
                            <option value="经管学院">经管学院</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">是否是管理员权限</label>
                    <div class="layui-input-block">
                        <input type="checkbox"
                            <% if (user.getStatus()==1){
                        %>

                            <%
                        } else {%>
                               disabled
                               <%}
                        %>name="status" lay-skin="switch">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女" checked>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即更新</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function(data){

                $.ajax({
                    url: "/user/doEdit",
                    type: "POST",
                    contentType:"application/json",
                    data:JSON.stringify(data.field),  //data表示要发送的数据
                    dataType: "json",//预期服务器返回的数据类型
                    processData: false,  // 不处理数据
                    success: function (data) {
                        layer.msg(JSON.stringify(data.field));

                        if (data==1) {
                            layer.msg("更新成功");
                        }

                        if (data==-1){
                            layer.msg("异常");
                        }

                    }});

                return false;
            });
        });
    </script>
</div>
</body>
</html>