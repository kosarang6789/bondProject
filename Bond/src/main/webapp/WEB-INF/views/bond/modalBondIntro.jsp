<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memList" value="${memMap.memList}"/>
<c:set var="myNo" value="${memMap.loginMember.memberNo}"/>
<c:set var="pagination" value="${memMap.pagination}"/>

<body>
    <main>
    <%-- 모달 --%>
        <div class="modalBondIntro" id="modalBondIntro">
			<div class="modalBondIntro">
				<div class="modalBondImg" id="modalBondImg">
					<button type="button" class="modalBondX">
						<i class="fa-solid fa-x" id="modalx"></i>
					</button>
                    <c:choose>
                        <c:when test="${not empty groupInfo.groupImage}">
                            <img src="${groupInfo.groupImage}" id="cover-img">  
                        </c:when>
                        <c:otherwise>
                            <img src="/resources/images/bond/profile/no-profile.png" id="cover-img">
                        </c:otherwise>
                    </c:choose>
				</div>
				<div class="modalBondContent">
					<div class="modalBondName">${groupInfo.groupName}</div>
					<div class="modalBondCount">멤버 ${groupInfo.memberCount}</div>
					<div class="modalBondComment">${groupInfo.groupComment}</div>
				</div>
	
			</div>
        </div>
	</main>
</body>
</html>