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

    <link rel="stylesheet" href="/resources/css/admin/layout/layout-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/group-detail-style.css">
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
                    <h3>모임 정보</h3>
                    <a href="/admin/group/list" id="list-btn">
                        목록
                    </a>
                </div>

                <div class="content-body">
                    
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>모임 번호</label>
                            <div class="detail-info-col">${groupInfo.group.groupNo}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 이름</label>
                            <div class="detail-info-col">${groupInfo.group.groupName}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 주제</label>
                            <div class="detail-info-col">${groupInfo.group.topicName}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 이미지</label>
                            <div class="detail-info-col">
                                <div id="imageBox">
                                    <c:if test="${!empty groupInfo.group.groupImage}">
                                        <img id="groupImage" src="${groupInfo.group.groupImage}">
                                    </c:if>
                                    <c:if test="${empty groupInfo.group.groupImage}">
                                        <img id="groupImage" src="/resources/images/bond/profile/no-profile.png">
                                    </c:if>
                                </div> <%-- end imageBox --%>
                            </div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 리더</label>
                            <div class="detail-info-col">${groupInfo.group.leaderName}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 개설일</label>
                            <div class="detail-info-col">${groupInfo.group.groupDate}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>회원 수</label>
                            <div class="detail-info-col">${groupInfo.group.memberCount}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>게시글 수</label>
                            <div class="detail-info-col">${groupInfo.group.postCount}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 공개 여부</label>
                            <div class="detail-info-col">${groupInfo.group.openYN}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>모임 상태</label>
                            <div class="detail-info-col">${groupInfo.group.groupStatus}</div>
                        </div>
                    </div>

                    <div class="detail-info">    
                        <div class="detail-info-row">
                            <label>모임 소개글</label>
                            <div class="detail-info-col">
                                ${groupInfo.group.groupComment}
                            </div>
                        </div>
                    </div>

                    <div class="detail-info">    
                        <div class="detail-info-row">
                            <label>정지 기록</label>
                            <div class="detail-info-col">
                                <span class="report-count">${groupInfo.reportCount}회</span>
                                <c:if test="${groupInfo.reportCount > 0}">
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
               <c:forEach var="report" items="${groupInfo.reportList}">
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
	
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> 
    <script src="/resources/js/admin/groupDetail.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>