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
        <form action="/boardUpdate" method="post">
            <input type="hidden" name="board_id" value="${board.board_id}">
        작성자  <input type="text" name="writer"  class="form-control" value="${board.writer}" readonly>
        제목  <input type="text" name="title"  class="form-control" value="${board.title}" readonly id="title2">
        내용   <textarea name="content" cols="30" rows="10" class="form-control" readonly id="content2">${board.content}</textarea>
            <c:if test="${sessionScope.member.id == board.member_id}">
                <div id="input2">
                    <input type="button" onclick="boardUpdate()" value="수정">
                    <input type="button" value="삭제하기" onclick="boardDelete()">
                    <c:if test="${board.boardSaveFile != null}">
                        <img src="${pageContext.request.contextPath}/upload/${board.boardSaveFile}"
                             alt="" width="50" height="50">
                    </c:if>
                    </c:if>
                </div>
        </form>

    </div>
</div>

</body>
<script>

  const boardUpdate = () => {
          console.log("호출성공")
       $("#title2").removeAttr("readonly");       // readonly 삭제
      $("#content2").removeAttr("readonly");       // readonly 삭제
      const a = document.getElementById("input2")
      a.innerHTML = "";
      // const sub = document.getElementById("sub3");
      a.innerHTML = "<input type='submit' value='수정완료' class='btn btn-success' style='border-left: 105px;margin-left: 105px;'>"
  }



</script>
</html>
