<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 성공!</title>

    <link rel="stylesheet" href="/resources/css/member/signUp.css">
</head>
<body>
    <div class="top-logo">
        <a href="/">
            <img src="/resources/images/common/home-logo.png"  id="home-logo">
        </a>
    </div>

    <main>
        <form action="/signUpOk" method="GET">
            <div class="con-title">
                <h1>회원 가입을 축하드립니다.</h1>
            </div>
            <div class="con-subtitle">
                <h3>당신의 모임을 위한 다양한 공간</h3>
                <h3>본드를 시작하세요</h3>
            </div>
            <div class="move">
                <a href="/"><div class="move-main">메인페이지</div></a>
                <a href="/login"><div class="move-login">로그인</div></a>
            </div>
        </form>
    </main>
</body>
</html>