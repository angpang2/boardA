<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<<jsp:include page="../views/layout/header.jsp" flush="false"></jsp:include>

<div class="right2">

</div>

    <div class="main">
        <!-- 게시판 최신글 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">게시판</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>조회수 BEST 3</th>
                    </tr>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center">
                    <c:forEach items="${boardList}" var="board">
                        <tr>
                            <td>${board.board_id}</td>
                            <td><a href="/boardDetail?board_id=${board.board_id}">${board.title}[${board.commentCount}]</a></td>
                            <td>${board.writer}</td>
                            <td>${board.regdate}</td>
                            <td>${board.hit}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <table class="table table-hover">
                    <thead>
                    <th>좋아요 BEST 3</th>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center">
                    <c:forEach items="${boardList2}" var="board2">
                        <tr>
                            <td>${board2.board_id}</td>
                            <td><a href="/boardDetail?board_id=${board2.board_id}">${board2.title}[${board2.commentCount}]</a></td>
                            <td>${board2.writer}</td>
                            <td>${board2.regdate}</td>
                            <td>${board2.hit}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


                <table class="table table-hover">
                    <thead>
                    <th>댓글 BEST 3</th>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center">
                    <c:forEach items="${boardList3}" var="board3">
                        <tr>
                            <td>${board3.board_id}</td>
                            <td><a href="/boardDetail?board_id=${board3.board_id}">${board3.title}[${board3.commentCount}]</a></td>
                            <td>${board3.writer}</td>
                            <td>${board3.regdate}</td>
                            <td>${board3.hit}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>




            </div>
        </div>
    </div>

</div>

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
                    location.href = "../../..";
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
