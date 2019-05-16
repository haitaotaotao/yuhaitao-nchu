<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <label class="layui-form-label">申请人工号</label>
                    <div class="layui-input-block">
                        <input type="text" name="userId" required  lay-verify="required" placeholder="请输入工号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">科研项目名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="itemName" required lay-verify="required" placeholder="请输入项目名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">科研项目详情</label>
                    <div class="layui-input-block">
                        <textarea name="remark" required  lay-verify="required" placeholder="请输入项目详情" autocomplete="off" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">科研项目期限</label>
                    <div class="layui-input-block">
                        <input type="text" name="deadLine" required  lay-verify="required" placeholder="请输入结题时间" autocomplete="off" class="layui-input">
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

                $.ajax({
                    url: "item/ItemApply",
                    type: "POST",
                    contentType:"application/json",
                    data:JSON.stringify(data.field),  //data表示要发送的数据
                    dataType: "json",//预期服务器返回的数据类型
                    processData: false,  // 不处理数据
                    success: function (data) {
                        layer.msg(JSON.stringify(data.field));

                        if (data==1) {
                            layer.msg("科研项目提交成功");
                        }

                        if (data==-1){
                            layer.msg("科研项目已提交");
                        }

                    }});

                return false;
            });
        });
    </script>
</div>
</body>
</html>