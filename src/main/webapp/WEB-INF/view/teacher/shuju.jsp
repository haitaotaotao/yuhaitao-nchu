<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../layout/t_header.jsp" %>

<title>数据分析图</title>
<script type="text/javascript" src="/js/echarts.min.js"></script>
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../layout/t_nav.jsp" %>
    <%@include file="../layout/t_left_nav.jsp" %>

    <div class="layui-body">
        <div style="padding: 15px;">
            <!-- 柱状图容器 -->
            <div id="main" style="width:600px; height:400px;"></div>
            <script type="text/javascript">
                $(function() {
                    // 初始化
                    //var myChart = echarts.init(document.getElementById('main'));
                    var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

                    // 配置图标参数
                    var options = {
                        title: {
                            text: '教师数据',
                            show: true, // 是否显示标题
                            subtext: '项目个数',
                            textStyle: {
                                fontSize: 18 // 标题文字大小
                            }
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'shadow'
                            }
                        },
                        legend: {
                            data: ['数量']
                        },
                        // X轴
                        xAxis: {
                            data: [] // 异步请求时,这里要置空
                        },
                        // Y轴
                        yAxis: {},
                        series: [{
                            name: '数量',
                            type: 'bar', // 设置图表类型为柱状图
                            data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
                        }]
                    };
                    // 给图标设置配置的参数
                    myChart.setOption(options);
                    myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
                    $.ajax({
                        url: '/item/shuju',
                        type: 'post',
                        dataType: 'json',
                        success: function(data) {
                            var names = [];
                            var nums = [];
                            $.each(data, function(index, obj) {
                                names.push(obj.xx);
                                nums.push(obj.yy);
                            })

                            myChart.hideLoading(); // 隐藏加载动画
                            myChart.setOption({
                                legend: {
                                    data: ['数量']
                                },
                                xAxis: {
                                    data: names
                                },
                                series: [{
                                    name: '数量',
                                    type: 'bar', // 设置图表类型为柱状图
                                    data: nums // 设置纵坐标的刻度
                                }]
                            });
                        }
                    });
                });
            </script>


            <table  class="layui-hide" id="test"></table>
        </div>

    </div>
    <%@include file="../layout/t_foot.jsp" %>

</div>
</body>
</html>