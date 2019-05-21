<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>

<%--<%@ page import="org.jfree.data.general.DefaultPieDataset" %>--%>
<%--<%@ page import="org.jfree.chart.ChartFactory" %>--%>
<%--<%@ page import="org.jfree.chart.JFreeChart" %>--%>
<%--<%@ page import="org.jfree.chart.servlet.*" %>--%>
<%--<%@ page import="org.jfree.chart.StandardChartTheme" %>--%>
<%--<%@ page import="java.awt.Font" %>--%>
<%--<%@page import="org.jfree.chart.servlet.ServletUtilities"%>--%>
<%--<%@ page import="org.jfree.chart.plot.PlotOrientation"%>--%>
<%--<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>--%>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--    <title>数据分析</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- 饼状图 -->--%>
<%--<%--%>
<%--    DefaultPieDataset dpd = new DefaultPieDataset();--%>
<%--    dpd.setValue("管理人员", 25);--%>
<%--    dpd.setValue("市场人员", 25);--%>
<%--    dpd.setValue("开发人员", 45);--%>
<%--    dpd.setValue("其他人员", 10);--%>

<%--//这一段是防止乱码使用的--%>
<%--    StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  //创建主题样式--%>
<%--    standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));  //设置标题字体--%>
<%--    standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,15));    //设置图例的字体--%>
<%--    standardChartTheme.setLargeFont(new Font("宋书",Font.PLAIN,15));      //设置轴向的字体--%>
<%--    ChartFactory.setChartTheme(standardChartTheme);                        //应用主题样式--%>

<%--    JFreeChart chart = ChartFactory.createPieChart("某公司组织结构图",dpd, true, false, false);--%>
<%--    String fileName = ServletUtilities.saveChartAsPNG(chart,800,600,session);--%>
<%--//ServletUtilities是面向web开发的工具类，返回一个字符串文件名,文件名自动生成，生成好的图片会自动放在服务器（tomcat）的临时文件下（temp）--%>

<%--    String url = request.getContextPath() + "/DisplayChart?filename=" + fileName;--%>
<%--//根据文件名去临时目录下寻找该图片，这里的/DisplayChart路径要与配置文件里用户自定义的--%>
<%--%>--%>
<%--<img src="<%= url %>" width="400" height="350">--%>

<%--<!-- 柱状图 -->--%>
<%--<%--%>
<%--    DefaultCategoryDataset dataset = new DefaultCategoryDataset();--%>
<%--    dataset.addValue(0.2, "老师1", "老师1");--%>
<%--    dataset.addValue(0.4, "老师2", "老师2");--%>
<%--    dataset.addValue(0.1, "老师3", "老师3");--%>
<%--    dataset.addValue(0.1, "老师4", "老师4");--%>
<%--// 创建主题样式--%>
<%--    StandardChartTheme standardChartTheme1 = new StandardChartTheme("CN");--%>
<%--// 设置标题字体--%>
<%--    standardChartTheme1.setExtraLargeFont(new Font("隶书", Font.BOLD, 20));--%>
<%--// 设置图例的字体--%>
<%--    standardChartTheme1.setRegularFont(new Font("宋书", Font.PLAIN, 15));--%>
<%--// 设置轴向的字体--%>
<%--    standardChartTheme1.setLargeFont(new Font("宋书", Font.PLAIN, 15));--%>
<%--// 应用主题样式--%>
<%--    ChartFactory.setChartTheme(standardChartTheme1);--%>

<%--    JFreeChart chart1 = ChartFactory.createBarChart3D("数据分析统计图",--%>
<%--            "教师",--%>
<%--            "项目百分比(%)",--%>
<%--            dataset,--%>
<%--            PlotOrientation.VERTICAL,--%>
<%--            false,--%>
<%--            false,--%>
<%--            false);--%>
<%--    String filename = ServletUtilities.saveChartAsPNG(chart1, 1200, 300, null, session);--%>
<%--    String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;--%>

<%--    System.out.println(graphURL + "\n"+ filename);--%>
<%--%>--%>
<%--<img src="<%= graphURL %>"width=1200 height=300 border=0 usemap="#<%= filename %>">--%>

<%--</body>--%>
<%--</html>--%>