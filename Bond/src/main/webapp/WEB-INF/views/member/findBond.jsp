<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Bond</title>

    <link rel="stylesheet" href="/resources/css/member/findBond.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />

    <!-- 네비게이션 -->
    <section class="nav-area">
        <nav>
            <div class="mainPage-menu">
                <a href="/member/mainPage">내 모임</a>
                <a class="active" href="/member/findBond">모임찾기</a>
            </div>

            <div class="mainPage-optionBox">
                <a href="#">목록 편집</a>
                <a href="#">본드 가이드</a>
            </div>
        </nav>
    </section>

    <main>
        <section class="category-area">
            <div class="find-band-category">
                <h2>주제별 본드를 찾아보세요</h2>
                <div class="group-category">
                    <button id="left-btn">
                        <i class="fa-sharp fa-solid fa-chevron-left"></i>
                    </button>
                    <ul>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/1_exercise.jpg">
                                <p>운동</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/2_craft.jpg">
                                <p>공예</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/3_game.jpg">
                                <p>게임</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/4_art.jpg">
                                <p>문화/예술</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/5_self-improvement.jpg">
                                <p>자기개발</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/6_camping.jpg">
                                <p>여행/캠핑</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/7_camera.jpg">
                                <p>사진</p>
                            </a>
                        </li>
                        <li class="category-list">
                            <a href="#">
                                <img src="/resources/images/member/main2/group-category/8_farming.jpg">
                                <p>자연/귀농</p>
                            </a>
                        </li>
                    </ul>
                    <button id="right-btn">
                        <i class="fa-sharp fa-solid fa-chevron-right"></i>
                    </button>
                </div>
            </div>


        </section>
        
        <section class="search-area">
            <article>
                <h2>BOND 찾기</h2>
                <form action="#">
                    <fieldset>
                        <input type="text" id="query" name="query"
                        placeholder="원하는 모임을 검색하세요">

                        <button type="submit" id="search-btn"
                        class="fa-solid fa-magnifying-glass">

                        </button>
                    </fieldset>
                </form>
            </article>
        </section>

        <section class="recommend-area">
            <div class="group-recommend">
                <h3>이런 모임은 어때요</h3>
                <ul class="group-list">
                    <li class="group">
                        <a href="#" class="bandUri">
                            <div class="group-img">
                                <img src="/resources/images/member/main2/group-recommend/group-english.jpg">
                            </div>
                            <div>
                                <strong>영어가 술술 스피킹</strong>
                                <p>원어민처럼 말하는 그날까지 같이 공부해요!</p>
                            </div>
                        </a>
                    </li>
                    <li class="group">
                        <a href="#" class="bandUri">
                            <div class="group-img">
                                <img src="/resources/images/member/main2/group-recommend/group-coding.jpg">
                            </div>
                            <div>
                                <strong>코사랑 동호회</strong>
                                <p>코잘알이 되는 날까지 hello world! 에러는 싫어요 404는 이제 그만</p>
                            </div>
                        </a>
                    </li>
                    <li class="group">
                        <a href="#" class="bandUri">
                            <div class="group-img">
                                <img src="/resources/images/member/main2/group-recommend/group-riding.jpg">
                            </div>
                            <div>
                                <strong>자전거 따릉따릉</strong>
                                <p>자전거를 통한 체력 단련으로 건강 되찾기, 따릉이도 환영합니다</p>
                            </div>
                        </a>
                    </li>
                    <li class="group">
                        <a href="#" class="bandUri">
                            <div class="group-img">
                                <img src="/resources/images/member/main2/group-recommend/group-spaceout.jpg">
                            </div>
                            <div>
                                <strong>멍때리기 대회 준비</strong>
                                <p>멍때리기를 통해 내면을 다스립니다 Inner Peace</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
        
    </main>
    
    <h3>session scope 확인</h3>
    이름 : "${loginMember.memberName}";
    생일 : "${loginMember.memberBirth}";
    전화번호 : "${loginMember.memberTel}";

    <a href="/logout">로그아웃</a>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>