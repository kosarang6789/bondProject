<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임이 쉬워진다 | BOND</title>

    <link rel="stylesheet" href="css/album.css">
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

                    <div class="band-info">
                        <p class="band-description">KH 팀프로젝트 소개글입니다아아아아아아아아아
                            아아아아아아아아아아아아아아-----------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                            ---------------------------------------------------------------------
                        </p>
                        <a href="#" class="more-link">...더보기</a>
                    </div>

                    <div class="btn-box">
                        <button type="button" class="write-button">글쓰기</button>
                        <p class="box-desc">
                            누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                    <div class="sidebar-under-icon">
                        <div class="band-setting-section">
                            <a href="#" class="band-setting-link sidebar-font"> 
                                <i class="fa-solid fa-gear sidbar-icon"></i>밴드 설정
                            </a>
                            
                        <div class="band-setting-list">
                            <ul class="band-setting-item">
                                <li>
                                    <a href="#" class="report-band sidebar-font">
                                        <i class="fa-solid fa-bell sidbar-icon"></i>신고하기
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="leave-band sidebar-font">
                                        <i class="fa-solid fa-person-walking-arrow-right sidbar-icon"></i>탈퇴하기
                                    </a>
                                </li>
                            </ul>
                        </div>  
                        </div>
                    </div>
                </div>
            </aside>

            <!-- 2번 영역 -->
            <main id="content">
                <div class="album-section">
                    <div class="header-wrap header-wrap-fixed">
                        <div class="header-main">
                            <h1 class="title">사진첩</h1>
                            <div class="btn-wrap">
                                <button type="button" class="create-album ubutton">앨범 만들기</button>
                            </div>
                        </div>
                    </div>

                    <div class="album-wrap">
                        <div class="album-header">
                            <div class="item">
                                <h2 class="title">
                                    <a href="#">
                                        <strong>전체사진</strong>
                                        <em>5</em>
                                    </a>
                                </h2>
                                <time class="info">2022년 11월</time>
                            </div>

                            <div class="item">
                                <span class="btn-attach-photo">
                                    <span class="photo-upload">
                                        <i class="fa-solid fa-plus photo-plus" style="color: #777;"></i>
                                        <input type="file" class="file-input">
                                    </span>
                                </span>
                            </div>
                        </div>

                        <ul class="album-images">
                            <li class="album">
                                <a href="#">
                                    <img src="images/album1.png" class="album-img">
                                </a>
                            </li>
                            <li class="album">
                                <a href="#">
                                    <img src="images/album2.png" class="album-img">
                                </a>
                            </li>
                            <li class="album">
                                <a href="#">
                                    <img src="images/album3.png" class="album-img">
                                </a>
                            </li>
                            <li class="album"><a href="#">4</a></li>
                            <li class="album"><a href="#">5</a></li>
                            <li class="album"><a href="#">6</a></li>
                        </ul>

                    </div>

                    <div class="album-wrap album-wrap-line">
                        <div class="album-sort">
                            <span class="title">앨범</span>
                        </div>

                        <ul class="album-list">
                            <li class="album-item-view">
                                <div class="album-header">
                                    <div class="item">
                                        <h2 class="title">
                                            <a href="#">
                                                <strong>애니멀왕국</strong>
                                                <em>3</em>
                                            </a>
                                        </h2>
                                        <time class="info">2022년 11월</time>
                                    </div>
        
                                    <div class="item">
                                        <span class="btn-attach-photo">
                                            <span class="photo-upload">
                                                <i class="fa-solid fa-plus photo-plus" style="color: #777;"></i>
                                                <input type="file" class="file-input">
                                            </span>
                                        </span>
                                    </div>
                                </div>

                                <ul class="album-images">
                                    <li class="album-bottom">
                                        <a href="#">
                                            <img src="images/album1.png" class="album-img">
                                        </a>
                                    </li>
                                    <li class="album-bottom">
                                        <a href="#">
                                            <img src="images/album2.png" class="album-img">
                                        </a>
                                    </li>
                                    <li class="album-bottom">
                                        <a href="#">
                                            <img src="images/album3.png" class="album-img">
                                        </a>
                                    </li>
                                    <li class="album-bottom"><a href="#">4</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </main>

            <!-- 3번 영역 -->
            <div id="banner">
                <div class="band-photo-area">
                    <section class="band-photo">
                        <h2 class="tit">최근 사진</h2>
                        <div class="photo-body">
                            <div class="photo-list">
                                <a href="#" class="banner-box">
                                    <img src="images/banner.jpeg" class="banner-img">
                                </a>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                                <span class="no-img"></span>
                            </div>
                        </div>
                        <a href="#" class="more-button">더보기</a>
                    </section>
                </div>
            </div>

            <a href="#">
                <button type="button" class="btn-go-to-top">
                    <i class="fa-solid fa-arrow-up go-to-top-icon"></i>
                </button>
            </a>
        </div>
</body>