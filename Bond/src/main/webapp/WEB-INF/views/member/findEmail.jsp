<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본드 | 이메일 찾기</title>
    <link rel="stylesheet" href="/resources/css/member/findEmailPw.css">
</head>
<body>
    <div class="top-logo">
        <a href="/html/main.html">
            <img src="/resources/images/common/home-logo.png" id="home-logo">
        </a>
    </div>
    <main>
        <div class="find-title findEmail">이메일 찾기</div>
        <form action="/member/findEmail" method="post" id="findEmail-frm">
            <section class="inputbox">
                <input type="text" name="memberName" placeholder="이름 입력" id="e-inputName"
                    autocomplete="off">
            </section>
            <section class="inputbox">
                <input type="text" name="memberTel" placeholder="전화번호 입력" id="e-inputTel"
                    autocomplete="off" maxlength="11">
                    <p class="noInput-">- 빼고 입력해주세요.</p>
            </section>
            <button class="inputbox findEmail-btn">이메일 찾기</button>

            <div id="modal" class="modal">
                <div class="modalArea">
                    <div class="findEmailTitle">이메일 찾기</div>
                    <div id="findEmailResult"></div>
                    <div class="btnArea">
                        <div class="btns">
                            <a href="/" id="mainBtn">메인페이지</a>
                        </div>
                        <%-- <div class="btns">
                            <a href="/login" id="loginSignUpBtn">dd</a>
                        </div> --%>
                    </div>
                </div>
            </div>

        </form>
    </main>
    <script src="/resources/js/member/findEmailPw.js"></script>
</body>
</html>