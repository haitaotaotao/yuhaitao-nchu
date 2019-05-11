
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>


    <title>登陆</title>

    <%@ include file="../layout/header.jsp"%>

</head>

<body>

<div class="container">
<div class="row">
    <div class="col-lg-4 col-lg-offset-4">
        <form class="form-signin" method="post" action="/user/doLogin">
            <h6 class="form-signin-heading">请登录教师管理系统</h6>
            <label for="no" class="sr-only">账号</label>
            <input  id="no" name="uNo" class="form-control" placeholder="请输入账号" required autofocus>
            &nbsp;
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password"  name="password" id="inputPassword" class="form-control" placeholder="Password">
            &nbsp;
            <button class="btn btn-sm btn-primary btn-block" type="submit">登陆</button>
            <%

                String msg=(String)request.getAttribute("msg");
                if (msg==null){
                    msg="欢迎登录";
                }
                if (msg.equals("-1")){
                    msg="已注销";
                }
            %>

           提示: <%=msg%>
        </form>
    </div>
</div> <!-- /container -->

</div>

</body>
</html>

