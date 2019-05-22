<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
<link rel="stylesheet" href="/css/layui.css"  media="all">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>
    <div class="layui-body">
        <div style="padding: 15px;">
            <!-- 内容主体区域 -->
            <div class="demoTable">
                <div class="layui-inline">
                    科研项目名：
<%--                    查询功能无法实现--%>
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="itemName" id="itemName" autocomplete="off">
                </div>

                <button class="layui-btn" data-type="reload">搜索</button><br>
<%--                假的交互客服--%>
                <a href="tencent://message/?uin=2083552705&Site=400301.com&Menu=yes">客服咨询</a><br>
                <form  id ="form2" action="load/upload2" enctype="multipart/form-data" method="post">
                    <input type = "file" name= 'file' />
<%--                    <input type="text" name="name" value="dzf"/>--%>
                    <input type="button" id = "button2" value="ajax上传" onclick="fileupload2()">
<%--                    <input type ="submit" value="直接上传">--%>
                </form>
                <form action="load/down1" name="form3" id = "form3" method="post">
                    <input type = "submit" value="普通文件下载">
                </form>
                <button type="button" class="layui-btn" id="test3"><i class="layui-icon" name="file1"></i>上传文件</button>
                <input type="hidden"  id="ssFile" name="ssFile"> <!--用于文件名回显-->
            </div>
            <table  class="layui-hide" id="test"></table>
        </div>
        <script type="text/html" id="barDemo">
            <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
            <a class="layui-btn layui-btn-xs layui-icon" id="test3" lay-event="edit" type="=file">选择文件</a>
<%--            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">撤销</a>--%>
        </script>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <script src="/js/layui.js" charset="utf-8"></script>
    <script>
        function fileupload2(){
            var formData = new FormData($("#form2")[0]);
            $.ajax({
                url:'load/upload2',
                type:'post',
                data:formData,
                //必须false才会自动加上正确的Content-Type
                contentType: false,
                //必须false才会避开jQuery对 formdata 的默认处理
                //XMLHttpRequest会对 formdata 进行正确的处理
                processData: false,
                success:function(data){
                    alert(data);
                },
                error:function(data){
                    alert(data);
                    alert("后台发生异常");
                },
                cache:false,
                async:true
            });
        }
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/item/ItemInfo'
                ,cellMinWidth: 75 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', title: 'ID', sort: true}
                    ,{field:'itemName', title: '科研项目名'}
                    ,{field:'userId', title: '教师工号'}
                    ,{field:'userName', title: '教师名'}
                    ,{field:'statusName', title: '状态'}
                    ,{field:'creatTime',  title: '创建时间'}
                    ,{field:'file', title: '文件地址'}
                    ,{field:'remark', title: '备注'}
                    ,{field:'deadLine', title: '期限'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            layui.use('upload', function(){
                var $ = layui.jquery
                    ,upload = layui.upload;

                upload.render({
                    elem: '#test3'
                    ,url: '/upload/'
                    ,accept: 'file' //普通文件
                    ,done: function(res){
                        console.log(res)
                    }
                });
            });

            var $ = layui.$, active = {
                reload: function(){
                    var itemName=$('#itemName');
                    //执行重载
                    table.reload('test', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            key: {
                                itemName:itemName.val(),
                            }
                        }
                    });
                }
            };

            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });

    </script>
</div>
</body>
</html>