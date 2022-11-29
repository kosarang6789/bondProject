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

    <link rel="stylesheet" href="/resources/css/admin/layout/layout-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/member-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/add/searchbar-style.css">
    <link rel="stylesheet" href="/resources/css/admin/add/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/add/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
            <jsp:include page="/WEB-INF/views/admin/add/sidebar.jsp" />

            <section class="content">
                <div class="content-header">
                    <h3>회원 정보</h3>
                    <a href="/admin/member/list" id="list-btn">
                        목록
                    </a>
                </div>

                <div class="content-body">
                    
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>회원 번호</label>
                            <div class="detail-info-col">${memberInfo.member.memberNo}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 이메일</label>
                            <div class="detail-info-col">${memberInfo.member.memberEmail}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 이름</label>
                            <div class="detail-info-col">${memberInfo.member.memberName}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>기본 프로필</label>
                            <div class="detail-info-col">
                                <img id="memberImage" src="/resources/images/admin/temp-image.jpg">
                            </div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 전화번호</label>
                            <div class="detail-info-col">${memberInfo.member.memberTel}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 생일</label>
                            <div class="detail-info-col">${memberInfo.member.memberBirth}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 상태</label>
                            <div class="detail-info-col">${memberInfo.member.memberStatus}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>가입일</label>
                            <div class="detail-info-col">${memberInfo.member.signUpDate}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>탈퇴일</label>
                            <div class="detail-info-col">${memberInfo.member.delDate}</div>
                        </div>
                    </div>

                    <div class="detail-info">    
                        <div class="detail-info-row">
                            <label>정지 기록</label>
                            <div class="detail-info-col">
                                <span class="report-count">${memberInfo.reportCount}회</span>
                                <c:if test="${memberInfo.reportCount > 0}">
                                    <button id="openModal" class="modalBtn">조회</button>
                                </c:if>
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
                <%-- 반복문 추가하기 --%>
                <c:forEach var="report" items="${memberInfo.reportList}">
                    <div class="report-modal-row">
                        <span class="report-no">${report.reportNo}</span>
                        <span class="report-request">${report.memberName}</span>
                        <span class="report-reason">${report.reasonDetails}</span>
                        <span class="report-result">${report.resultDetails}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script src="/resources/js/admin/memberDetail.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>