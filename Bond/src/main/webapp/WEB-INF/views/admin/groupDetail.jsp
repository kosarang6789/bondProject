<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 모임 관리</title>

    <link rel="stylesheet" href="/resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="/resources/css/admin/group-detail-style.css">
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
                    <h3>모임 정보</h3>
                    <a href="/admin/groupList" id="list-btn">
                        목록
                    </a>
                </div>

                <div class="content-body">
                    
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>모임 번호</label>
                            <div class="detail-info-col">01</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 이름</label>
                            <div class="detail-info-col">스터디 소모임</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 주제</label>
                            <div class="detail-info-col">자기개발</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 이미지</label>
                            <div class="detail-info-col">
                                <img id="groupImage" src="/resources/images/admin/admin-group-icon.png">
                            </div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 리더</label>
                            <div class="detail-info-col">김철수</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 개설일</label>
                            <div class="detail-info-col">2022-11-09</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 수</label>
                            <div class="detail-info-col">127명</div>
                        </div>
                        <div class="detail-info-row">
                            <label>게시글 수</label>
                            <div class="detail-info-col">502개</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 공개 여부</label>
                            <div class="detail-info-col">공개</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 상태</label>
                            <div class="detail-info-col">정지</div>
                        </div>
                    </div>

                    <div class="detail-info">    
                        <div class="detail-info-row">
                            <label>모임 소개글</label>
                            <div class="detail-info-col">
                                안녕하세요. 자기개발 소모임입니다.
                                높이 확인중입니다.
                                동해 물과 백두산이 마르고 닳도록
                                하느님이 보우하사 우리나라 만세.
                                무궁화 삼천리 화려 강산
                                대한 사람, 대한으로 길이 보전하세.
                                <br>
                                남산 위에 저 소나무, 철갑을 두른 듯
                                바람 서리 불변함은 우리 기상일세.
                                무궁화 삼천리 화려 강산
                                대한 사람, 대한으로 길이 보전하세.
                                <br>
                                가을 하늘 공활한데 높고 구름 없이
                                밝은 달은 우리 가슴 일편단심일세.
                                무궁화 삼천리 화려 강산
                                대한 사람, 대한으로 길이 보전하세.
                                <br>
                                이 기상과 이 맘으로 충성을 다하여
                                괴로우나 즐거우나 나라 사랑하세.
                                무궁화 삼천리 화려 강산
                                대한 사람, 대한으로 길이 보전하세.
                            </div>
                        </div>
                    </div>

                    <div class="detail-info">    
                        <div class="detail-info-row">
                            <label>정지 기록</label>
                            <div class="detail-info-col">
                                <span class="report-count">
                                    3회
                                </span>
                                <button id="openModal">조회</button>
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
	
    <script src="/resources/js/admin/groupDetail.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>