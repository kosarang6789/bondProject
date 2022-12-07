<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/resources/css/post/postSelect.css">

    <script src="https://kit.fontawesome.com/785870d879.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

</head>

<body>
    <main>
        <section id="postSelect-section">
        
            <!-- 작성자 정보 -->
            <div class="postMemberAll">
                <!-- 작성자 사진 -->
                <div class="postMember-img">
                    <img src="" class="memberImage" name="profile-img" id="profile-img">
                </div>
                <!-- 작성자 이름, 게시일, 조회수 -->
                <div class="postMember">
                    <div class="postMember-name" name="member" id="memberName"></div>
                    <div class="postDate-read">
                        <span class="postDate" name="post" id="postDate"></span>
                        <span class="read"  name="post" id="postView"> | 
                            <span id="viewCount"></span>
                        읽음</span>
                    </div>
                </div>
                <!-- 더보기 -->
                <div class="moreView" id="postmoreView">
                    <label for="post-moreView-icon" name="moreView" >
                        <i class="fa-solid fa-ellipsis-vertical"></i>
                    </label>
                    <div class="moreView-menu">
                    </div>
                </div>
            </div>

            <!-- 게시글 내용 -->
            <div class="post-content" name="post">
                <pre id="postContent"></pre>
            </div>

            <!-- 댓글, 좋아요 수 -->
            <div class="countLR">
                <span>댓글
                    <span id="commentCount"></span>
                </span>
                <span>좋아요
                    <span id="likeCount"></span>
                </span>
            </div>
            
            <!-- 좋아요, 댓글쓰기 클릭 -->
            <div class="like-replyBtn">
                <div id="likeBtn">
                    <span><i class="fa-regular fa-thumbs-up"></i></span>
                    <span>좋아요</span>
                </div>
                <div id="replyBtn">
                    <span><i class="fa-regular fa-comment"></i></span>
                    <span>댓글쓰기</span>
                </div>
            </div>
            
            <!-- 댓글조회 -->
            <ul id="replyList">
            </ul>
            <%-- <div class="reply-area"> --%>
            <%-- </div> --%>
                <%-- <li class="replyOne">
                    <!-- 댓글 작성자 이미지 -->
                    <img src="/resources/images/member/profile/defaultProfile.png" class="replyMember-img">
                    <div class="reply-text">
                        <strong class="replyMember-name">김순자</strong>
                        <p class="reply-content">
                            [0] 댓글 내용들
                            [1] update-textarea
                            [2] btnarea - 수정, 취소
                        </p>
                        <div class="reply-info">
                            <div class="reply-btn">
                                <p class="replyDate">2022년 10월 29일 오후 11:42</p>
                                <button>•답글쓰기</button>
                                <button>•신고</button>
                            </div>
                            <div class="writer-btn">
                                <button>수정 |</button>
                                <button>삭제</button>
                            </div>
                        </div>
                    </div>
                </li>--%>
        
            <!-- 댓글 작성 -->
            <div class="replyWrite-toolbar">
                <div class="replyWrite">
                    <div class="replyWrite-img">
                        <c:if test="${empty loginMember.profileImage}">
                            <%-- 프로필 이미지가 없을 경우 --%>
                            <img class="uprofile-inner" 
                            src="/resources/images/member/profile/defaultProfile.png" />
                        </c:if>
                        <c:if test="${!empty loginMember.profileImage}">
                            <%-- 프로필 이미지가 있을 경우 --%>
                            <img class="uprofile-inner" src="${loginMember.profileImage}"/>
                        </c:if>
                        <%-- <img src="/resources/images/member/profile/defaultProfile.png"> --%>

                    </div>
                    <div class="replyWrite-input">
                        <textarea id="replyWrite-Content" cols="20" rows="1" 
                        onkeydown="autoResizeTextarea()" onkeyup="autoResizeTextarea()"
                        placeholder="댓글을 남겨주세요" maxlength="4000"></textarea>
                    </div>
                </div>
                <div class="send-btn">
                    <button id="addReply">보내기</button>
                </div>
            </div>
        </section>
    </main>

    <script src="/resources/js/post/postSelect.js"></script>
</body>

</html>