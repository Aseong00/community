<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login/' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="registerLink" value="${sessionScope.id==null ? '/register/add' : '/register/info'}"/>
<c:set var="loginCheck" value="${sessionScope.id==null ? '회원가입' : '내 정보' }"/>
<!DOCTYPE html>

<html>
<style>
    body {
        position: relative;
        min-height: 100vh;
    }
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
    .board_table {
        border: none;
        border-spacing: 0;
        border-collapse: collapse;
    }
    .board_list_wrap {
        margin: auto;
        margin-top: 30px;
        width: 80%;
        display: flex;
        flex-direction: column;
    }
    .board_navi {
        margin: auto;
        margin-top: 30px;
        width: 80%;
        display: flex;
        justify-content: center;
        flex-direction: row;
    }
    .board_navi a {
        padding: 0 3px;
    }
    .search_wrap {
        margin: auto;
        margin-top: 30px;
        width: 80%;
        display: flex;
        align-items: center;
    }
    #writeBtn {
        margin-left: auto;
    }
    .board_title {
        text-align: center;
        font-size: 30px;
        margin-top: 30px;
    }
    .search_form {

    }
    .search_option {
        height: 25px;
    }
    .search_input {
        text-indent: 5px;
        height: 25px;
    }
    .search_button {
        width: 65px;
        height: 25px;
        border: 1px solid #6667AB;
        color: #eeeeee;
        background-color: #6667AB;
    }
    .search_button:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    button {
        border-radius: 5px;
        width: 75px;
        height: 30px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    button:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    th {
        background-color: #6667AB;
        color: #eeeeee;
        text-align: left ;
        text-indent: 5px;
    }
    th:first-child {
        text-align: center;
        width: 10%;
    }
    th:nth-child(2) {
        width: 50%;
    }
    th:nth-child(3) {
        width: 10%;
    }
    th:nth-child(4) {
        width: 20%;
    }
    th:last-child {
        text-align: center;
        width: 10%;
    }
    td {
        text-indent: 5px;
    }
    td:nth-child(1) {
        text-align: center;
    }
    td:nth-child(2):hover {
        cursor: pointer;
    }
    td:last-child {
        text-align: center;
    }
    tr {
        height: 40px;
        border-bottom: 1px solid #dddddd;
    }
    tr:hover {
        background-color: #cccccc;
    }
    .comment_span {
        color: blue;
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
    <header class="community_top">
        <ul class="community_menu">
            <li id="logo"><a href="<c:url value="/"/>">Community</a></li>
            <li><a href="<c:url value="/"/>">커뮤니티 홈</a></li>
            <li><a href="<c:url value="/board/list"/>">게시판</a></li>
            <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
            <li><a href="<c:url value='${registerLink}'/>">${loginCheck}</a></li>
        </ul>
    </header>
    <h2 class="board_title">게시판</h2>
    <div class="search_wrap">
        <form action="<c:url value="/board/list"/>" class="search_form" method="get">
            <select class="search_option" name="option">
                <option value="A" ${ph.searchCondition.option=='A' || ph.searchCondition.option=='' ? "selected" : ""}>제목+내용</option>
                <option value="T" ${ph.searchCondition.option=='T' ? "selected" : ""}>제목</option>
                <option value="W" ${ph.searchCondition.option=='W' ? "selected" : ""}>작성자</option>
            </select>

            <input type="text" name="keyword" class="search_input" type="text" value="${ph.searchCondition.keyword}" placeholder="검색어를 입력해주세요">
            <input type="submit" class="search_button" value="검색">
        </form>
        <button type="button" id="writeBtn" onclick="location.href='<c:url value="/board/write${ph.searchCondition.queryString}"/>'">글쓰기</button>
    </div>
    <script>
        let msg = "${msg}"
        if (msg == "DEL_OK") {
            alert("게시물이 삭제되었습니다.");
        }
        if (msg == "DEL_ERR") {
            alert("게시물 삭제에 실패하였습니다.");
        }
        if (msg == "WRT_OK") {
            alert("게시물이 등록되었습니다.");
        }
        if (msg == "MOD_OK") {
            alert("게시물이 수정되었습니다.");
        }
    </script>
    <div class="board_list_wrap">
        <table class="board_table">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>이름</th>
                <th>등록일</th>
                <th>조회수</th>
            </tr>
            <c:forEach var="boardDto" items="${list}" varStatus="status" >
                <tr>
                    <td data-bno="${boardDto.bno}">${boardDto.bno}</td>
                    <td>${boardDto.title} <c:if test="${boardDto.comment_cnt != 0}"><span class="comment_span">[${boardDto.comment_cnt}]</span></c:if></td>
                    <td>${boardDto.writer}</td>
                    <td>${reg_list[status.index]}</td>
                    <td>${boardDto.view_cnt}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script>
        $('td:nth-child(2)').on("click", function () {
            let bno = $(this).parent().children('td').attr('data-bno');
            location.href="<c:url value="/board/read${ph.searchCondition.queryString}"/>&bno=" +bno;
        });
    </script>
    <div class="board_navi">
        <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 게시물이 없습니다. </div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${ph.showPrev}">
                <a class="page" href="<c:url value="/board/list${ph.searchCondition.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="page ${i==ph.searchCondition.page ? "paging-active" : ""}" href="<c:url value="/board/list${ph.searchCondition.getQueryString(i)}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="page" href="<c:url value="/board/list${ph.searchCondition.getQueryString(ph.endPage+1)}"/>">&gt;</a>
            </c:if>
        </c:if>
    </div>
<footer>
    <div class="footer_wrap">
        <h3>Contact</h3>
        <h4>asw5223@naver.com</h4>
        <h4>010 - 9016 - 9663</h4>
    </div>
</footer>
</body>
</html>
