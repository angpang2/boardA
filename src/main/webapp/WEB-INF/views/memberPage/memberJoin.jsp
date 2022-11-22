<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberJoin</title>
  <!-- 부트스트랩 css -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <!-- 부트스트랩 js -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
<header id="header">
  <h1 class="tit">회원가입</h1>
</header>
<form name="join" onsubmit="return validate();" action="https://www.naver.com/" method="post" enctype="multipart/form-data" >
  <fieldset>
    <div>
      <label for="uid">프로필 등록</label>
      <input type="file" class="form-control">
    </div>
    <div class="id-container">
      <label for="uid">아이디</label>
      <input type="text" class="width-450 form-control" name="userId" id="uid" required minlength="5" maxlength="20">
      <span id="idError"></span>
    </div>
    <div class="password-container">
      <label for="pwd">비밀번호</label>
      <input type="password" class="width-450 form-control" name="password01" id="pwd" required minlength="8" maxlength="16">
      <span id="pwdError"></span>
      <label for="repwd">비밀번호 확인</label>
      <input type="password" class="width-450 form-control" name="password02" id="repwd" required minlength="8" maxlength="16">
      <span id="rePwderror"></span>
    </div>
    <div class=name-container>
      <label for="uname">이름</label>
      <input type="text" class="width-450 form-control" name="name" id="uname" required minlength="2" maxlength="4">
      <span id="nameError"></span>
      </span>
    </div>

    <div class="gender-container">
      <label for="gender">성별</label>
      <select class="width-full form-control" name="gender" id="gender" required>
        <option value="gender">성별</option>
        <option value="male">남자</option>
        <option value="female">여자</option>
      </select>
    </div>
    <div class="btn-container">
      <input type="reset" value="다시입력" class="width-half height-30 form-control form-group group btn-group btn btn-warning">
      <button type="submit" id="joinBtn" class="width-half height-30 form-control form-group group btn-group btn btn-success" name="join" disabled="">회원가입</button>
    </div>
  </fieldset>
</form>
</main>
<script src="./common2.js"></script>
</body>
<script>
  let idToken = false
  let pwdToken = false
  let rePwdToken = false
  let nameToken = false
  let yearToken = false
  let dayToken = false
  let mailToken = false
  let target = document.getElementById('joinBtn');
  let tokenType = idToken && pwdToken && rePwdToken && nameToken && yearToken && dayToken && mailToken



  function validate() {

    let uid = document.getElementById("uid");
    let pwd = document.getElementById("pwd");
    let repwd = document.getElementById("repwd");
    let uname = document.getElementById("uname");
    let idCheck = /^[a-z0-9_-]{5,20}$/;
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    let nameCheck = /^[가-힣]{2,4}$/;

    console.log(typeof tokenType === true)

    uid.onkeyup = () => {
      if (!idCheck.test(document.getElementById('uid').value)) {
        document.getElementById('idError').innerText = "아이디는 영 소문자, 숫자 5~20자리로 입력해주세요."
        document.getElementById('idError').style.color = 'red'
        idToken = false;
      } else {
        let idE = document.getElementById('idError')
        idE.innerText = '사용가능'
        idE.style.color = 'green'
        idToken = true;
      }
    };
    pwd.onkeyup = () => {
      if (!pwdCheck.test(document.getElementById('pwd').value)) {
        document.getElementById('pwdError').innerText = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
        document.getElementById('pwdError').style.color = 'red'
        pwdToken = false;
      } else {
        let pwdE = document.getElementById('pwdError')
        pwdE.innerText = '사용가능'
        pwdE.style.color = 'green'
        pwdToken = true;
      }
    };
    repwd.onkeyup = () => {
      if (repwd.value !== pwd.value) {
        document.getElementById('rePwderror').innerText = "비밀번호가 일치하지 않습니다."
        document.getElementById('rePwderror').style.color = 'red'
        rePwdToken = false;
      } else {
        document.getElementById('rePwderror').innerText = "사용가능"
        document.getElementById('rePwderror').style.color = 'green'
        rePwdToken = true;
      }
    };
    uname.onkeyup = () => {
      if (!nameCheck.test(document.getElementById('uname').value)) {
        document.getElementById('nameError').innerText = "2~4글자의 한글만 입력하세요."
        document.getElementById('nameError').style.color = 'red'
        nameToken = false;
      } else {
        document.getElementById('nameError').innerText = "사용가능"
        document.getElementById('nameError').style.color = 'green'
        nameToken = true;
      }
    };

// console.log(typeof tokenType === true)
// console.log(typeof tokenType == true)

//     if (tokenType === true) {
//         target.disabled = false;
//     } else {
//         target.disabled = true;
//     }

//     switch (tokenType === true) {
//         case 'true':
//             target.disabled = false;
//             break;

//         case 'false':
//             target.disabled = true;
//             break;
//     }

  };
  validate();
</script>
</html>
