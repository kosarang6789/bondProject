<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/resources/css/member/findEmailPw.css">
</head>
<body>
    <div class="top-logo">
        <a href="/">
            <img src="/resources/images/common/home-logo.png"  id="home-logo">
        </a>
    </div>
    <main>
        <div class="find-title findPw">비밀번호 찾기</div>
        <form action="/member/findPw" method="post" id="findPw-frm">
            <section class="inputbox">
                <input type="text" id="inputName" name="memberName"
                    placeholder="이름 입력" autocomplete="off">
            </section>
            <section class="inputbox">
                <input type="text" id="inputTel" name="memberTel" maxlength="11"
                    placeholder="전화번호 입력" autocomplete="off">
                    <p class="noInput-">- 빼고 입력해주세요.</p>
            </section>
            <section class="inputbox">
                <input type="text" id="inputEmail" name="memberEmail"
                    placeholder="이메일 입력" autocomplete="off">
                <button id="sendKey" type="button">인증번호 전송</button>
            </section>
            <section class="inputbox">
                <input type="text" name="inputKey" id="inputKey"
                    placeholder="인증번호 입력" autocomplete="off">
                <span id="authKeyMessage" class="signUp-message"></span>
                <button id="checkKey" type="button">인증번호 확인</button>
            </section>
            <button class="inputbox findPw-btn">비밀번호 찾기</button>

            <c:if test="${not empty pwCheck}">
                <c:set var="check" value="modalO"/>
            </c:if>

                <div id="modal" class="modal ${check}">
                    <div class="modalArea">
                        <div class="findPwTitle">비밀번호 변경</div>
                        <div id="changePw">
                            <input type="password" name="memberPw" id="memberPw" placeholder="변경 비밀번호 입력" maxlegnth="20">
                            <input type="password" name="memberPwConfirm" id="memberPwConfirm" placeholder="비밀번호 확인" maxlegnth="20">
                            <div id="pwConfirm" class="coner">영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자로 입력해주세요.</div>
                        </div>

                        <div class="btnArea">
                            <button>비밀번호 변경</button>
                        </div>

                </div>

                        <%-- <div class="btnArea">
                            <a href="/" id="mainBtn">
                                <div class="btns">
                                    메인페이지
                                </div>
                            </a>
                            <a href="/login">
                                <div class="btns">로그인</div>
                            </a>
                        </div> --%>
                    </div>
        </form>
    </main>
     <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/findPw.js"></script>
</body>
</html>