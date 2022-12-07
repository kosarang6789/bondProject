<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memList" value="${memMap.memList}"/>
<c:set var="myNo" value="${memMap.loginMember.memberNo}"/>
<c:set var="pagination" value="${memMap.pagination}"/>

<body>
    <main>
        <%-- 모달 --%>
        <div class="modal" id="modal">
            <div class="profile1" id="modalProfile">
                <button type="button" class="clickProfile close-btn">
                    <i class="fa-solid fa-x" id="modalx"></i>
                </button>
                <section class="profile-area">

                    <div class="profile-image" id="modalImgarea">
                    </div>
            
                    <h3 class="memberName" name="memberName" id="modalName"></h3>
                    <section class="member">
                        <div class="leader-yn">
                            <div class="profile-member" id="modalLeader">멤버</div>
                        </div>
                        <div class="join-date" id="modalJoinDate"></div>
                    </section>
            
                    <div class="birth">
                        <div class="birth-title">생일 : </div>
                        <div class="memberBirth" id="modalBirth">
                        </div>
                    </div>
                    <div class="reportBtn"></div>
                </section>
            </div>
        </div>
    </main>
</body>
</html>