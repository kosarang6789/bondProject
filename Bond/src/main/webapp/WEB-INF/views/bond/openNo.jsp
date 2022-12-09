<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임이 쉬워진다 | BOND</title>

    <link rel="stylesheet" href="/resources/css/bond/openYes.css">
    <link rel="stylesheet" href="/resources/css/bond/Modal-jose.css"><%-- 가입모달 --%>
    <link rel="stylesheet" href="/resources/css/bond/modalBondIntro.css"><%-- 본드 정보 모달 --%>

    <script src="https://kit.fontawesome.com/1ce4f19a7a.js" crossorigin="anonymous"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/bond/headerBondX.jsp"/>    

        <div id="container">
            <!-- 1번 영역 -->
            <aside id="info">
                <div id="info-inner">
                    <div class="side-cover">
                    <a href="#" class="cover-img">
                            <c:choose>
                                <c:when test="${not empty groupInfo.groupImage}">
                                    <img src="${groupInfo.groupImage}" id="cover-img">  
                                </c:when>
                                <c:otherwise>
                                    <img src="/resources/images/bond/profile/no-profile.png" id="cover-img">
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </div>

                    <div class="band-name">
                        <a href="#" class="uri-text">${groupInfo.groupName}</a>
                    </div>

                    <p class="member">
                        <a href="#" class="member-count">멤버 ${groupInfo.memberCount}</a>
                    </p>

                    <div class="band-info">
                        <p class="band-description">${groupInfo.groupComment}</p>
                        <a href="#" class="more-link modalInfo">...더보기</a>
                    </div>

                    <div class="share">
                        <a href="#" class="share-address">
                            <i class="fa-solid fa-arrow-up-right-from-square"></i>
                            본드 링크 복사
                        </a>
                    </div>    
                
                    <div class="btn-box">
                        <button type="button" class="write-button">본드 가입하기</button>
                        <div class="sidebar-under-icon">
                            <div class="band-setting-section2">
                                <a href="#" class="band-setting-link sidebar-font"> 
                                    본드 정보 보기 >
                                </a>
                            </div>
                        </div>
                        <p class="box-desc">
                            누구나 본드를 검색해 찾을 수 있고, 본드 소개와 게시글을 볼 수 있습니다.
                        </p>
                    </div>

                </div>
            </aside>

            <!-- 2번 영역 -->
            <div class="band-intro-list">
                <div class="band-intro">
                    <h2 class="band-intro-title">본드 소개</h2>
                    <div class="band-intro-detail">
                        <p class="desc">${groupInfo.groupComment}</p>
                    </div>

                    <div class="intro-option-statics">
                        <h2 class="intro-title">이 본드의 활동 정보</h2>
                        <div class="intro-info-wrap">
                            <p class="intro-desc">
                                개설일
                                <span class="intro-desc-data">${groupInfo.groupDate}</span>
                            </p>
                            <p class="intro-desc">
                                멤버수
                                <span class="intro-desc-data">${groupInfo.memberCount}명</span>
                            </p>
                        </div>
                    </div>

                    <div class="empty" style="height: 450px;">
                        <a href="#" class="empty-inner">
                            <span class="empty-icon">
                                <img src="/resources/images/bond/openNo-img.png" class="openNoImg">
                            </span>
                            <p class="empty-desc">모든 글을 보려면 본드에 가입해보세요.</p>
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

        <%-- 가입 모달 --%>
        <jsp:include page="/WEB-INF/views/bond/joinModal.jsp"/>
        <script src="/resources/js/bond/joinModal.js"></script>

        <%-- 본드 정보 보기 모달 --%>
        <jsp:include page="/WEB-INF/views/bond/modalBondIntro.jsp"/>
        <script src="/resources/js/bond/modalBondIntro.js"></script>


        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

        <script src="/resources/js/bond/openNo.js"></script>

</body>