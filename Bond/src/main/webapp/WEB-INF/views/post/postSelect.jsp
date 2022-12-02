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
                    <ul class="moreView-menu">
                        <li>
                            <a href="">글 수정</a>
                        </li> 
                        <li>
                            <a href="">삭제하기</a>
                        </li>
                        <li>
                            <a href="">신고하기</a>
                        </li>
                    </ul>
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
                <div class="likeBtn">
                    <span><i class="fa-regular fa-thumbs-up"></i></span>
                    <span class="likeEmpty"></span>
                    <span>좋아요</span>
                </div>
                <div class="replyBtn">
                    <span><i class="fa-regular fa-comment"></i></span>
                    <span>댓글쓰기</span>
                </div>
            </div>
            
            <!-- 댓글조회 -->
            <section class="replyContent-area">
                <!-- 댓글 한개 -->
                <div class="replyOne">
                    <!-- 댓글 작성자 이미지 -->
                    <div class="replyMember-img">
                        <img src="images/user-icon.png" class="replyMemberImage">
                    </div>
                    <div class="replyContent">
                        <strong class="replyMember-name">김순자</strong>
                        <div class="re-reply-content">댓글 내용들이 쭉 나올거야</div>
                        <div class="reply-info">
                            <span class="replyDate">2022년 10월 29일 오후 11:42</span>
                            <p>•</p>
                            <div class="replyLike">
                                <i class="fa-regular fa-thumbs-up"></i>&nbsp;
                                <p>좋아요</p>&nbsp;
                                <span class="count-replyLike">?</span>
                            </div>
                            <p>•</p>
                            <span>답글쓰기</span>
                        </div>
                    </div>
                    <div class="moreView" id="replymoreView">
                        <label for="post-moreView">
                            <i class="fa-solid fa-ellipsis-vertical"></i>
                        </label>
                        <ul class="moreView-menu">
                            <li>
                                <a href="">글 수정</a>
                            </li> 
                            <li>
                                <a href="">삭제하기</a>
                            </li>
                            <li>
                                <a href="">신고하기</a>
                            </li>
                        </ul>
                    </div>
                </div>
        
                <!-- 덧글 조회 -->
                <section class="re-replyContent-area">
                    <!-- 댓글 한개 -->
                    <div class="replyOne">
                        <!-- 댓글 작성자 이미지 -->
                        <div class="re-replyMember-img">
                            <img src="images/user-icon.png" class="replyMemberImage">
                        </div>
                        <div class="re-replyContent">
                            <strong class="replyMember-name">김순자</strong>
                            <div class="reply-content">댓글 내용들이 쭉 나올거야</div>
                            <div class="reply-info">
                                <span class="replyDate">2022년 10월 29일 오후 11:42</span>
                                <p>•</p>
                                <div class="replyLike">
                                    <i class="fa-regular fa-thumbs-up"></i>&nbsp;
                                    <p>좋아요</p>&nbsp;
                                    <span class="count-replyLike">?</span>
                                </div>
                                <p>•</p>
                                <span>답글쓰기</span>
                            </div>
                        </div>
                        <div class="moreView" id="replymoreView">
                            <label for="post-moreView">
                                <i class="fa-solid fa-ellipsis-vertical"></i>
                            </label>
                        </div>
                    </div>
                    <!-- 댓글 한개 -->
                    <div class="replyOne">
                        <!-- 댓글 작성자 이미지 -->
                        <div class="re-replyMember-img">
                            <img src="images/user-icon.png" class="replyMemberImage">
                        </div>
                        <div class="re-replyContent">
                            <strong class="replyMember-name">김순자</strong>
                            <div class="reply-content">댓글 내용들이 쭉 나올거야</div>
                            <div class="reply-info">
                                <span class="replyDate">2022년 10월 29일 오후 11:42</span>
                                <p>•</p>
                                <div class="replyLike">
                                    <i class="fa-regular fa-thumbs-up"></i>&nbsp;
                                    <p>좋아요</p>&nbsp;
                                    <span class="count-replyLike">?</span>
                                </div>
                                <p>•</p>
                                <span>답글쓰기</span>
                            </div>
                        </div>
                        <div class="moreView" id="replymoreView">
                            <label for="post-moreView">
                                <i class="fa-solid fa-ellipsis-vertical"></i>
                            </label>
                        </div>
                    </div>
                </section>
            </section>
        
            <!-- 댓글 작성 -->
            <div class="replyWrite-toolbar">
                <div class="replyWrite">
                    <div class="replyWrite-img">
                        <img src="images/user-icon.png">
                    </div>
                    <div class="replyWrite-input">
                        <textarea id="replyWrite-Content" cols="20" rows="1" 
                        onkeydown="autoResizeTextarea()" onkeyup="autoResizeTextarea()"
                        placeholder="댓글을 남겨주세요" maxlength="4000"></textarea>
                    </div>
                </div>
                <div class="send-btn">
                    <button>보내기</button>
                </div>
            </div>
        </section>
    </main>
</body>

</html>