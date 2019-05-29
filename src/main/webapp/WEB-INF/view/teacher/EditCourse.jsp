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
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <%
                String utf = URLDecoder.decode(request.getQueryString(),"utf-8");
//            System.out.println(utf+"**********");
                String[] param = utf.split("&");
                String[] value = new String[param.length];
                for(int i = 0; i < param.length; i++) {
                    value[i] = param[i].split("=")[1];
                }
            %>
            <form class="layui-form">
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">id</label>
                    <div class="layui-input-inline">
                        <input type="text" name="id" value="<%=value[2]%>" required  lay-verify="required" autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程名</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseName" value="<%=value[0]%>" required  lay-verify="required" placeholder="请输入课程名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程号</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseCode" value="<%=value[1]%>" required  lay-verify="required" placeholder="请输入课程号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <%--    <script src="/js/layui.js" charset="utf-8"></script>--%>
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function(data){
                $.ajax({
                    url: "/course/EditCourse",
                    type: "POST",
                    contentType:"application/json",
                    data:JSON.stringify(data.field),  //data表示要发送的数据
                    dataType: "json",//预期服务器返回的数据类型
                    processData: false,  // 不处理数据
                    success: function (data) {
                        layer.msg(JSON.stringify(data.field));

                        if (data==1) {
                            layer.msg("修改课程成功");
                        }

                        if (data==-1){
                            layer.msg("课程已存在");
                        }

                    }});

                return false;
            });
        });
    </script>
</div>
</body>
</html>