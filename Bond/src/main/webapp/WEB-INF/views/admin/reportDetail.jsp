<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 신고 관리</title>

    <link rel="stylesheet" href="/resources/css/admin/layout/layout-detail-style.css">
    <link rel="stylesheet" href="/resources/css/admin/report-detail-style.css">
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
                    <h3>게시물 제목</h3>
                    <a href="/admin/reportList" id="list-btn">
                        목록
                    </a>
                </div>
                
                <div class="content-body">

                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>신고번호</label>
                            <div class="detail-info-col2">${report.reportNo}</div>
                            <label>신고 유형</label>
                            <div class="detail-info-col2">${report.typeDetails} 신고</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고일</label>
                            <div class="detail-info-col2">${report.reportDate}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고자</label>
                            <div class="detail-info-col">${report.memberName}</div>
                        </div>
                        <div class="detail-info-row">
                            <label>신고 대상</label>
                            <div class="detail-info-col2">${report.targetName}</div>
                            <label>신고 사유</label>
                            <div class="detail-info-col2">${report.reasonDetails}</div>
                        </div>
                    </div>
                    <div class="detail-info">
                        <div class="detail-info-row">
                            <label>처리여부</label>
                            <div class="detail-info-col2">${report.processYN}</div>
                            <c:if test="${report.processYN.equals('접수')}">
                                <label>결과선택</label>
                                <div class="detail-info-col2">
                                    <form action="/admin/report/process" method="POST">
                                        <select id="resultSelect" name="process">
                                            <option value="suspend">정지</option>
                                            <option value="reject">반려</option>
                                        </select>
                                        <button id="resultBtn" name="resultBtn">확인</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <c:if test="${report.processYN.equals('완료')}">
                        <div class="detail-info">
                            <div class="detail-info-row">
                                <label>처리일</label>
                                <div class="detail-info-col">${report.processDate}</div>
                            </div>
                            <div class="detail-info-row">
                                <label>결과</label>
                                <div class="detail-info-col">${report.resultDetails}</div>
                            </div>
                            <div class="detail-info-row">
                                <label>정지기간</label>
                                <div class="detail-info-col">${report.processDate} - ${report.expireDate}</div>
                            </div>
                        </div>
                    </c:if>
                </div>



            <div class="content-footer">
            </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>