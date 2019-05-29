<%@ page import="techermanager.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <%
            long c=0;
            User yht = (User) session.getAttribute("User");
            %>
            <li class="layui-nav-item layui-nav-itemed"
            <%if(yht.getStatus().equals(c)){%>
                style="display: none"
            <%}%>
            >
                <a class="" href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/addUser">新增用户</a></dd>
                    <dd><a href="/UserQuery">用户列表</a></dd>
                    <dd><a href="/shuju">数据分析</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">教师管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/PersonDetail">教师资料</a></dd>
                    <dd><a href="/CourseInfo">教师课程</a></dd>
                    <dd><a href="/ItemInfo">教师科研</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a  href="javascript:;">科研项目</a>
                <dl class="layui-nav-child">
                    <dd><a href="/ItemApply">项目申请</a></dd>
                    <dd><a href="/ItemAduit" <%if(yht.getStatus().equals(c)){%>style="display: none"<%}%>>项目审核</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"
                <%if(yht.getStatus().equals(c)){%>
    s           style="display: none"
                <%}%>>
                <a href="javascript:;">课程管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/addCourse">新增课程</a></dd>
                    <dd><a href="/mangerCourse">分配课程</a></dd>
                    <dd><a href="/CourseTeacherQuery">课程信息列表</a></dd>
                    <dd><a href="/CourseQuery">课程列表</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>

