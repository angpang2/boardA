<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 10:02
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

<div class="main">
  <div class="container" id="save-form" >
    <form action="/board/save" method="post" name="saveForm"  class="form-control" enctype="multipart/form-data">
      <input type="hidden" value="${sessionScope.member.id}" name="member_id">
      작성자  <input type="text" name="writer"  class="form-control" value="${sessionScope.member.member_id}" readonly >
      제목  <input type="text" name="title"  class="form-control" >
      내용   <textarea name="content" cols="30" rows="10" class="form-control"></textarea>
      <input type="file" class="form-control" name="boardFile">
      <input type="submit" value="작성하기">
    </form>
  </div>

</div>

</body>


<script>

</script>


</html>
