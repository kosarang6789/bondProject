<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/resources/images/common/title-logo.jpg" type="image/x-icon">
    <title>본드 | 로그인</title>
    <link rel="stylesheet" href="/resources/css/band/login.css">
</head>
<body>
    <div class="top-logo">
        <a href="/main">
            <img src="/resources/images/common/home-logo.png" id="home-logo">
        </a>
    </div>
    <main>
        <div class="login-title">로그인</div>
        <form action="/login" method="post">
            <section class="inputbox">
                <input type="text" name="memberEmail" placeholder="이메일 입력" required
                autocomplete="off" value="${cookie.saveId.value}">
            </section>
            <section class="inputbox">
                <input type="password" name="memberPw" placeholder="비밀번호 입력" required>
            </section>
            <button class="inputbox login-btn">로그인</button>
            <section class="saveId-area">

            <%-- 쿠키에 svaeId 있을 때 --%>
            <c:if test="${!empty cookie.saveId.value}">
                <c:set var="temp" value="checked"/>
            </c:if>

                <input type="checkbox" name="saveId" id="saveId" ${temp}> 
                <label for="saveId">아이디 저장</label> 
            </section>
        
            <p class="text-area">
                본드가 처음이신가요?
                <a href="/member/signUp">회원가입</a> |
                <a href="/member/findEmail">이메일 찾기</a> | 
                <a href="/member/findPw">비밀번호 찾기</a>
            </p>
        </form>
    </main>
     <c:if test="${!empty message}">
        <script>
            alert("${message}")
        </script>

        <c:remove var="message" />
     </c:if>
</body>
</html>