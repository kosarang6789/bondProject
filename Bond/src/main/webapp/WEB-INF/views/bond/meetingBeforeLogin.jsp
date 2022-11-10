<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임이 쉬워진다 | BOND</title>

    <link rel="stylesheet" href="css/meeting-x.css">
    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon">
</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBond.jsp"/>    

        <div id="container">
            <!-- 1번 영역 -->
            <aside id="info">
                <div id="info-inner">
                    <div class="side-cover">
                        <a href="#" class="cover">
                            <img src="images/side-cover.png" id="cover-img">
                        </a>
                    </div>

                    <div class="band-name">
                        <a href="#" class="uri-text">KH 팀프로젝트</a>
                    </div>

                    <p class="member">
                        <a href="#" class="member-count">멤버 5</a>
                    </p>

                    <div class="share">
                        <a href="#" class="share-address">
                            <i class="fa-solid fa-arrow-up-right-from-square"></i>
                            밴드 링크 복사
                        </a>
                    </div>    
                
                    <div class="btn-box">
                        <button type="button" class="write-button">밴드 가입하기</button>
                        <div class="sidebar-under-icon">
                            <div class="band-setting-section">
                                <a href="#" class="band-setting-link sidebar-font"> 
                                    밴드 정보 보기 >
                                </a>
                            </div>
                        </div>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                </div>
            </aside>

            <!-- 2번 영역 -->
            <div class="band-intro-list">
                <div class="band-intro">
                    <h2 class="band-intro-title">밴드 소개</h2>
                    <div class="band-intro-detail">
                        <p class="desc">
                            🧙‍♂️ 타로카드 공부방 소개 <br>
                            ▶️ 타로 입문자, 숙련자 모두가 함께 공부하는 공간입니다. <br>
                            올바른 지식과 근거를 나누며 성장하는 커뮤니티로서 타로에 대한 식견을 교환하고 연구하는 것을 지향합니다. 
                        </p>
                        <div class="intro-option">
                            <div class="intro-option-box">
                                <ul class="select-keyword-list">
                                    <li class="select-keyword-item">취미</li>
                                    <li class="select-keyword-item">심리학</li>
                                    <li class="select-keyword-item">운세</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <ul class="intro-photo collage">
                        <li class="collage-photo">
                            <a href="#">
                                <img src="images/intro-photo1.PNG">
                            </a>
                        </li>
                        <li class="collage-photo">
                            <a href="#">
                                <img src="images/intro-photo2.PNG">
                            </a>
                        </li>
                        <li class="collage-photo">
                            <a href="#">
                                <img src="images/intro-photo3.PNG">
                            </a>
                        </li>
                        <li class="collage-photo">
                            <a href="#">
                                <img src="images/intro-photo4.PNG">
                            </a>
                        </li>
                    </ul>

                    <div class="intro-option-statics">
                        <h2 class="intro-title">이 밴드의 활동 정보</h2>
                        <div class="intro-info-wrap">
                            <p class="intro-desc">
                                개설일
                                <span class="intro-desc-data">2022년 1월</span>
                            </p>
                            <p class="intro-desc">
                                최근 새글
                                <span class="intro-desc-data">1건</span>
                            </p>
                            <p class="intro-desc">
                                최근 가입
                                <span class="intro-desc-data">10명</span>
                            </p>
                        </div>
                    </div>

                    <div class="empty" style="height: 235px;">
                        <a href="#" class="empty-inner">
                            <span class="empty-icon">
                                    <i class="fa-regular fa-clipboard empty-icon-inner"></i>
                            </span>
                            <p class="empty-desc">모든 글을 보려면 밴드에 가입해보세요.</p>
                        </a>
                    </div>
                </div>
            </div>

            <a href="#">
                <button type="button" class="btn-go-to-top">
                    <i class="fa-solid fa-arrow-up go-to-top-icon"></i>
                </button>
            </a>
        </div>


</body>