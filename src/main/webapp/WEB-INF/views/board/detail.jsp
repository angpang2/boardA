<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--좋아요 버튼 css--%>
    <link rel="stylesheet" href="/resources/css/like.css">

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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


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
                    </c:if>
                    <input type="checkbox" id="checkbox"/>
                    <label for="checkbox">
                        <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg" stroke-linecap="round" stroke-linejoin="round" onclick="boardLike()">
                            <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                                <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart"/>
                                <circle class="circle" cx="29.5" cy="29.5" r="1.5" stroke="#CD85E7" stroke-width="0 "/>

                                <g id="grp7" opacity="0" transform="translate(7 6)">
                                    <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2" />
                                    <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2" />
                                </g>

                                <g id="grp6" opacity="0" transform="translate(0 28)">
                                    <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2" />
                                    <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2" />
                                </g>

                                <g id="grp3" opacity="0" transform="translate(52 28)">
                                    <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2" />
                                    <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2" />
                                </g>

                                <g id="grp2" opacity="0" transform="translate(44 6)">
                                    <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2" />
                                    <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2" />
                                </g>

                                <g id="grp5" opacity="0" transform="translate(14 50)">
                                    <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2" />
                                    <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2" />
                                </g>

                                <g id="grp4" opacity="0" transform="translate(35 50)">
                                    <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2" />
                                    <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2" />
                                </g>

                                <g id="grp1" opacity="0" transform="translate(24)">
                                    <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
                                    <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
                                </g>
                            </g>
                        </svg>
                        <div class="numbers">
                            <a class="num1">${board.boardLike}</a>
                            <a class="num2" id="num2"></a>
                        </div>
                    </label>
                    <c:if test="${board.boardSaveFile != null}">
                        <img src="${pageContext.request.contextPath}/upload/${board.boardSaveFile}"
                             alt="" width="50" height="50">
                    </c:if>
                </div>
        </form>
        <%--댓글달기--%>
        <div class="container" id="comment-form" style="width: 800px; margin-top: 10px;">
            <input type="hidden" name="board_id" value="${board.board_id}">
            <input type="hidden" name="member_id" value="${sessionScope.id}">
            <input type="text" name="writer" value="${sessionScope.member.member_id}" id="commentWriter" readonly>
            <input type="text" name="content" class="form-control" id="commentContents">
            <input type="button" onclick="commentWrite()" value="댓글달기" class="btn btn-primary">
        </div>
        <%--댓글보기--%>
        <div class="container" id="comment-list" style="text-align: center; width: 800px; margin-top: 10px;">
            <table class="table">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.writer}</td>
                        <td>${comment.content}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.regdate}"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>

</div>

</body>
<script>
    const boardLike = () => {
        if(${sessionScope.member.member_id==null}){
            console.log("호출")
            alert("로그인후 이용가능합니다.")
        }else {
            console.log("엘스호출")
             likeDu();
        }
    }


    const likeDu = () => {
        const boardId = '${board.board_id}';
        const memberId = '${sessionScope.member.id}';
        $.ajax({
            async:false,
            type: "get",
            url:"/likeDu",
            data: {
                board_id : boardId,
                member_id : memberId
            },
            dataType: "text",
            success:function (result){
                alert("좋아요")
                if(result=="yes") {
                    boardLike2();
                }else {
                    alert("이미좋아요한 게시글 입니다.")
                }

            },
            error:function (){
                alert("실패")
            }
        })
    }

    const boardLike2 = () => {
        const boardId = '${board.board_id}';
        const memberId = '${sessionScope.member.id}';
        $.ajax({
            async:false,
            type: "get",
            url:"/boardLike",
            data: {
                board_id : boardId,
                member_id : memberId
            },
            dataType: "json",
            success:function (boardDTO){
                let num2 = document.getElementById("num2")
                num2.innerHTML = boardDTO.boardLike;
                alert("성공")


            },
            error:function (){
                alert("실패")
            }
        })

    }












  const boardUpdate = () => {
          console.log("호출성공")
       $("#title2").removeAttr("readonly");       // readonly 삭제
      $("#content2").removeAttr("readonly");       // readonly 삭제
      const a = document.getElementById("input2")
      a.innerHTML = "";
      // const sub = document.getElementById("sub3");
      a.innerHTML = "<input type='submit' value='수정완료' class='btn btn-success' style='border-left: 105px;margin-left: 105px;'>"
  }

  const commentWrite = () => {
      console.log("comment호출성공")
      const content2 = document.getElementById("commentContents").value;
      const board_id2 = '${board.board_id}';
      if(${sessionScope.member.member_id != null}){
          const writer2 = '${sessionScope.member.member_id}'
          $.ajax({
              type: "post",
              url: "/comment/save",
              data: {
                  writer: writer2,
                  content: content2,
                  board_id: board_id2
              },
              dataType: "json",
              success: function (commentList) {
                  console.log(commentList);
                  let output = "<table class='table' style='text-align: center'>";
                  output += "<th>작성자</th>";
                  output += "<th>내용</th>";
                  output += "<th>작성시간</th></tr>";
                  for(let i in commentList){
                      output += "<tr>";
                      output += "<td>"+commentList[i].writer+"</td>";
                      output += "<td>"+commentList[i].content+"</td>";
                      output += "<td>"+moment(commentList[i].regdate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                      output += "</tr>";
                  }
                  output += "</table>";
                  document.getElementById('comment-list').innerHTML = output;
                  document.getElementById('commentContents').value='';
              },
              error: function () {
                  console.log("실패");
              }
          })
      }else {
          alert("로그인후 이용 가능합니다.")
          location.href="/login"
      }
  }



</script>
</html>
