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

<<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="right2">
    <!-- 회원정보 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">회원정보</h3>
        </div>
        <div class="panel-body">
            <form action="/update" method="post" name="up">
                <input type="hidden" name="id" value="${sessionScope.member.id}" class="form-control" readonly>
                아이디: <input type="text" name="memberEmail" value="${sessionScope.member.member_id}"
                            class="form-control" readonly>
                이름:<input type="text" name="memberName" value="${sessionScope.member.memberName}"
                          class="form-control" disabled>
                비밀번호:<input type="password" name="pw" class="form-control"
                            placeholder="정보변경을 원하면 비밀번호를 입력">
                성별:<input type="text" name="memberGender" value="${sessionScope.member.gender}" class="form-control"
                          readonly>
                <input type="button" value="정보변경하기" class="btn btn-primary" onclick="update()" style="border-left: 90px;margin-left: 90px;">
                <div id="sub">
                </div>
            </form>

        </div>
    </div>
</div>

<div class="main">
    <!-- 회원정보 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">회원정보</h3>
        </div>
        <div class="panel-body">
            <form action="/update" method="post" name="up">
                <input type="hidden" name="id" value="${sessionScope.member.id}" class="form-control" readonly>
                아이디: <input type="text" name="memberEmail" value="${sessionScope.member.member_id}"
                            class="form-control" readonly>
                이름:<input type="text" name="memberName" value="${sessionScope.member.memberName}"
                          class="form-control" disabled>
                비밀번호:<input type="password" name="pw" class="form-control"
                            placeholder="정보변경을 원하면 비밀번호를 입력">
                성별:<input type="text" name="memberGender" value="${sessionScope.member.gender}" class="form-control"
                          readonly>
                <input type="button" value="정보변경하기" class="btn btn-primary" onclick="update()" style="border-left: 90px;margin-left: 90px;">
                <div id="sub2">
                </div>
            </form>

        </div>
    </div>
</div>



</body>
<script>
    const update = () => {
        const passwordDB = '${sessionScope.member.pw}';
        if(document.up.pw.value==passwordDB) {
            alert("비밀번호가 일치합니다")
            $('input').removeAttr('disabled');
            const sub = document.getElementById("sub2");
            sub.innerHTML = "<input type='button' value='수정완료' class='btn btn-success' onclick='check()' style='border-left: 105px;margin-left: 105px;'>"

        }else {
            alert("비밀번호가 일치하지 않습니다.")
        }
    }

    const check = () => {
        if (confirm("정말로 변경하시겠습니까?")) {
            alert("변경완료 후 자동으로 로그아웃 되니 다시 로그인 해주시길 바랍니다.")
            document.up.submit();
            if(alert("수정완료")){
                location.href = "/logout";
            }


        } else {

        }

    }




</script>

</html>
