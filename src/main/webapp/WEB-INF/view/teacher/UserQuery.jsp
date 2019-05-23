<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    学院：
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="faculty" id="faculty" autocomplete="off">
                </div>

                <div class="layui-inline">
                    用户名：
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="username" id="username" autocomplete="off">
                </div>

                <button class="layui-btn" data-type="reload">搜索</button>
            </div>

            <table class="layui-hide" id="test"></table>
        </div>
    </div>
    <%@include file="../layout/t_foot.jsp" %>


    <script>
        layui.use('table', function () {
            var table = layui.table;

            table.render({
                elem: '#test'
                , url: '/user/queryUsers'
                , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , cols: [[
                    {field: 'id', title: 'ID', sort: true}
                    , {field: 'userName', title: '用户名'}
                    , {field: 'faculty', title: '学院'}
                    , {field: 'sex', title: '性别'}
                    , {field: 'account', title: '账号'}
                    , {field: 'password', title: '密码'}
                    , {field: 'creatTime', title: '注册时间'}
                    , {field: 'modifyTime', title: '修改时间'}
                    , {field: 'phone', title: '联系电话'}
                    , {fixed: 'right', title: '操作', width: 150,
                        templet:'<div><a class="layui-btn layui-btn-danger layui-btn-xs" href="/user/Delete?id={{d.id}}">删除</a></div>'
                    }
                ]]
                , page: true
            });


            var $ = layui.$, active = {
                reload: function () {
                    var faculty = $('#faculty');
                    var username = $('#username');
                    //执行重载
                    table.reload('test', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: {
                            key: {
                                faculty: faculty.val(),
                                userName: username.val(),
                            }
                        }
                    });
                }
            };

            $('.demoTable .layui-btn').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });




        });


    </script>
</div>
</body>
</html>