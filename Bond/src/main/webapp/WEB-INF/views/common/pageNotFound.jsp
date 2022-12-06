<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>페이지 오류</title>

    <link rel="stylesheet" href="/resources/css/common/pageNotFound-style.css">
</head>
<body>
    <section class="header-area">
        <header>
            <div>
                <!-- 클릭 시 메인으로 이동하는 로고  -->
                <a href="/member/mainPage">
                    <img src="/resources/images/common/home-logo.png" id="home-logo">
                </a>
            </div>
        </header>

        <div id="pageNotFoundBody">
            <div id="imgBox">
                <img id="sadImage" src="/resources/images/common/sad-dog.jpg">
            </div>
            <div id="comment">
                페이지를 찾을 수 없습니다.
            </div>
            <div id="commentDetail">
                주소가 잘못 입력되었거나, 변경되었을 수 있습니다.
                <br>
                주소를 확인한 후 다시 시도해주세요.
            </div>
            <a href="/member/mainPage" id="goMainButton">
                홈으로
            </a>
        </div>
    </section>
</body>
</html>