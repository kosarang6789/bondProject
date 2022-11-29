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

    <link rel="stylesheet" href="/resources/css/admin/layout/layout-list-style.css">
    <link rel="stylesheet" href="/resources/css/admin/report-list-style.css">
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
                    <h6>신고 관리</h6>
                    <h3>신고 조회</h3>
                </div>
                
				<div id="searchbar">
				
				    <select name="opt" id="opt">
				        <option value="0">번호</option>
				        <option value="1" selected>회원</option>
				        <option value="2">모임</option>
				        <option value="3">게시글</option>
				    </select>
				
				    <div class="keyword-box">
				        <div class="input-box"><input type="text" name="keyword" id="keyword"></div>
				        <button class="btn" id="selectBtn">검색</button>
				    </div>
				
				    <select name="count" id="count">
				        <option value="10" selected>10개</option>
				        <option value="20">20개</option>
				        <option value="50">50개</option>
				    </select>
				
				</div> <!-- end .searchbar -->

                <div class="content-body">
                    
                    <div class="list-header">
                        <span class="reportNo">번호</span>
                        <span class="typeDetails">유형</span>
                        <span class="memberName">신고자</span>
                        <span class="targetName">신고대상</span>
                        <span class="reportDate">신고일</span>
                        <span class="processYN">처리여부</span>
                        <span class="processDate">처리일</span>
                    </div>
					
					<!-- 목록 불러오기 반복문 -->
                    <!-- <c:forEach var="report" items="${reportList}">
                    <form action="/printReportList" class="list-frm" method="GET">
                        <button class="list-btn">
                            <span class="reportNo">${report.reportNo}</span>
                            <span class="reportType">${report.reportType}</span>
                            <span class="memberName">${report.memberName}</span>
                            <span class="targetName">${report.targetName}</span>
                            <span class="reportDate">${report.reportDate}</span>
                            <span class="processYN">${report.processYN}</span>
                            <span class="processDate">${report.processDate}</span>
                        </button>
                    </form>
					</c:forEach> -->
					
                    <div class="list-body">
                        <%-- ajax로 검색한 목록이 들어갈 영역 --%>
                    </div>

                </div>

                <div class="content-footer">
                </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- jQuery CDN 방식으로 추가 --%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	
    <script src="/resources/js/admin/reportList.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>