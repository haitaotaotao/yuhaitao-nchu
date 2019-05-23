<%@ page import="techermanager.pojo.Item" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
<link rel="stylesheet" href="/css/layui.css" media="all">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>
    <div class="layui-body">
        <div style="padding: 15px;">
            <form class="layui-form" action="/item/doUpload" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">选择项目</label>
                    <div class="layui-input-block">
                        <select name="item" lay-filter="aihao">
                            <option value=""></option>
                            <%
                                List<Item> itemList = (List<Item>) request.getAttribute("Item");
                                for (Item item : itemList) {
                            %>
                            <option value="<%=item.getId()%>"><%=item.getItemName()%>
                            </option>

                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>


                <div class="layui-upload-drag" id="test10">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                </div>
                <br>
                <br>
                <p id="tip"></p>
                <input type="hidden" name="file" value="" id="uploadfile">
                <br>
                <div>
                    <button class="layui-btn" type="submit">提交结题材料</button>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <script src="/js/layui.js" charset="utf-8"></script>
    <script>
        layui.use('upload', function () {
            var $ = layui.jquery
                , upload = layui.upload;

            //拖拽上传
            upload.render({
                accept: 'file',
                elem: '#test10'
                , url: '/item/upload/'
                , done: function (res) {
                    $("#tip").text(res.msg);   //设置tip的值
                    $("#uploadfile").attr("value", res.data);//设置隐藏表单的值
                    console.log( res.data);
                    layer.msg(res.msg);
                }
            });

        });
    </script>
</div>
</body>
</html>