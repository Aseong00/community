<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login/' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="registerLink" value="${sessionScope.id==null ? '/register/add' : '/register/info'}"/>
<c:set var="loginCheck" value="${sessionScope.id==null ? '회원가입' : sessionScope.id }"/>
<!DOCTYPE html>

<html>
<style>
    * { list-style: none;
        margin: 0;
        padding: 0;
        box-sizing: border-box;}
    a { text-decoration: none; }
    #logo a:hover {
        border: none;
        color: #eeeeee;
    }
    .community_top {
        height: 40px;
        background-color: #6667AB;}
    .community_menu {
        margin: auto;
        list-style-type: none;
        height: 100%;
        width: 80%;
        display: flex;}
    .community_menu li {
        height : 100%;
        display:flex;
        align-items: center;
        padding-right: 10px;
    }
    .community_menu li a {
        color: #eeeeee;
    }
    .community_menu li a:hover {
        color:white;
        border-bottom: 2px solid white;
    }
    #logo {
        color:white;
        font-size: 18px;
        padding-left:40px;
        margin-right:auto;
        display: flex;
        cursor: pointer;
    }
    * {
        border-radius: 5px;
        list-style: none;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    form {
        margin: 0 auto;
        margin-top: 5%;
        width: 400px;
        height: 500px;
        border: 1px solid #cccccc;
        box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
        border-radius: 8px;
    }
    .title {
        text-align: center;
        margin-top: 35px;
        font-size: 24px;

    }
    .btn_wrap {
        margin-top: 37px;
        display: flex;
    }
    button {
        font-size: 13px;
        display: block;
        margin: auto;
        margin-right: 7px;
        width: 100px;
        height: 35px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    button:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    .deleteIdBtn {
        font-size: 13px;
        text-align: center;
        line-height: 35px;
        cursor: pointer;
        display: block;
        margin: auto;
        margin-left: 7px;
        width: 100px;
        height: 35px;
        border: none;
        color: #eeeeee;
        background-color: #ea4f4f;
    }
    label {
        margin-left: 36px;
        display: inline-block;
        width: 75px;
    }
    input {
        width: 250px;
        margin-top: 17px;
        height: 33px;
        text-indent: 5px;
        border: 1px solid #cccccc;
    }
    .nMod {
        background-color: #eeeeee;
    }
    input:focus {
        outline: none;
        border:2px solid #6667AB;
    }
    .error_message_wrap {
        margin-top: 8px;
        text-align: center;
        height: 20px;
    }
    #msg {
        color: red;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>Commnunity Home</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<script>
    let msg = "${msg}"

    if (msg == "MOD_ERR") {
        alert("회원 정보 수정에 실패하였습니다.");
    }
    const pwdCheck = /^[0-9a-zA-Z]{4,12}$/;
    const numCheck = /^\d{3}-\d{4}-\d{4}$/;

    function formCheck(frm) {
        let msg ='';

        if(frm.pwd.value.length==0) {
            setMessage('비밀번호를 입력하세요.', frm.pwd);
            return false;
        } else if (!pwdCheck.test(frm.pwd.value)) {
            setMessage('비밀번호 형식이 잘못되었습니다.', frm.pwd);
            return false;
        }

        if(frm.num.value.length==0) {
            setMessage('전화번호를 입력하세요.', frm.num);
            return false;
        } else if (!numCheck.test(frm.num.value)) {
            setMessage('전화번호 형식이 잘못되었습니다.', frm.num);
            return false
        }

        return true;
    }
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `${'${msg}'}`;
        if(element) {
            element.select();
        }
    }
</script>
<header class="community_top">
    <ul class="community_menu">
        <li id="logo"><a href="<c:url value="/"/>">Community</a></li>
        <li><a href="<c:url value="/"/>">커뮤니티 홈</a></li>
        <li><a href="<c:url value="/board/list"/>">게시판</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='${registerLink}'/>">${loginCheck}</a></li>
    </ul>
</header>
<section class="communityHome_wrap">
    <form action="<c:url value='/register/info'/>" method="post" onsubmit="return formCheck(this)">
        <h2 class="title">회원 정보 수정</h2>
        <div class="error_message_wrap" id="msg"></div>
        <label>아이디</label>
        <input type="text" class="nMod" name="id" value="${userDto.id}" readonly><br>
        <label>비밀번호</label>
        <input type="password" name="pwd" value="<c:out value=''/>"><br>
        <label>이름</label>
        <input type="text" class="nMod" name="name" value="${userDto.name}" readonly><br>
        <label>생년월일</label>
        <input type="text" class="nMod" name="birth" value="${birth}" readonly><br>
        <label>이메일</label>
        <input type="text" class="nMod" name="email" value="${userDto.email}" readonly><br>
        <label>전화번호</label>
        <input type="text" name="num" value="${userDto.num}"><br>
        <div class="btn_wrap">
            <button>회원 정보 수정</button>
            <div class="deleteIdBtn" onclick="location.href='<c:url value="/register/deleteUser"/>'">회원 탈퇴</div>
        </div>
    </form>
</section>
</body>
</html>
