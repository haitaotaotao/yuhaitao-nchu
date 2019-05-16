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
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">课程号</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseId" required  lay-verify="required" placeholder="请输入课程号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程名</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseName" required  lay-verify="required" placeholder="请输入课程名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">教师工号</label>
                    <div class="layui-input-block">
                        <input type="text" name="uesrId" required  lay-verify="required" placeholder="请输入课程名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">教师名</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" required  lay-verify="required" placeholder="请输入教师名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上课时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseTime" required  lay-verify="required" placeholder="请输入上课时间" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地点</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required  lay-verify="required" placeholder="请输入上课地点" autocomplete="off" class="layui-input">
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
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function(data){
                // layer.msg("准备进入控制层");
                $.ajax({
                    url: "/course/mangerCourse",
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