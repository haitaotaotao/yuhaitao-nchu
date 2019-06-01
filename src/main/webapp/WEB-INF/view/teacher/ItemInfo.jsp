<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
<link rel="stylesheet" href="/css/layui.css"  media="all">
<body class="layui-layout-body">
<%Item item=(Item) session.getAttribute("Item");%>
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
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2481295526&site=qq&menu=yes">
                    <img border="0" src="http://wpa.qq.com/pa?p=2:2083552705:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                </a>
            </div>
            <table  class="layui-hide" id="test"></table>
        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>
    <script src="/js/layui.js" charset="utf-8"></script>
    <script>

        layui.use('table', function(){
            var table = layui.table;
            var none = "none";
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
                    ,{field:'file', title: '文件地址',
                        templet: '<div><a href="/{{d.file}}" class="layui-table-link" style="display: {{d.status==0?"none":""}}">点击下载</a></div>'}
                    ,{field:'remark', title: '备注'}
                    ,{field:'deadLine', title: '期限'}
                    ,{fixed: 'right', title:'操作', width:150,
                        templet:
                            '<div><a class="layui-btn layui-btn-xs layui-icon" id="test3" href="ItemUpload" style="display: {{d.status==0?"none":""}}">申请结题</a>&nbsp;<a class="layui-btn layui-btn-xs layui-icon" id="test3"  href="/item/ItemDelet?id={{d.id}}">删除</a></div>'
                    }
                ]]
                ,page: true
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