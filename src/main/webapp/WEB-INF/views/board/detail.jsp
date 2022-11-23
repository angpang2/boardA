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
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<div class="right2">

</div>

<div class="main">
    <div class="container" id="save-form">
        작성자  <input type="text" name="writer"  class="form-control" value="${board.writer}" readonly >
        제목  <input type="text" name="title"  class="form-control" value="${board.title}" readonly>
        내용   <textarea name="content" cols="30" rows="10" class="form-control" readonly>${board.content}</textarea>
        <c:if test="${board.boardSaveFile != null}">
            <img src="${pageContext.request.contextPath}/upload/${board.boardSaveFile}"
                 alt="" width="50" height="50">
        </c:if>
        <c:if test="${sessionScope.member.id == board.member_id}">
            <input type="button" value="수정하기" onclick="modify()">
            <input type="button" value="삭제하기" onclick="boardDelete()">
        </c:if>
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

    const modify = () => {
        location.href = "/updateForm?board_id="+${board.board_id}
    }

    const boardDelete = () => {
        location.href = "/board/delete?board_id="+${board.board_id}
    }


</script>
</html>
