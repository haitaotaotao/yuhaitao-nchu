<%@ page import="techermanager.dao.VO.FightOrderVO" %>
<%@ page import="java.util.List" %>
<%@ page import="techermanager.dao.VO.detatilVO" %>
<%@ page import="techermanager.pojo.Message" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>个人中心</title>

    <!-- Bootstrap core CSS -->
    <%@include file="layout/header.jsp" %>

</head>

<body>
<%@include file="layout/admin_nav.jsp" %>

<div class="container">
    <div class="row">
        <%@include file="layout/left_nav.jsp" %>
        <div class="col-md-10 main">
            <h2 class="sub-header">顾客的留言列表</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <tbody>
                    <%
                        SimpleDateFormat format = new SimpleDateFormat("YYYYMMDD:hh:mm:ss");
                        List<Message> messages = (List<Message>) request.getAttribute("messageList");
                        if (messages != null && messages.size() != 0) {
                            for (Message message : messages) {


                    %>
                    <tr>

                        <p>标题:<%=message.getmTitle()%> &nbsp;发布时间：<%=format.format(message.getqTime())%><a
                                href="/AdmindelMessage?mId=<%=message.getmId()%>">删除</a></p>

                        提问内容：<p><%=message.getmQuestion()%>
                    </p>

                        <%
                            if (message.getaTime() != null) {


                        %>

                        回复内容：<p><%=message.getmAnswer()%>
                    </p>
                        <p>回复人：<%=message.getaUserName()%>&nbsp;回复时间：<%=message.getaTime()%>
                        </p>

                        <%
                            }else {

                        %>

                        <p><a href="/toUpdateMessage?mId=<%=message.getmId()%>">点此回复</a></p>



                        <%}%>
                        <hr/>
                        <br/>
                        <br/>
                    </tr>


                    <% }
                    }%>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>


<%@include file="layout/footer.jsp" %>
</body>
</html>
