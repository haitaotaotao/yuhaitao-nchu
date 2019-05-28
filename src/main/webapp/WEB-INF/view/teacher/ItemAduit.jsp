<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>
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
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="itemName" id="itemName" autocomplete="off">
                </div>

                <div class="layui-inline">
                    教师名：
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="userName" id="userName" autocomplete="off">
                </div>

                <button class="layui-btn" data-type="reload">搜索</button>
            </div>

            <table  class="layui-hide" id="test"></table>
        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/item/ItemAduit'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
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
                    ,{fixed: 'right', title:'操作', width:150,
                        templet:'<div><a class="layui-btn layui-btn-xs" href="/item/audit?id={{d.id}}">审核</a>&nbsp;<a class="layui-btn layui-btn-danger layui-btn-xs" href="/item/back?id={{d.id}}">撤销</a></div>'
                }
                ]]
                ,page: true
            });




            var $ = layui.$, active = {
                reload: function(){
                    var username = $('#userName');
                    var itemName=$('#itemName');
                    //执行重载
                    table.reload('test', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            key: {
                                userName: username.val(),
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