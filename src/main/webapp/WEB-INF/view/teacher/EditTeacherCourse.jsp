<%@ page import="techermanager.pojo.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="techermanager.pojo.User" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/layui.css"  media="all">
<%@include file="../layout/t_header.jsp" %>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>
    <div class="layui-body">
        <%
            String utf = URLDecoder.decode(request.getQueryString(),"utf-8");
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
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">id</label>
                    <div class="layui-input-inline">
                        <input type="text" name="id" value="<%=value[4]%>" required  lay-verify="required" autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程</label>
                    <div class="layui-input-inline">
                        <select name="course" lay-filter="aihao">
                            <option value=""></option>
                            <%
                                List<Course> courses = (List<Course>) request.getAttribute("courses");
                                for (Course course : courses) {
                            %>
                            <option value="<%=course.getCourseCode()+"|"+course.getCourseName()%>"
                            <%if(course.getCourseName().equals(value[0])){%>
                                selected
                            <%}%>><%=course.getCourseName()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">教师</label>
                    <div class="layui-input-inline">
                        <select name="user" lay-filter="aihao">
                            <option value=""></option>
                            <%
                                List<User> users = (List<User>) request.getAttribute("users");
                                for (User user : users) {
                            %>
                            <option value="<%=user.getId()+"|"+user.getUserName()%>"<%if(user.getUserName().equals(value[1])){%>
                                selected
                            <%}%>><%=user.getUserName()%>
                            </option>
                            <%
                                }
                            %>
                        </select>


                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上课时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="courseTime" value="<%=value[3]%>" required  lay-verify="required" placeholder="请输入上课时间" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地点</label>
                    <div class="layui-input-inline">
                        <input type="text" name="address" required value="<%=value[2]%>" lay-verify="required" placeholder="请输入上课地点" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDem">立即提交</button>
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
            form.on('submit(formDem)', function(data){
                // layer.msg("准备进入控制层");
                $.ajax({
                    url: "/course/EditTC",
                    type: "POST",
                    contentType:"application/json",
                    data:JSON.stringify(data.field),  //data表示要发送的数据
                    dataType: "json",//预期服务器返回的数据类型
                    processData: false,  // 不处理数据
                    success: function (data) {
                        layer.msg(JSON.stringify(data.field));

                        if (data==1) {
                            layer.msg("分配课程成功");
                        }

                        if (data==-1){
                            layer.msg("分配课程已存在");
                        }

                    }});

                return false;
            });
        });
    </script>
</div>
</body>
</html>