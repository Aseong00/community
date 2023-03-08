<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login/' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="registerLink" value="${sessionScope.id==null ? '/register/add' : '/register/info'}"/>
<c:set var="loginCheck" value="${sessionScope.id==null ? '회원가입' : '내 정보' }"/>
<!DOCTYPE html>

<html>
<style>
    * { list-style: none;
        margin: 0;
        padding: 0;
        box-sizing: border-box;}
    a { text-decoration: none; }
    body {
        position: relative;
        min-height: 100vh;
    }
    #logo a:hover {
        border: none;
        color: #eeeeee;
    }
    .community_top {
        height: 40px;
        background-color: #6667AB;
    }
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
    .communityHome_wrap {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        text-align: center;
        font-size: 60px;
        font-weight: 600;
        letter-spacing: 5px;
    }
    b {
        margin-top: 30vh;
    }
    footer {
        position: absolute;
        top: 100%;
        width: 100%;
        height: 95px;
        background-color: #5657ac;
    }
    .footer_wrap {
        margin: auto;
        width: 80%;
        text-align: left;
    }
    h3 {
        margin-top: 10px;
        padding-left:40px;
        color: white;
    }
    h4 {
        padding-left:40px;
        color: white;
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
    let findId = "${findId}"
    if (msg == "REG_OK") {
        alert("회원 가입이 완료되었습니다.");
    }
    if (msg == "DEL_USER") {
        alert("회원 탈퇴가 완료되었습니다.")
    }
    if (msg == "USER_MOD_OK") {
        alert("회원 정보 수정이 완료되었숩니다.");
    }
    if (msg == "FIND_ID_OK") {
        alert("회원님 계정의 ID는 " + findId +"입니다.");
    }
    if (msg == "FIND_PWD_OK") {
        alert("회원님의 이메일로 임시 비밀번호가 발급되었습니다.")
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
    <b>Community Home<br>Community Home<br>Community Home</b>
</section>
<footer>
    <div class="footer_wrap">
        <h3>Contact</h3>
        <h4>asw5223@naver.com</h4>
        <h4>010 - 9016 - 9663</h4>
    </div>
</footer>
</body>
</html>
