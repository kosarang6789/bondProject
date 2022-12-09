<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/resources/css/myPage/myPage.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />
<body>
    <section class="myPage-layout">
        <aside class="myPage-sidebar">

            <nav class="myPage-menu">
                <p>내 정보 수정</p>
                <ul>
                    <li><a href="/myPage/myPage">- 프로필 수정</a></li>
                    <li><a href="/myPage/myPage-changePw">- 비밀번호 변경</a></li>
                    <li><a href="/myPage/myPage-secession">- 서비스 탈퇴</a></li>
                </ul>

            </nav>

        </aside>
        <main class="content-area">
            <div class="content-header">
                <h2>비밀번호 변경</h2>
            </div>

            <div class="content-body">
                <form action="/myPage/changePw" method="post" id="changePwFrm">
                    <div class="changePw">
                        <div class="myPage-row pw-row">
                            <label>현재 비밀번호</label>
                            <input type="password" id="currentPw" name="currentPw" maxlength="20">
                        </div>
        
                        <div class="myPage-row pw-row">
                            <label>새 비밀번호</label>
                            <input type="password" id="newPw" name="newPw" maxlength="20">
                        </div>

                        <div class="myPage-row pw-row">
                            <label>새 비밀번호 확인</label>
                            <input type="password" id="newPwConfirm" name="newPwConfirm" maxlength="20">
                        </div>

                        <div id="pwConfirm">영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자로 입력해주세요.</div>

                        <button class="myPage-submit" id="chPw">변경하기</button>
                    </div>
                </form>
            </div>
        </main>
    </section>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>

        <c:remove var="message"/>
    </c:if>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/mainPage.js"></script>
    <script src="/resources/js/myPage/myPage.js"></script>
</body>
</html>