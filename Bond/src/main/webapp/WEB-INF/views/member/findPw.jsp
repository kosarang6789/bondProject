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
                <input type="text" name="inputName" name="memberName"
                    placeholder="이름 입력" required autocomplete="off">
            </section>
            <section class="inputbox">
                <input type="text" name="inputTel" name="memberTel"
                    placeholder="전화번호 입력" required autocomplete="off">
                    <p class="noInput-">- 빼고 입력해주세요.</p>
            </section>
            <section class="inputbox">
                <input type="text" name="inputEmail" name="memberEmail"
                    placeholder="이메일 입력" required autocomplete="off">
            </section>
            <section class="inputbox">
                <input type="text" name="inputEmail" name="inputEmail"
                    placeholder="인증번호 입력" required autocomplete="off">
            </section>
            <button class="inputbox findPw-btn">비밀번호 찾기</button>

            <c:if test="${not empty emailCheck}">
                <c:set var="check" value="modalO"/>
            </c:if>




            <div id="modal" class="modal ${check}">
                <div class="modalArea">
                    <div class="findEmailTitle">이메일 찾기</div>
                    <div id="findEmailResult">
                        <c:choose>
                            <c:when test="${not empty memberEmail}">
                                ${memberEmail} 입니다.
                            </c:when>
                            <c:otherwise>
                                등록된 이메일이 없습니다.
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="btnArea">
                        <a href="/" id="mainBtn">
                            <div class="btns">
                                메인페이지
                            </div>
                        </a>
                        
                        <c:choose>
                            <c:when test="${!empty memberEmail}">
                                <a href="/login">
                                    <div class="btns">로그인</div>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/login">
                                    <div class="btns">회원가입</div>
                                </a>
                            </c:otherwise>
                        </c:choose>
                        
                    </div>
                </div>
            </div>
        </form>
    </main>
    <script src="/resources/js/member/findEmailPw.js"></script>
</body>
</html>