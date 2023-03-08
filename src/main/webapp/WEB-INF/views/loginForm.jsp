<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page import="java.net.URLDecoder" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login/' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="registerLink" value="${sessionScope.id==null ? '/register/add' : '/register/info'}"/>
<c:set var="loginCheck" value="${sessionScope.id==null ? '회원가입' : '내 정보' }"/>
<html>
<head>
    <title>login</title>
    <style>
        * {
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

        a { text-decoration: none; }
        form {
            margin: 0 auto;
            margin-top: 9%;
            width: 400px;
            height: 430px;
            border: 1px solid #cccccc;
            box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login_title{
            margin-top: 35px;
            font-size: 30px;
        }
        button {
            border-radius: 5px;
            border: none;
            color: #eeeeee;
            background-color: #6667AB;
        }
        button:hover {
            background-color: #5657ac;
            cursor: pointer;
        }
        input {
            text-indent: 5px;
            border: 1px solid #cccccc;
        }
        input:focus {
            outline: none;
            border:2px solid #6667AB;
        }
        .id {
            width: 80%;
            height: 40px;
            margin-top: 25px;
        }
        .pwd {
            width: 80%;
            height: 40px;
            margin-top: 10px
        }
        .login_btn {
            width: 80%;
            margin-top: 35px;
            height: 45px;
        }
        .rememberId_Wrap {
            margin-top: 18px;
        }
        .msg {
            margin-top: 45px;
            height: 30px;
        }
        i {
            color: red;
            font-style: normal;
            font-weight: 600;
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
        .login_title {
            font-size: 27px;
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
    <form:form>
        <h2 class="login_title">로그인</h2>
        <div class="msg">
            <c:if test="${not empty param.msg}">
                <i> ${URLDecoder.decode(param.msg)}</i>
            </c:if>
        </div>
        <input type="text" class="id" name="id" placeholder="아이디 입력" value="${cookie.id.value}" autofocus>
        <input type="password" class="pwd" name="pwd" placeholder="비밀번호 입력">
        <input type="hidden" name="toUrl" value="${param.toURI}">
        <button class="login_btn">로그인</button>
        <div class="rememberId_Wrap">
            <label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label>
            <div class="find_user_wrap">
                <a href="<c:url value='/register/findId'/>">아이디 찾기</a> |
                <a href="<c:url value='/register/findPwd'/>">비밀번호 찾기</a> |
                <a href="<c:url value='/register/add'/>">회원가입</a>
            </div>
        </div>
    </form:form>
<footer>
    <div class="footer_wrap">
        <h3>Contact</h3>
        <h4>asw5223@naver.com</h4>
        <h4>010 - 9016 - 9663</h4>
    </div>
</footer>
</body>
</html>
