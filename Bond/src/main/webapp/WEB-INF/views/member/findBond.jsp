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
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/1_exercise.jpg" class="categoryImage">
                                        </div>
                                        <p>운동</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/2_craft.jpg" class="categoryImage">
                                        </div>
                                        <p>공예</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/3_game.jpg" class="categoryImage">
                                        </div>
                                        <p>게임</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/4_art.jpg" class="categoryImage">
                                        </div>
                                        <p>문화/예술</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/5_self-improvement.jpg" class="categoryImage">
                                        </div>
                                        <p>자기개발</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/6_camping.jpg" class="categoryImage">
                                        </div>
                                        <p>여행/캠핑</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/7_camera.jpg" class="categoryImage">
                                        </div>
                                        <p>사진</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/8_farming.jpg" class="categoryImage">
                                        </div>
                                        <p>자연/귀농</p>
                                    </a>
                                </div>
                            </div>
                            <div class="swiper-slide ">
                                <div class="category">
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/11_fan.jpg" class="categoryImage">
                                        </div>
                                        <p>팬클럽</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/9_cooking.jpg" class="categoryImage">
                                        </div>
                                        <p>요리</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/12_economy.jpg" class="categoryImage">
                                        </div>
                                        <p>경제/재태크</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/10_interior.jpg" class="categoryImage">
                                        </div>
                                        <p>인테리어</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/15_pet.png" class="categoryImage">
                                        </div>
                                        <p>애완동물</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/13_food.png" class="categoryImage">
                                        </div>
                                        <p>맛집탐방</p>
                                    </a>
                                    <a href="#" class="category-list">
                                        <div class="categoryImageWrap">
                                            <img src="/resources/images/member/main2/group-category/14_language.jpg" class="categoryImage">
                                        </div>
                                        <p>어학/외국어</p>
                                    </a>
                                    <a href="#" class="category-list">
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
                <form action="#" method="get" id="group-search" onsubmit="return true">
                    <fieldset>
                        <select name="key" id="search-key">
                            <option value="t">본드 이름</option>
                            <option value="c">본드 소개글</option>
                        </select>
                        <c:forEach var="group" items="${group}">
                            ${group.groupNo}
                        </c:forEach>
                        <input type="text" id="search-query" name="query"
                        placeholder="원하는 모임을 검색하세요">

                        <button type="submit" id="search-btn"
                        class="fa-solid fa-magnifying-glass">

                        </button>
                    </fieldset>
                </form>
                    
                <%-- 검색을 진행한 경우 --%>
                <c:if test="${not empty param.key}">
                    <c:set var="sURL" value="&key=${param.key}&query=${param.key}"/>
                </c:if>

                <div class="search-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>본드 이름</th>
                                <th>본드 소개글</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                                <c:when test="${empty groupList}">
                                <!-- 본드 목록 조회 결과가 비어있다면 -->
                                    <tr>
                                        <th colspan="3">본드가 존재하지 않습니다.</th>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                <!-- 본드 목록 조회 결과가 있다면 -->
                                <c:forEach var="group" items="${group}">
                                    <tr>
                                        <td>${group.groupNo}</td>
                                        <td>
                                            <c:if test="${not empty group.thumbnail}">
                                                <img class="list-thumbnail" src="${group.thumbnail}">
                                            </c:if>
                                            <c:if test="${empty group.thumbnail}">
                                                <img class="list-thumbnail" src="/resources/images/bond/profile/no-profile.png">
                                            </c:if>

                                            <a href="/member/${group.groupNo}?cp=${pagination.currentPage}${sURL}">${group.groupName}</a>
                                        </td>
                                        <td>${group.groupComment}</td>
                                    </tr>
                                </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <div class="pagination-area">

                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="/group/${groupNo}?cp=1${sURL}">&lt;&lt;</a></li>
    
                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="/group/${groupNo}?cp=${pagination.prevPage}${sURL}">&lt;</a></li>
    
    
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
    
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>
    
                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/group/${groupNo}/?cp=${i}${sURL}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        
                        </c:forEach>
                        
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <li><a href="/group/${groupNo}?cp=${pagination.nextPage}${sURL}">&gt;</a></li>
    
                        <!-- 끝 페이지로 이동 -->
                        <li><a href="/group/${groupNo}?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
    
                    </ul>
                </div>
    

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
                                    <%-- <img src="/resources/images/member/main2/group-recommend/group-english.jpg"> --%>
                                </div>
                                <div>
                                    <strong>${groupJoin.groupName}</strong>
                                    <p>${groupJoin.groupComment}</p>
                                </div>
                            </a>
                        </li>
                    </c:forEach>

                    <%-- <li class="group">
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
                    </li> --%>
                </ul>
            </div>
        </section>
        
    </main>
    
    <h3>session scope 확인</h3>
    이름 : "${loginMember.memberName}";
    생일 : "${loginMember.memberBirth}";
    전화번호 : "${loginMember.memberTel}";

    <a href="/logout">로그아웃</a>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
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