<%@ page import="techermanager.pojo.User" %>
<%@ page import="java.net.URLDecoder" %>
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
            String utf =URLDecoder.decode(request.getQueryString(),"utf-8");
//            System.out.println(utf+"**********");
            String[] param = utf.split("&");
            String[] value = new String[param.length];
            for(int i = 0; i < param.length; i++) {
                value[i] = param[i].split("=")[1];
            }
        %>
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="userName" value="<%=value[0]%>" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="uNo" value="<%=value[1]%>" required  lay-verify="required" placeholder="请新用户账号" autocomplete="off" class="layui-input" disabled>
                    </div>
                    <div class="layui-form-mid layui-word-aux">不可变更</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码框</label>
                    <div class="layui-input-inline">
                        <input type="text" name="password" value="<%=value[2]%>" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">建议密码为6位数以上</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input type="phone" value="<%=value[3]%>" name="phone" required lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新用户所在学院</label>
                    <div class="layui-input-inline">
                        <select name="faculty" lay-verify="required">
                            <option value=""></option>
                            <option value="计算机学院"<%
//                                System.out.println("计算机学院".equals(value[4]));
                                if("计算机学院".equals(value[4])){%>
                                    selected=""
                            <%}%>>计算机学院</option>
                            <option value="软件学院"<%
//                                System.out.println("软件学院".equals(value[4]));
                                if("软件学院".equals(value[4])){%>
                                    selected=""
                                    <%}%>>软件学院</option>
                            <option value="艺术学院"<%if("艺术学院".equals(value[4])){%>
                                    selected=""
                                    <%}%>>艺术学院</option>
                            <option value="测光学院"<%if("测光学院".equals(value[4])){%>
                                    selected=""
                                    <%}%>>测光学院</option>
                            <option value="经管学院"<%if("经管学院".equals(value[4])){%>
                                    selected=""
                                    <%}%>>经管学院</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">是否是管理员权限</label>
                    <div class="layui-input-block">
                        <input type="checkbox"
                            <%
                        String a="0";
                        if (value[5].equals(a)){
                        %>
                               name="close"
                            <%
                        } else {%>
                               checked="" lay-filter="switchTest" name="open"
                            <% }
                        %>  lay-skin="switch" lay-text="ON|OFF" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别:</label>
                    <div class="">
                        <input type="radio" name="sex" value="男" title="男"
                            <% String sex1="男";
                            if(sex1.equals(value[6])){%>
                               checked=""
                            <% }%>
                               >
                        <input type="radio" name="sex" value="女" title="女"
                            <% String sex2="女";
                            if(sex2.equals(value[6])){%>
                               checked=""
                            <% }%>
                               >
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
                    url: "/user/Edit",
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