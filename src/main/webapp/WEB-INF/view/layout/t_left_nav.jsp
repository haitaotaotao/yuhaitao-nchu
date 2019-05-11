<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">新增用户</a></dd>
                    <dd><a href="javascript:;">用户查询</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">教师管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">教师资料</a></dd>
                    <dd><a href="javascript:;">教师课程</a></dd>
                    <dd><a href="javascript:;">教师科研</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a  href="javascript:;">科研项目</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">项目申请</a></dd>
                    <dd><a href="javascript:;">项目审核</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">课程管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">新增课程</a></dd>
                    <dd><a href="javascript:;">分配课程</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
