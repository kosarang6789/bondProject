<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 회원 관리</title>

    <link rel="stylesheet" href="/resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="/resources/css/admin/member-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/searchbar-style.css">
    <link rel="stylesheet" href="/resources/css/admin/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
            <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

            <section class="content">
                <div class="content-header">
                    <h3>회원 정보</h3>
                    <a href="/admin/memberList" id="list-btn">
                        목록
                    </a>
                </div>

                <div class="content-body">
                    
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>회원 번호</label>
                            <div class="detail-info-col">01</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 이메일</label>
                            <div class="detail-info-col">one@kosaran</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 이름</label>
                            <div class="detail-info-col">김철수</div>
                        </div>
                        <div class="detail-info-row">
                            <label>기본 프로필</label>
                            <div class="detail-info-col">
                                <img id="memberImage" src="/resources/images/admin/temp-image.jpg">
                            </div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 전화번호</label>
                            <div class="detail-info-col">010-****-****</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 생일</label>
                            <div class="detail-info-col">1990-11-09</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 상태</label>
                            <div class="detail-info-col">정상</div>
                        </div>
                        <div class="detail-info-row">
                            <label>가입일</label>
                            <div class="detail-info-col">2022-10-01</div>
                        </div>
                        <div class="detail-info-row">
                            <label>탈퇴일</label>
                            <div class="detail-info-col">-</div>
                        </div>
                    </div>

                    <div class="detail-info">    
                        <div class="detail-info-row">
                            <label>정지 기록</label>
                            <div class="detail-info-col">
                                <span class="report-count">3회</span>
                                <button id="openModal">조회</button>
                            </div>
                        </div>
                    </div>

                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>모임 프로필</label>
                            <div class="detail-info-col">
                                <span class="join-count">10개</span>
                                <button id="openModal234">조회</button>
                            </div>
                        </div>
                    </div>

                </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <div id="modalDim">
        <div id="modalBox">
            <div id="modal" tabindex="0">
                <div id="closeModal">&times;</div>
                <h3>신고 기록</h3>
                <div class="report-modal-row">
                    <span class="report-no">신고번호</span>
                    <span class="report-request">신고자</span>
                    <span class="report-reason">신고사유</span>
                    <span class="report-result">처리결과</span>
                </div>
                <div class="report-modal-row">
                    <span class="report-no">1</span>
                    <span class="report-request">2</span>
                    <span class="report-reason">3</span>
                    <span class="report-result">4</span>
                </div>
                <div class="report-modal-row">
                    <span class="report-no">1</span>
                    <span class="report-request">2</span>
                    <span class="report-reason">3</span>
                    <span class="report-result">4</span>
                </div>
            </div>
        </div>
    </div>

    <script src="/resources/js/admin/memberDetail.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>