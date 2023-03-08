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
        border-bottom: 3px solid white;
    }
    #logo {
        color:white;
        font-size: 18px;
        padding-left:40px;
        margin-right:auto;
        display: flex;
        cursor: pointer;
    }
    #modBtn {
        display: none;
    }
    #cancelBtn {
        display: none;
    }
    .boardForm_wrap {
        margin: auto;
        width: 80%;
    }
    .board_title {
        margin-top: 40px;
        text-indent: 5px;
        font-size: 30px;
    }
    #boardForm {
        margin-top: 10px;
        border-top: 1px solid #333333;
    }
    .writer_wrap {
        margin-top: 10px;
        font-weight: 700;
        font-size: 17px;
        height: 25px;
    }
    .writer_wrap input {
        outline: none;
        border: none;
        font-size: 17px;
        height: 25px;
    }
    .content_title_wrap {
        margin-top: 10px;
        height: 35px;
    }
    .content_title {
        height: 100%;
        width: 100%;
        border: 1px solid #cccccc;
        text-indent: 5px;
        font-size: 13px;
    }
    .content_title:focus {
        outline: none;
        border-color: #6667AB;
    }
    .content_wrap {
        margin-top: 10px;
        width: 100%;
        min-height: 300px;
    }
    #content {
        width: 100%;
        min-height: 300px;
        border: 1px solid #cccccc;
        text-indent: 5px;
        font-size: 13px;
        padding: 5px 0px ;
        resize: none;
    }
    #content:focus {
        outline: none;
        border-color: #6667AB;
    }
    .btn {
        border-radius: 5px;
        width: 65px;
        height: 30px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    .btn:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    .comment_wrap {
        width: 80%;
        margin: auto;
        margin-top: 20px;
        padding-bottom: 50px;
    }
    .comment_write_wrap {
        margin-top: 10px;
        border-top: 1px solid #333333;
        height: 45px;
        padding-top: 10px;
        display: flex;
    }
    .comment_write_wrap input {
        border:1px solid #cccccc;
        text-indent: 5px;
        margin-right: auto;
        height: 35px;
        width: 90%;
    }
    .comment_write_wrap input:focus {
        outline: none;
        border-color: #6667AB;
    }
    .comment_write_wrap button {
        margin-left: 5px;
        border-radius: 5px;
        width: 65px;
        height: 35px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    .comment_write_wrap button:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    #commentList {
        margin-top: 10px;
        border-top: 1px solid #333333;
    }
    #commentList ul {
        text-indent: 5px;
        margin-top: 10px;
    }
    #commentList ul li {
        margin-top: -1px;
        min-height: 60px;
        border: 1px solid #cccccc;
    }
    .comment_content_wrap {
        padding: 5px 0px;
        width: 100%;
    }
    .comment_date {
        margin-top: 10px;
    }
    .replyBtn {
        margin-top: 5px;
        margin-left: 5px;
        font-size: 13px;
        border-radius: 2px;
        width: 38px;
        height: 24px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    .replyBtn:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    .modBtn {
        font-size: 13px;
        border-radius: 2px;
        width: 38px;
        height: 24px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    .modBtn:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    .delBtn {
        font-size: 13px;
        border-radius: 2px;
        width: 38px;
        height: 24px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    .delBtn:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    #replyForm {
        margin-top: 5px;
        margin-left: 5px;
    }
    #replyComment {
        text-indent: 5px;
        width: 90%;
        height: 25px;
        boreder: 1px solid #cccccc;
    }
    #replyComment:focus {
        outline: none;
        border:1px solid #6667AB;
    }
    #wrtRepBtn {
        margin-left: 5px;
        font-size: 13px;
        border-radius: 2px;
        width: 38px;
        height: 25px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    #wrtRepBtn:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    #cancelRepBtn {
        margin-left: 5px;
        font-size: 13px;
        border-radius: 2px;
        width: 38px;
        height: 25px;
        border: none;
        color: #eeeeee;
        background-color: #6667AB;
    }
    #cancelRepBtn:hover {
        background-color: #5657ac;
        cursor: pointer;
    }
    .reply_li {
        display: flex;
    }
    .reply_left_wrap {
        color: #888888;
        font-weight: 900;
    }
    .comment_date {
        color: #666666;
        font-weight: 400;
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
<script>
    let msg = "${msg}"
    if (msg == "WRT_ERR") {
        alert("게시물 등록에 실패하였습니다.");
    }
</script>
<div class="boardForm_wrap">
    <h2 class="board_title">게시물 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
    <form action="" id="boardForm">
        <input type="hidden" value="${boardDto.bno}" name="bno">
        <div class="writer_wrap" ${mode == "new" ? "style='display: none'" : ""}>
            작성자 : <input value="${boardDto.writer}" readonly >
        </div>
        <div class="content_title_wrap">
            <input class="content_title" type="text" placeholder="제목을 입력해주세요." value="<c:out value="${boardDto.title}"/>" name="title" ${mode == "new" ? "" : "readonly"} />
        </div>
        <div class="content_wrap">
            <textarea name="content" id="content" cols="30" rows="10" ${mode == "new" ? "" : "readonly"} >${boardDto.content}</textarea> <br>
        </div>
        <button type="button" id="writeBtn" class="btn" ${mode == "new" ? "" : "style='display: none'"} >등록</button>
        <button type="button" id="modifyBtn" class="btn" ${mode == "new" ? "style='display: none'" : ""} ${boardDto.writer == sessionScope.get("id") ? "" : "style='display: none'"}>수정</button>
        <button type="button" id="deleteBtn" class="btn" ${mode == "new" ? "style='display: none'" : ""} ${boardDto.writer == sessionScope.get("id") ? "" : "style='display: none'"}>삭제</button>
        <button type="button" id="listBtn" class="btn">목록</button>
    </form>

</div>
<script>
    $(document).ready(function(){
       $('#listBtn').on("click", function() {
           location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
       });
       $('#deleteBtn').on("click", function () {
          if(!confirm("정말로 삭제하시겟습니까?")) return false;
          let form = $('#boardForm');
          form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
          form.attr("method", "post");
          form.submit();
       });
        $('#writeBtn').on("click", function () {
            let form = $('#boardForm');
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            form.submit();
        });
        $('#modifyBtn').on("click", function () {
            let form = $('#boardForm');
            let isReadonly = $("input[name=title]").attr('readonly');
            if (isReadonly == "readonly") {
                $("input[name=title]").attr('readonly',false);
                $("input[name=title]").focus();
                $("textarea").attr("readonly", false);
                $("#modifyBtn").html("등록");
                $(".board_title").html("게시물 수정");

                return;
            }
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>
<script>
    let bno = ${boardDto.bno};

    let showList = function(bno) {
        $.ajax({
            type : 'GET',
            url : '/community/comments?bno='+ bno,
            success: function (result) {
                $("#commentList").html(toHtml(result));
            },
            error: function () {
                alert("댓글 목록을 불러오는데 실패했습니다.");
            }
        });
    }
    $(document).ready(function(){
        showList(bno)

        $("#modBtn").click(function(){
            let cno = $(this).attr("data-cno");
            let comment = $("input[name=comment]").val();

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus()
                return;
            }
            $.ajax({
                type : 'PATCH',
                url : '/community/comments/'+cno,
                headers : { "content-type": "application/json"},
                data: JSON.stringify({cno: cno, comment: comment}),
                success: function (result) {
                    alert("댓글이 수정되었습니다.")
                    showList(bno)
                    $("#replyForm").css("display", "none");
                    $("#sendBtn").css("display", "block");
                    $("#modBtn").css("display", "none");
                    $("#cancelBtn").css("display", "none");
                    $("input[name=comment]").val('');
                    $("#replyForm").appendTo("body");
                },
                error: function () {
                    alert("error");
                }
            });
        })
        $("#cancelBtn").click(function(){
            $("#replyForm").css("display", "none");
            $("#sendBtn").css("display", "block");
            $("#modBtn").css("display", "none");
            $("#cancelBtn").css("display", "none");
            $("input[name=comment]").val('');
            $("#replyForm").appendTo("body");
        })
        $("#commentList").on("click", ".replyBtn", function() {
            $("input[name=replyComment]").val('');
            $("#replyForm").appendTo($(this).parent());
            $("#replyForm").css("display", "flex");
            $("#replyComment").focus();
        });
        $("#sendBtn").click(function(){
            let comment = $("input[name=comment]").val();

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus()
                return;
            }
            $.ajax({
                type : 'POST',
                url : '/community/comments?bno=' + bno,
                headers : { "content-type": "application/json"},
                data: JSON.stringify({bno: bno, comment: comment}),
                success: function (result) {
                    alert("댓글이 등록되었습니다.")

                    showList(bno)
                    $("#replyForm").css("display", "none");
                    $("input[name=comment]").val("");
                    $("#replyForm").appendTo("body");
                },
                error: function () {
                    alert("error");
                }
            });
        })
        $("#wrtRepBtn").click(function(){
            let comment = $("input[name=replyComment]").val();
            let pcno = $("#replyForm").parent().parent().attr("data-pcno");

            if (comment.trim() == '') {
                alert("답글을 입력해주세요");
                $("input[name=replyComment]").focus()
                return;
            }
            $.ajax({
                type : 'POST',
                url : '/community/comments?bno=' + bno,
                headers : { "content-type": "application/json"},
                data: JSON.stringify({pcno:pcno, bno: bno, comment: comment}),
                success: function (result) {
                    alert("답글이 등록되었습니다.")
                    showList(bno)
                    $("#replyForm").css("display","none");
                    $("input[name=replyComment]").val('');
                    $("#replyForm").appendTo("body");
                },
                error: function () {
                    alert("error");
                }
            });
        })
        $("#cancelRepBtn").click(function(){
            $("#replyForm").css("display","none");
            $("input[name=replyComment]").val('');
            $("#replyForm").appendTo("body");
        })
        $("#commentList").on("click", ".modBtn", function() {
            let cno = $(this).parent().parent().attr("data-cno");
            let comment = $("span.comment", $(this).parent()).text();
            $("#sendBtn").css("display", "none");
            $("#modBtn").css("display", "block");
            $("#cancelBtn").css("display", "block");
            $("input[name=comment]").val(comment);
            $("input[name=comment]").focus();
            $("#modBtn").attr("data-cno", cno);

        })
        $("#commentList").on("click", ".delBtn", function(){
            let cno = $(this).parent().parent().attr("data-cno");
            let bno = $(this).parent().parent().attr("data-bno");
            if ($(this).parents("li").attr("data-pcno") == $(this).parents("li").next("li").attr("data-pcno")) {
                alert("답글이 달린 댓글은 삭제할 수 없습니다.")
                return;
            }
            $.ajax({
                type : 'DELETE',
                url : '/community/comments/'+cno+'?bno='+bno,
                success: function (result) {
                    alert("삭제되었습니다.")
                    showList(bno);
                    $("#replyForm").css("display", "none");
                    $("#replyForm").appendTo("body");
                },
                error: function () {
                    alert("삭제에 실패하였습니다.");
                }
            });
        });
    });

    let toHtml = function (comments) {
        let tmp = "<ul>";
        let id = "${sessionScope.get('id')}" ;
        comments.forEach(function (comment) {
            tmp += '<li class="reply_li" '
            if (comment.cno!=comment.pcno) {
                tmp += ' style="margin-left: 30px; background-color: #eeeeee;"'
            }
            tmp += ' data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            if (comment.cno!=comment.pcno) {
                tmp += '<div class="reply_left_wrap">ㄴ</div>'
            }
            tmp += '<div class="comment_content_wrap">'
            tmp += '<div class="commenter_wrap">'
            tmp += '작성자 : <span class="commenter">' + comment.commenter + '</span></div>'
            tmp += '<div><span class="comment">' + comment.comment + '</span></div>'
            tmp += '<div class="comment_date">' + comment.up_date + '</div>'
            tmp += ' <button class="replyBtn">답글</button>'
            if(comment.commenter == id ) {
                tmp += ' <button class="modBtn">수정</button>'
                tmp += ' <button class="delBtn">삭제</button>'
            }
            tmp += '</div></li>'
        })
        return tmp + "</ul>";
    };
</script>
<div class="comment_wrap" ${mode == "new" ? "style='display: none'" : ""}>
    <h2>댓글</h2>
    <div class="comment_write_wrap">
        <input type="text" name="comment" placeholder="댓글을 입력하세요.">
        <button id="sendBtn" type="button">등록</button>
        <button id="modBtn" type="button">수정</button>
        <button id="cancelBtn" type="button">취소</button>
    </div>

    <div id="commentList"></div>
</div>
<div id="replyForm" style="display: none">
    <input id="replyComment" type="text" name="replyComment" placeholder="답글을 입력하세요.">
    <button id="wrtRepBtn" type="button">등록</button>
    <button id="cancelRepBtn" type="button">취소</button>
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
