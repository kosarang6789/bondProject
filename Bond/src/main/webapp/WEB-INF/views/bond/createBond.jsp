<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본드 만들기 | BOND</title>

    <link rel="stylesheet" href="/resources/css/bond/createBond.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<body>
    <section class="header-area">
        <header>
            <div>
                <!-- 클릭 시 메인으로 이동하는 로고  -->
                <a href="/member/mainPage">
                    <img src="/resources/images/bond/home-logo-white.png" id="home-logo">
                </a>
            </div>

            <div class="header-widget-area">
                <ul class="widget-list">
                    <li class="widget-item bell-icon">
                        <!-- 알림 -->
                        <a href="#">
                            <i class="fa-solid fa-bell bell-icon"  style="color: #999;"></i>
                        </a>
                    </li>

                    <li class="widget-item chat-icon">
                        <!-- 채팅 -->
                        <a href="#">
                            <i class="fa-solid fa-comment-dots chat-icon" style="color: #999;"></i>
                        </a>
                    </li>

                    <li class="widget-item">
                        <!-- 내 정보 사진 -->
                        <div class="dropdown">
                            <button type="button" class="dropbtn" onclick="dropDown()">
                                <span>
                                    <img src="/resources/images/common/user-icon.png" id="profile-photo">
                                </span>
                                <i class="fa-solid fa-caret-down caret-icon" id="triangle-icon"></i>
                            </button> 
                            
                            <div id="myDropdown" class="dropdown-content">
                                <a href="#">내정보</a>
                                <a href="/logout">로그아웃</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
    </section>

    <main>
        <section class="create-band">
            <form action="/bond-create" method="POST" enctype="multipart/form-data"
            class="create-bond" id="createForm">
                <fieldset>
                    <div class="bandInfo">

                        <h4>본드 이름</h4>

                        <div class="bandName">
                            <input type="text" name="groupName" placeholder="본드 이름 입력" maxlength="50" id="bondName">
                        </div>

                        <div class="select-bandInfo">
                            <%-- 본드 사진 --%>
                            <div class="bandImage">
                                <label for="bandImage-input">
                                    <img id="select-photo" src="/resources/images/bond/profile/select-photo.jpg">
                                </label>
                                <input type="file" class="inputImage" name="groupImage" id="bandImage-input" accept="image/*">
                                <span id="delete-image">&times;</span>
                            </div>
                            
                            <div class="bandCategory">
                                <p>본드 카테고리 선택</p>
                                <div class="select-category">
                                    <ul>
                                        <li>
                                            <input type="radio" id="excercise" class="category-list" name="topicCode" value=1>
                                            <label for="excercise">
                                                <i class="fa-solid fa-dumbbell"></i>
                                            운동</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="craft" class="category-list" name="topicCode" value=2>
                                            <label for="craft">
                                                <i class="fa-solid fa-democrat"></i>
                                            공예</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="game" class="category-list" name="topicCode" value=3>
                                            <label for="game">
                                                <i class="fa-solid fa-gamepad"></i>
                                            게임</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="art" class="category-list" name="topicCode" value=4>
                                            <label for="art">
                                                <i class="fa-solid fa-palette"></i>
                                            문화/예술</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="self-imp" class="category-list" name="topicCode" value=5>
                                            <label for="self-imp">
                                                <i class="fa-solid fa-book"></i>
                                            자기개발</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="camping" class="category-list" name="topicCode" value=6>
                                            <label for="camping">
                                                <i class="fa-solid fa-campground"></i>
                                            여행/캠핑</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="photo" class="category-list" name="topicCode" value=7>
                                            <label for="photo">
                                                <i class="fa-solid fa-photo-film"></i>
                                            사진</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="farming" class="category-list" name="topicCode" value=8>
                                            <label for="farming">
                                                <i class="fa-solid fa-wheat-awn"></i>
                                            농예</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="cook" class="category-list" name="topicCode" value=9>
                                            <label for="cook">
                                                <i class="fa-solid fa-kitchen-set"></i>
                                            요리</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="interior" class="category-list" name="topicCode" value=10>
                                            <label for="interior">
                                                <i class="fa-solid fa-paint-roller"></i>
                                            인테리어</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="fan" class="category-list" name="topicCode" value=11>                                               
                                            <label for="fan">
                                                <i class="fa-solid fa-face-grin-hearts"></i>
                                            팬클럽</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="economy" class="category-list" name="topicCode" value=12>
                                            <label for="economy">
                                                <i class="fa-solid fa-comments-dollar"></i>
                                            경제</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span>본드이름과 사진은 개설 후에도 변경할 수 있어요</span>
                    
                    <div class="bandOpen">
                        <h4>본드 공개</h4>
                        <div class="openType-area">
                            <ul>
                                <li class="typeList">
                                    <label for="secret">
                                        <input type="radio" id="secret" name="openYN" value="N">
                                        <span class="check-label">
                                            <span class="check-icon">
                                                <i class="fa-solid fa-check"></i>
                                            </span>
                                            <span class="check-text">
                                                <strong>비공개 본드</strong>
                                                <p>누구나 본드를 검색으로 찾아 밴드 소개를 볼 수 있지만,<br> 
                                                    게시글은 멤버만 볼 수 있습니다.</p>
                                            </span>
                                        </span>
                                    </label>
                                </li>
                                
                                <li class="typeList">
                                    <label for="open">
                                        <input type="radio" id="open" name="openYN" value="Y">
                                        <span class="check-label">
                                            <span class="check-icon">
                                                <i class="fa-solid fa-check"></i>
                                            </span>
                                            <span class="check-text">
                                                <strong>공개 본드</strong>
                                                <p>누구나 관심있는 본드를 검색해 찾을 수 있고,<br>
                                                    본드 소개와 게시글을 볼 수 있습니다.</p>
                                            </span>
                                        </span>
                                    </label>
                                </li>
                            </ul>
                        </div>
            
                    </div>
                    
                    <!-- 취소시 메인페이지로 다시 돌아가기 -->
                    <div class="create-btn">
                        <button type="reset">취소</button>
                        <button type="submit">완료</button>
                    </div>
                </fieldset>
            </form>
        </section>
    </main>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>
        <%-- message 1회 출력 후 모든 scope에서 message 삭제 --%>
        <c:remove var="message" />
    </c:if>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    
    <script src="/resources/js/bond/createBond.js"></script>

</body>
</html>