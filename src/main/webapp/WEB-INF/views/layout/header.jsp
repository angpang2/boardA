<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 부트스트랩 css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부트스트랩 js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>

<div class="wrap">

    <!-- 부트스트랩 헤더 -->


    <div class="container-fluid navbar navbar-default">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">WebSiteName</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/">Home</a></li>
            <li><a href="#">Page 1</a></li>
            <li><a href="#">Page 2</a></li>
            <li><a href="#">Page 3</a></li>
        </ul>


    </div>


    <div class="sidebar">
        <!-- 사이드바 -->
        <div class="list-group">
            <a href="#" class="list-group-item active">선택창</a>
            <a href="/index" class="list-group-item">메뉴1</a>
            <a href="#" class="list-group-item">메뉴2</a>
            <a href="#" class="list-group-item">메뉴3</a>

        </div>
    </div>

    <div class="right1">
        <!-- 로그인창 -->
        <c:choose>
        <c:when test="${sessionScope.member.member_id == null}">
        <div class="panel panel-default">
            <div class="panel-heading" style="text-align: center">로그인</div>
            <div class="panel-body">
                <form action="login.php" method="post">
                    <div class="form-group has-success">
                        <input type="text" class="form-control" id="inputSuccess1" name="id" placeholder="아이디">
                        <input type="password" class="form-control" id="inputSuccess2" name="pw" placeholder="비밀번호">

                    </div>
                </form>
                <!-- 로그인 회원가입 비밀번호 찾기 버튼 -->
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" onclick="memberLogin()">로그인</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" onclick="memberJoin()">회원가입</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">pw 찾기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:when>
    <c:otherwise>
    <div class="panel panel-default">
        <div class="panel-heading" style="text-align: center">로그인</div>
        <div class="panel-body">
            <form action="login.php" method="post">
                <div class="form-group has-success">
                    <div class="Ellipse">
                        <c:if test="${sessionScope.member.profile != null}">
                            <img src="${pageContext.request.contextPath}/upload/${sessionScope.member.profile}"
                                 alt="" width="50" height="50">
                        </c:if>
                    </div>
                    <h4>${sessionScope.member.member_id}님 환영합니다</h4>
                </div>
            </form>
            <!-- 로그인 회원가입 비밀번호 찾기 버튼 -->
            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default" onclick="logout()">로그아웃</button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default" onclick="mypage()">마이페이지</button>
                </div>
            </div>
        </div>
    </div>
</div>

</c:otherwise>
</c:choose>

</body>
<script>
    const memberJoin = () => {
        location.href = "/memberJoin"
    }

    const memberLogin = () => {
        const member_id = document.getElementById("inputSuccess1").value;
        const pw = document.getElementById("inputSuccess2").value;
        $.ajax({
            type:"post",
            url:"/memberLogin",
            data: {
                member_id: member_id,
                pw: pw,
            },
            dataType:"text",
            success : function (result){
                if(result == "ok"){
                    alert("로그인성공")
                    location.href = "/";
                }else{
                    alert("아이디 또는 비밀번호를 다시 확인해주세요")
                }
            },
            error : function (){
                alert("아이디 또는 비밀번호를 다시 확인해주세요")
            }


        })

    }

    const logout = () => {
        if(confirm("로그아웃 하시겠습니까?")){
            alert("로그아웃 되었습니다")
            location.href = "/logout"
        }
    }

    const mypage = () => {
        location.href = "/mypage"
    }


</script>
</html>
