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

    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/layout/layout-statistic-style.css">
    <link rel="stylesheet" href="/resources/css/admin/statistic-style.css">
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
                    <h3>통계</h3>
                </div>

                <div class="content-body">
                        <div id="liveData" class="dataBox">
                            <div class="title">전체 통계</div>
                            <div id="totalMembers" class="numberBox">
                                <div class="subtitle">회원</div>
                                <div class="subbox">
                                    <span id="totalMembersNumbers" class="numbers">0</span>
                                    <span class="unit">명</span>
                                </div>
                            </div>
                            <div id="totalGroups" class="numberBox">
                                <div class="subtitle">모임</div>  
                                <div class="subbox">                             
                                    <span id="totalGroupsNumbers" class="numbers">0</span>
                                    <span class="unit">모임</span>
                                </div>
                            </div>
                            <div id="totalPosts" class="numberBox">
                                <div class="subtitle">게시글</div>
                                <div class="subbox">
                                    <span id="totalPostsNumbers" class="numbers">0</span>
                                    <span class="unit">개</span>
                                </div>
                            </div>
                        </div>

                        <div id="todayData" class="dataBox">
                            <div class="title">일일 통계</div>
                            <div id="todayMember" class="numberBox">
                                <div class="subtitle">회원</div>
                                <div class="subbox">
                                    <span id="todayMembersNumbers" class="numbers">0</span>
                                    <span class="unit">명</span>
                                </div>
                            </div>
                            <div id="todayGroup" class="numberBox">
                                <div class="subtitle">모임</div>
                                <div class="subbox">
                                    <span id="todayGroupsNumbers" class="numbers">0</span>
                                    <span class="unit">모임</span>
                                </div>
                            </div>
                            <div id="todayPost" class="numberBox">
                                <div class="subtitle">게시글</div>
                                <div class="subbox">
                                    <span id="todayPostsNumbers" class="numbers">0</span>
                                    <span class="unit">개</span>
                                </div>
                            </div>
                        </div>

                        <div id="groupTopicData" class="chartBox">
                            <div class="title">모임 카테고리 비율</div>
                            <canvas id="doughnut" class="chart"></canvas>
                                <!-- 도넛차트 자리 -->
                            <div class="indicatorsBox">

                                <div id="hotTopic" class="indicators">
                                    <div class="subtitle">인기주제</div>
                                    <div class="subbox">
                                        <span id="hotUnit" class="unit">국어</span>
                                        <span id="hotNumber" class="numbers">0</span>
                                    </div>
                                </div>
                                <div id="coldTopic" class="indicators">
                                    <div class="subtitle">비인기주제</div>
                                    <div class="subbox">
                                        <span id="coldUnit" class="unit">영어</span>
                                        <span id="coldNumber" class="numbers">0</span>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div id="weeklyMembers" class="chartBox">
                            <div class="title">주간 회원 통계</div>
                            <div>
                                <!-- 바 차트 자리 -->
                                <canvas id="bar" class="chart"></canvas>
                            </div>

                            <div class="indicatorsBox">

                                <div id="signUpCount" class="indicators">
                                    <div class="subtitle">가입수</div>
                                    <div class="subbox">
                                        <span id="signUpCountNumber" class="numbers">0</span>
                                        <span id="signUpUnit" class="unit">명</span>
                                    </div>
                                </div>
                                <div id="secessionCount" class="indicators">
                                    <div class="subtitle">탈퇴수</div>
                                    <div class="subbox">
                                        <span id="delCountNumber" class="numbers">0</span>
                                        <span id="delUnit" class="unit">명</span>
                                    </div>
                                </div>

                            </div>

                        </div>


                        <div id="weeklyPosts" class="chartBox">
                            <div class="title">주간 게시글 통계</div>
                            <%-- 차트 자리  --%>
                            <canvas id="line" class="chart"></canvas>
                        </div>

                </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>
        
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    
    
    <script src="/resources/js/admin/statistic.js"></script>
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>