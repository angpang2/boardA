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
<<jsp:include page="../views/layout/header.jsp" flush="false"></jsp:include>

<div class="right2">

</div>

<div class="main">

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
