<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>


    <%-- 모달 --%>
        <div class="modalMemPro" id="modalMemPro">
            <div class="profile1" id="modalProfile">
                <button type="button" class="clickProfile close-btn modalx">
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
    


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</body>
</html>