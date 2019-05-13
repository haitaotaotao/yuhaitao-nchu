<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- 内容主体区域 -->
        <table>
            <tbody>

            <tr>
                <th>id</th>
                <th>姓名</th>
                <th>账号</th>
                <th>院系</th>
                <th>性别</th>
                <th>手机号</th>
            </tr>
            <c:forEach items="${userlist}" var="data" >
            <tr><td>${data.id}</td>
                <td>${data.userName}</td>
                <td>${data.account}</td>
                <td>${data.faculty}</td>
                <td>${data.sex}</td>
                <td>${data.phone}</td>
            </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
<%@include file="../layout/t_foot.jsp" %>
    <script>
        //Demo
        layui.use('form', function(){
                $.ajax({
                    url: "/user/center",
                    type: "POST",
                    contentType:"application/json",
                    data:JSON.stringify(data.field),  //data表示要发送的数据
                    dataType: "json",//预期服务器返回的数据类型
                    processData: false,  // 不处理数据
                    success: function (data) {
                        layer.msg(JSON.stringify(data.field));

                        if (data==1) {
                            layer.msg("个人资料成功");
                        }

                        if (data==-1){
                            layer.msg("个人资料");
                        }

                    }});

                return false;

        });
    </script>
</div>
</body>
</html>