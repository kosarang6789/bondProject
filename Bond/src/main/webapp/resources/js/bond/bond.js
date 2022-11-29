// 양 옆 고정 + 가운데만 스크롤 가능
const leftSide = document.getElementById("info-inner");
const center= document.getElementById("board-list");
const rightSide = document.getElementById("band-photo-area");

const centerWidth = center.offsetWidth;
const leftSideWidth = leftSide.offsetWidth;
const righthideWidth = rightSide.offsetWidth;

window.addEventListener("load", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("resize", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("scroll", function () {

    if (window.scrollX == 0) {
        leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
        rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
    else if (window.scrollX > 0) {
        leftSide.style.left = window.scrollX * -1 + "px";
        rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
});


// 프로필 드롭다운
const myDropdown = document.getElementById("myDropdown");
const icon = document.getElementById("triangle-icon");

function dropDown(){
    myDropdown.classList.toggle("show1");
    icon.classList.toggle("rotate");
};

window.onclick=function(e){
    if(!e.target.matches(".dropbtn, .dropbtn *")){

        if(myDropdown.classList.contains("show1")){
            myDropdown.classList.remove("show1");
            icon.classList.remove("rotate");
        }   
    }
};

// 게시물 무한 스크롤
const option = {
    root: null,
    rootMargin: "0px 0px 0px 0px",
    thredhold: 1,
}

const observer = new IntersectionObserver(selectBoardScroll, option);
const target = document.getElementById("pageTarget");
observer.observe(target);

let flag = true;
function selectBoardScroll(){
    if(cp == 0 ){
        cp++;
    }else{
        if(flag){
            console.log(cp);
            $.ajax({
                url : "/bond/"+ groupNo,
                data : {"cp" : ++cp},
                type : "POST",
                dataType : "JSON",
                success : function(map){
                    if( map != null ){
                        console.log(map.postList);
                        const postWrap = document.querySelector(".post-wrap");
    
                        for(let post of map.postList){

                            const commentDiv = document.createElement("div");
                            commentDiv.classList.add("post-wrap");
                            
                            const contentCard = document.createElement("div");
                            contentCard.classList.add("content-card");
                            
                            // 1. post-list-view
                            const postListView = document.createElement("div");
                            postListView.classList.add("post-list-view");
                            
                            // 2. post-author-view (작성자 프로필, 정보)
                            const postAuthorView = document.createElement("div");
                            postAuthorView.classList.add("post-author-view");
                            
                            // 2-1) uprofile
                            const uprofile = document.createElement("div");
                            uprofile.classList.add("uprofile");
                            
                            // 프로필 이미지
                            const profileImage = document.createElement("img");
                            
                            if(post.memberImage!=null){
                                profileImage.setAttribute("src", post.memberImage);
                            } else {
                                profileImage.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
                            }
                            profileImage.classList.add("uprofile-inner");
                            
                            // 2-2) post-info
                            const postInfo = document.createElement("div");
                            postInfo.classList.add("post-info");
                            
                            // 작성자
                            const boardWriter = document.createElement("strong");
                            boardWriter.classList.add("post-info-name");
                            boardWriter.innerText = post.memberName;
                            
                            // 작성 날짜
                            const postListInfo = document.createElement("div");
                            postListInfo.classList.add("post-list-info");
                            
                            const boardDate = document.createElement("a");
                            boardDate.classList.add("post-info-date");
                            boardDate.innerText = post.postDate;
                            
                            postAuthorView.append(uprofile, postInfo);
                            uprofile.append(profileImage);
                            postInfo.append(boardWriter, postListInfo);
                            postListInfo.append(boardDate);


                            // 3. postBody
                            const postBody = document.createElement("div");
                            postBody.classList.add("post-body");
                            
                            const postText = document.createElement("div");
                            postText.classList.add("post-text");
                            
                            // 게시물 내용
                            const boardContent = document.createElement("p");
                            boardContent.classList.add("text-body");
                            boardContent.innerHTML = post.postContent;
                            
                            const moreLink = document.createElement("a");
                            moreLink.classList.add("more-link");
                            moreLink.innerText = "...더보기";
                            
                            postBody.append(postText);
                            postText.append(boardContent, moreLink);

                            
                            // 4. postCountView
                            const postCountView = document.createElement("div");
                            postCountView.classList.add("post-count-view");

                            // 4-1) postCount
                            const postCount = document.createElement("div");
                            postCount.classList.add("post-count");
                            
                            // 1) face-comment 좋아요
                            const faceComment = document.createElement("span");
                            faceComment.classList.add("face-comment");
                            
                            // (1) emotionView
                            const emotionView = document.createElement("button");
                            emotionView.classList.add("emotion-view");
                            
                            const emotionWrap = document.createElement("span");
                            emotionWrap.classList.add("emotion-wrap");
                            
                            const icon = document.createElement("span");
                            icon.classList.add("icon");
                            
                            const faceIcon = document.createElement("i");
                            faceIcon.classList.add("fa-regular", "fa-face-kiss-wink-heart", "face-icon");
                            
                            const eCount = document.createElement("span");
                            eCount.classList.add("count");
                            
                            // (2) comment
                            const comment = document.createElement("button");
                            comment.classList.add("comment");         
                            comment.innerText = "댓글";

                            const rCount = document.createElement("span");
                            rCount.classList.add("count");
                            
                            // (3) commentToggle
                            const commentToggle = document.createElement("button");
                            commentToggle.classList.add("comment");                   
                            
                            const angleIcon = document.createElement("i");
                            angleIcon.classList.add("fa-solid", "fa-angle-down");
                            
                            // 2) shareRead 댓글
                            const shareRead = document.createElement("span");
                            shareRead.classList.add("share-read");
                            
                            const gSrOnly = document.createElement("span");
                            gSrOnly.classList.add("gSrOnly");
                            
                            const eyeIcon = document.createElement("i");
                            eyeIcon.classList.add("fa-solid", "fa-eye");
                            
                            const vCount = document.createElement("span");
                            vCount.classList.add("count");

                            
                            // 4-2) postAddedBox
                            const postAdded = document.createElement("div");
                            postAdded.classList.add("post-added");
                            
                            
                            const postAddBox = document.createElement("div");
                            postAddBox.classList.add("post-add-box");
                            
                            
                            // (1) addCol1
                            const addCol1 = document.createElement("div");
                            addCol1.classList.add("add-col");
                            
                            
                            const emotionMainBtn = document.createElement("a");
                            emotionMainBtn.classList.add("emotion-main-btn");
                            
                            
                            const iconFaceEmotion = document.createElement("span");
                            iconFaceEmotion.classList.add("icon-face-emotion");
                            
                            
                            const smileIcon = document.createElement("i");
                            smileIcon.classList.add("fa-regular", "fa-face-smile");
                            
                            const postText2 = document.createElement("span");
                            postText2.classList.add("post-text");
                            postText2.innerText = " 좋아요";
                            

                            // (2) addCol2
                            const addCol2 = document.createElement("div");
                            addCol2.classList.add("add-col");
                            
                            
                            const commentMainBtn = document.createElement("a");
                            commentMainBtn.classList.add("comment-main-btn");
                            
                            
                            const comment2 = document.createElement("span");
                            comment2.classList.add("comment");
                            
                            
                            const iconComment = document.createElement("span");
                            iconComment.classList.add("icon-comment");
                            
                            const messageIcon = document.createElement("i");
                            messageIcon.classList.add("fa-regular", "fa-message");
                            
                            const postText3 = document.createElement("span");
                            postText3.classList.add("post-text");
                            postText3.innerText = " 댓글쓰기";
                            
                            postCountView.append(postCount, postAdded);
                            postCount.append(faceComment, shareRead);

                            faceComment.append(emotionView, comment, commentToggle);
                            emotionView.append(emotionWrap, eCount);
                            emotionWrap.append(icon);
                            icon.append(faceIcon);
                            comment.append(rCount);
                            commentToggle.append(angleIcon);

                            shareRead.append(gSrOnly, eyeIcon, vCount);
                            
                            postAdded.append(postAddBox);
                            postAddBox.append(addCol1, addCol2);
                            addCol1.append(emotionMainBtn);
                            emotionMainBtn.append(iconFaceEmotion, postText2);
                            iconFaceEmotion.append(smileIcon);

                            addCol2.append(commentMainBtn);
                            commentMainBtn.append(comment2);
                            comment2.append(iconComment,postText3);
                            iconComment.append(messageIcon);


                            postWrap.append(contentCard);
                            contentCard.append(postListView, postAuthorView, postBody, postCountView);
                            
                        }
                    } else{ // 실패
                        alert("게시물을 불러올 수 없습니다.");
                    }
                },
                error : function(req, status, error){
                    console.log("에러 발생");
                }
            });
            flag = false;

        }else{
            flag = true;
        }
    }
};


// 모달

function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal-closeBtn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        // boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
};

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById("postWrite-btn").addEventListener("click", function() {
    // 모달창 띄우기
    modal('postWrite-modal');
});
