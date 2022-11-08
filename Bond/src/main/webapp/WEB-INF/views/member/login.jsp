<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본드 | 로그인</title>
    <script src="https://kit.fontawesome.com/785870d879.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/band/login.css">
</head>
<body>
    <div class="top-logo">
        <a href="/">
            <img src="/resources/images/common/home-logo.png" id="home-logo">
        </a>
    </div>
    <main>
        <div class="login-title">로그인</div>
        <form action="/login" method="post" id="loginFrm">
            <section class="inputbox">
                <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일 입력"
                autocomplete="off" value="${cookie.saveId.value}">
            </section>
            <section class="inputbox">
                <input type="password" name="memberPw" id="memberPw"  placeholder="비밀번호 입력">
            </section>
            <div class="loginCheck" id="loginCheck"></div>
            <button class="inputbox login-btn">로그인</button>
            <section class="saveId-area">

            <%-- 쿠키에 svaeId 있을 때 --%>
            <c:if test="${!empty cookie.saveId.value}">
                <c:set var="temp" value="checked"/>
            </c:if>

                <label for="saveId">
                    <div class="saveIdArea" id="idCheck">
                        <i class="fa-solid fa-check" id="idCheck2">
                            <input type="checkbox" name="saveId" id="saveId"> 
                        </i>
                    </div>아이디 저장
                </label> 
            </section>
        
            <p class="text-area">
                본드가 처음이신가요?
                <a href="/signUp">회원가입</a> |
                <a href="/member/findEmail">이메일 찾기</a> | 
                <a href="/member/findPw">비밀번호 찾기</a>
            </p>
        </form>
    </main>
    <c:if test="${!empty message}">
        <script>
            alert("${message}")
        </script>

        <%-- message 1회 출력 후 모든 scope에서 삭제 --%>
        <c:remove var="message"/>
     </c:if>
    <script src="/resources/js/member/login.js"></script>
</body>
</html>