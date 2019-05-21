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
                    课程名：
                </div>
                <div class="layui-inline">
                    <input class="layui-input" name="courseName" id="courseName" autocomplete="off">
                </div>

                <button class="layui-btn" data-type="reload">搜索</button>
            </div>

            <table  class="layui-hide" id="test"></table>
        </div>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs btts" lay-event="del">删除</a>
        </script>
    </div>
    <%@include file="../layout/t_foot.jsp" %>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/course/CourseQuery'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', title: 'ID', sort: true}
                    ,{field:'courseCode', title: '课程号'}
                    ,{field:'courseName', title: '课程名'}
                    ,{field:'courseCreatTime',  title: '创建时间'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            // //删除事件
            // $(".btts").click(function () {
            //     var tds = $(this).parent().parent().find('a');
            //     var talent_id = tds.eq(0).text();
            //     console.log(tds.eq(0).text());
            //     $.ajax({
            //         url: 'course',
            //         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            //         data: {action: "CourseDelete", id: talent_id},
            //         type: "post",
            //         async: true,
            //         success: function () {//请求成功之后的操作
            //             layer.msg("再次跳转回界面");
            //             $('#rightContent').load("CourseQuery.jsp");
            //         }
            //     });
            //     return
            // });


            var $ = layui.$, active = {
                reload: function(){
                    var coursename=$('#courseName');
                    //执行重载
                    table.reload('test', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            key: {
                                courseName:coursename.val(),
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