<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login/' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="registerLink" value="${sessionScope.id==null ? '/register/add' : '/register/info'}"/>
<c:set var="loginCheck" value="${sessionScope.id==null ? '회원가입' : '내 정보' }"/>
<!DOCTYPE html>
<html>
<head>
    <title>아아디 찾기</title>
    <style>
        * {
            border-radius: 5px;
            list-style: none;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            position: relative;
            min-height: 100vh;
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
        form {
            margin: 0 auto;
            margin-top: 13%;
            width: 400px;
            height: 280px;
            border: 1px solid #cccccc;
            box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
        }
        .title {
            text-align: center;
            margin-top: 35px;
            font-size: 24px;

        }
        button {
            display: block;
            margin: auto;
            margin-top: 25px;
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
        label {
            margin-left: 36px;
            display: inline-block;
            width: 75px;
        }
        input {
            width: 250px;
            margin-top: 12px;
            height: 33px;
            text-indent: 5px;
            border: 1px solid #cccccc;
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
        .link_wrap {
            margin-top: 30px;
            text-align: center;
        }

        a {
            text-decoration: none;
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
</head>
<body>
<header class="community_top">
    <ul class="community_menu">
        <li id="logo"><a href="<c:url value="/"/>">Community</a></li>
        <li><a href="<c:url value="/"/>">커뮤니티 홈</a></li>
        <li><a href="<c:url value="/board/list"/>">게시판</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='${registerLink}'/>">${loginCheck}</a></li>
    </ul>
</header>
<script>
    let msg = "${msg}"
    if (msg == "FIND_ERR") {
        alert("회원 정보가 존재하지 않습니다.");
    }
    const idCheck = /^[a-z][0-9a-zA-Z]{3,11}$/;
    const emailCheck = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-z]+$/;
    const numCheck = /^\d{3}-\d{4}-\d{4}$/;
    function formCheck(frm) {

        let msg ='';

        if(frm.email.value.length==0) {
            setMessage('이메일을 입력하세요.', frm.email);
            return false;
        } else if (!emailCheck.test(frm.email.value)) {
            setMessage('이메일 형식이 잘못되었습니다.', frm.email);
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
    <form action="<c:url value="/register/findId"/>" method="post" onsubmit="return formCheck(this)">
        <div class="title">아이디 찾기</div>
        <div class="error_message_wrap" id="msg">
            <c:if test="${not empty param.msg}">
                <i> ${URLDecoder.decode(param.msg)}</i>
            </c:if>
        </div>
        <label>이메일</label>
        <input type="text" name="email" placeholder="이메일을 입력하세요." value="<c:out value=''/>">
        <button>아이디 찾기</button>
        <div class="link_wrap">
            <a href="<c:url value='/register/findPwd'/>">비밀번호 찾기</a> |
            <a href="<c:url value='/register/add'/>">회원가입</a>
        </div>
    </form>
<footer>
    <div class="footer_wrap">
        <h3>Contact</h3>
        <h4>asw5223@naver.com</h4>
        <h4>010 - 9016 - 9663</h4>
    </div>
</footer>
</body>
</html>
