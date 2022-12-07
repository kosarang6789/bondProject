<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임 찾기 | 본드</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

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

            <%-- <div class="mainPage-optionBox">
                <a href="#">목록 편집</a>
                <a href="#">본드 가이드</a>
            </div> --%>
        </nav>
    </section>

    <main>
        <section class="category-area">
            <div class="find-band-category">
                <h2>주제별 본드를 찾아보세요</h2>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide ">
                                <div class="category">
                                    <a href="/member/groupTopic/1" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/1_exercise.jpg" class="categoryImage">
                                        </div>
                                        <p>운동</p>
                                    </a>
                                    <a href="/member/groupTopic/2" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/2_craft.jpg" class="categoryImage">
                                        </div>
                                        <p>공예</p>
                                    </a>
                                    <a href="/member/groupTopic/3" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/3_game.jpg" class="categoryImage">
                                        </div>
                                        <p>게임</p>
                                    </a>
                                    <a href="/member/groupTopic/5" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/4_art.jpg" class="categoryImage">
                                        </div>
                                        <p>문화/예술</p>
                                    </a>
                                    <a href="/member/groupTopic/12" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/5_self-improvement.jpg" class="categoryImage">
                                        </div>
                                        <p>자기계발</p>
                                    </a>
                                    <a href="/member/groupTopic/7" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/6_camping.jpg" class="categoryImage">
                                        </div>
                                        <p>여행/캠핑</p>
                                    </a>
                                    <a href="/member/groupTopic/10" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/7_camera.jpg" class="categoryImage">
                                        </div>
                                        <p>사진</p>
                                    </a>
                                    <a href="/member/groupTopic/6" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/8_farming.jpg" class="categoryImage">
                                        </div>
                                        <p>자연/귀농</p>
                                    </a>
                                </div>
                            </div>
                            <div class="swiper-slide ">
                                <div class="category">
                                    <a href="/member/groupTopic/4" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/11_fan.jpg" class="categoryImage">
                                        </div>
                                        <p>팬클럽</p>
                                    </a>
                                    <a href="/member/groupTopic/8" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/9_cooking.jpg" class="categoryImage">
                                        </div>
                                        <p>요리</p>
                                    </a>
                                    <a href="/member/groupTopic/9" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/12_economy.jpg" class="categoryImage">
                                        </div>
                                        <p>경제/재태크</p>
                                    </a>
                                    <a href="/member/groupTopic/11" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/10_interior.jpg" class="categoryImage">
                                        </div>
                                        <p>인테리어</p>
                                    </a>
                                    <a href="/member/groupTopic/1" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/15_pet.png" class="categoryImage">
                                        </div>
                                        <p>애완동물</p>
                                    </a>
                                    <a href="/member/groupTopic/1" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/13_food.png" class="categoryImage">
                                        </div>
                                        <p>맛집탐방</p>
                                    </a>
                                    <a href="/member/groupTopic/1" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/14_language.jpg" class="categoryImage">
                                        </div>
                                        <p>어학/외국어</p>
                                    </a>
                                    <a href="/member/groupTopic/1" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/16_story.jpg" class="categoryImage">
                                        </div>
                                        <p>일상/이야기</p>
                                    </a>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="swiper-button-next swiper-button"></div>
                        <div class="swiper-button-prev swiper-button"></div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="search-area">
            <article>

                <h2>BOND 찾기</h2>
                <!-- 검색창 -->
                <form action="/member/search" method="get" id="group-search" onsubmit="return true">
                    <fieldset>
                        <div class="search-line">
                            <select name="key" id="search-key">
                                <option value="t">본드 이름</option>
                                <option value="c">본드 소개글</option>
                            </select>
                            <input type="text" id="search-query" name="query"
                            placeholder="원하는 모임을 검색하세요">

                            <a href="/member/findBond/search">
                                <button type="submit" id="search-btn">
                                    <i class="fa-solid fa-magnifying-glass" id="search-icon"></i>
                                </button>
                            </a>
                        </div>
                    </fieldset>
                </form>
            </article>
        </section>

        <section class="recommend-area">
            <div class="group-recommend">
                <h3>이런 모임은 어때요</h3>
                <ul class="group-list">
                    <c:forEach var="groupJoin" items="${groupJoinNo}">
                        <li class="group">
                            <a href="/bond/${groupJoin.groupNo}" class="bandUri">
                                <div class="group-img">
                                    <c:choose>
                                        <c:when test="${not empty groupJoin.groupImage}">
                                            <img src="${groupJoin.groupImage}" id="cover-img">  
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/resources/images/bond/profile/no-profile.png" id="cover-img">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="group-comment">
                                    <strong>${groupJoin.groupName}</strong>
                                    <p>${groupJoin.groupComment}</p>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </section>
        
    </main>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="/resources/js/member/mainPage.js"></script>

        <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        });
    </script>
</body>
</html>