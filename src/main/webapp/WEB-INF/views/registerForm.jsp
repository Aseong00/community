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
    <title>회원 가입</title>
    <style>
        * {
            list-style: none;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
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
        form {
            margin: 0 auto;
            margin-top: 8%;
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
        button {
            display: block;
            border-radius: 5px;
            margin: auto;
            margin-top: 37px;
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
            margin-top: 17px;
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
        .birth {
            width: 125px;
            padding-right: 5px;
        }
        .num_wrap {
            display: flex;
            margin-top: 20px;
            align-items: center;
        }
        select {
            margin-left: 5px;
            width: 60px;
            height: 33px;
            text-indent: 5px;
            border: 1px solid #cccccc;
        }
        select:focus {
            outline: none;
            border:2px solid #6667AB;
        }

        .num2 {
            margin: 0;
            margin-left: 5px;
            width: 185px;
        }
        option {
            font-size: 15px;
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
<script>
    let msg = "${msg}"
    if (msg == "REG_ERR") {
        alert("이미 존재하는 회원정보입니다.");
    }
    const idCheck = /^[a-z][0-9a-zA-Z]{3,11}$/;
    const pwdCheck = /^[0-9a-zA-Z]{4,12}$/;
    const nameCheck =  /^[가-힣]{3,5}$/;
    const birthCheck = /^\d{4}-\d{2}-\d{2}$/;
    const emailCheck = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-z]+$/;
    const numCheck = /^\d{8}$/;
    function formCheck(frm) {

        let msg ='';

        if(frm.id.value.length==0) {
            setMessage('아이디를 입력하세요.', frm.id);
            return false;
        } else if (!idCheck.test(frm.id.value)) {
            setMessage('아이디 형식이 잘못되었습니다.', frm.id);
            return false;
        }

        if(frm.pwd.value.length==0) {
            setMessage('비밀번호를 입력하세요.', frm.pwd);
            return false;
        } else if (!pwdCheck.test(frm.pwd.value)) {
            setMessage('비밀번호 형식이 잘못되었습니다.', frm.pwd);
            return false;
        }

        if(frm.name.value.length==0) {
            setMessage('이름을 입력하세요.', frm.name);
            return false;
        } else if (!nameCheck.test(frm.name.value)) {
            setMessage('이름 형식이 잘못되었습니다.', frm.name);
            return false
        }

        if(frm.birth.value.length==0) {
            setMessage('생년월일을 입력하세요.', frm.birth);
            return false;
        } else if (!birthCheck.test(frm.birth.value)) {
            setMessage('생년월일 형식이 잘못되었습니다.', frm.birth);
            return false
        }

        if(frm.email.value.length==0) {
            setMessage('이메일을 입력하세요.', frm.email);
            return false;
        } else if (!emailCheck.test(frm.email.value)) {
            setMessage('이메일 형식이 잘못되었습니다.', frm.email);
            return false
        }

        if(frm.num2.value.length==0) {
            setMessage('전화번호를 입력하세요.', frm.num2);
            return false;
        } else if (!numCheck.test(frm.num2.value)) {
            setMessage('전화번호 형식이 잘못되었습니다.', frm.num2);
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
    <form action="<c:url value="/register/add"/>" method="post" onsubmit="return formCheck(this)">
        <div class="title">회원 가입</div>
        <div class="error_message_wrap" id="msg">
        </div>
        <label>아이디</label>
        <input type="text" name="id" id="id" placeholder="4~12자리 사이 문자 및 숫자 조합"><br>
        <label>비밀번호</label>
        <input type="password" name="pwd" placeholder="4~12자리 사이 문자 및 숫자 조합"><br>
        <label>이름</label>
        <input type="text" name="name" placeholder="ex)홍길동"><br>
        <label>생년월일</label>
        <input type="date" min="1900-01-01" max="2099-12-31" value="2023-01-01" name="birth" class="birth"><br>
        <label>이메일</label>
        <input type="text" name="email" placeholder="ex)asd1234@naver.com"><br>
        <div class="num_wrap">
            <label>전화번호</label>
            <select type="checkbox" name="num1" >
                <option value="010" selected>010</option>
                <option value="011">011</option>
            </select>
            <input type="text" name="num2" class="num2" placeholder="-없이 입력해 주세요" maxlength="8">
        </div>
        <button>회원 가입</button>
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
