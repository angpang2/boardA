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
  <div class="search">
    <!-- 부드스트랩 검색창 -->
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <select class="form-control">
          <option value="제목">제목</option>
          <option value="작성자">작성자</option>
        </select>
        <input type="text" class="form-control" placeholder="Search">
        <input type="button" value="검색" class="form-control">
      </div>
    </form>
  </div>

  <!-- 정렬기준 선택창 -->
  <div class="sort">
    <select class="form-control">
      <option value="최신순">최신순</option>
      <option value="조회순">조회순</option>
    </select>
  </div>




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


  <div class="right2"></div>

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
      </div>
    </div>
  </div>


  <div class="pageButton">
    <!-- 하단 페이지 버튼 -->
    <nav aria-label="Page navigation ">
      <ul class="pagination">
        <div class="container">
          <ul class="pagination justify-content-center">
            <c:choose>
              <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
              <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                  <a class="page-link">[이전]</a>
                </li>
              </c:when>
              <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
              <c:otherwise>
                <li class="page-item">
                  <a class="page-link" href="/index?page=${paging.page-1}">[이전]</a>
                </li>
              </c:otherwise>
            </c:choose>

            <%--  for(int i=startPage; i<=endPage; i++)      --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
              <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                  <li class="page-item active">
                    <a class="page-link">${i}</a>
                  </li>
                </c:when>

                <c:otherwise>
                  <li class="page-item">
                    <a class="page-link" href="/index?page=${i}">${i}</a>
                  </li>
                </c:otherwise>
              </c:choose>
            </c:forEach>

            <c:choose>
              <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                  <a class="page-link">[다음]</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="page-item">
                  <a class="page-link" href="/index?page=${paging.page+1}">[다음]</a>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
      </ul>
    </nav>
  </div>

    <!-- 글쓰기 버튼 -->
    <div class="writeButton btn-group btn-group-justified" role="group" aria-label="..." style="
    top: 331px;
    width: 250px;
    left: 1218px;

">
      <div class="btn-group" role="group">
        <button type="button" class="btn btn-default" onclick="boardWrite()">글쓰기</button>
      </div>
    </div>



  </div>

</div>

</body>
<script>
  const boardWrite = () => {
    if(${sessionScope.member.member_id != null}){
      location.href = "/boardWrite"
    }else {
      alert("로그인 후 이용바랍니다")
    }
  }


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
