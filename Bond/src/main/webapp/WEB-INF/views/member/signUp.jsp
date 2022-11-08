<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본드 | 회원가입</title>
    <link rel="stylesheet" href="/resources/css/band/signUp.css">
</head>
<body>
    <div class="top-logo">
        <a href="/">
            <img src="/resources/images/common/home-logo.png" id="home-logo">
        </a>
    </div>
    <main>
        <div class="signUp-title">회원 가입</div>
        <form action="/signUp" method="post" id="signUpFrm">
            <section class="signUp-area">
                <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일"
                autocomplete="off" maxlegnth="50">
                <div id="emailConfirm" class="coner"></div>
            </section>
            <section class="signUp-area">
                <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호" maxlegnth="20">
                <input type="password" name="memberPwConfirm" id="memberPwConfirm" placeholder="비밀번호 확인" maxlegnth="20">
                <div id="pwConfirm" class="coner">영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자 사이로 입력해주세요.</div>
            </section>
            <section class="signUp-area">
                <input type="text" name="memberName" id="memberName" placeholder="이름" maxlegnth="10">
                <div id="nameConfirm" class="coner">한글, 영어, 숫자 2~10자리 입력해주세요.</div>
            </section>
            <section class="signUp-area">
                <input type="text" name="memberTel" id="memberTel" placeholder="전화번호" maxlength="11"
                autocomplete="off">
                <div id="telConfirm" class="coner">전화번호를 입력해주세요. (-제외)</div>
            </section>
            <section class="signUp-area">
                <div class="birth-title">생년월일</div>
                <input type="date" name="memberBirth" id="memberBirth">
                <div id="birthConfirm" class="coner"></div>
            </section>
            <button class="signUp-btn">회원가입</button>
        </form>
    </main>
        
    <script src="/resources/js/member/signUp.js"></script> 
</body>
</html>