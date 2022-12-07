// 양 옆 고정 + 가운데만 스크롤 가능
const leftSide = document.getElementById("info-inner");
const center= document.getElementById("board-list");

const centerWidth = center.offsetWidth;
const leftSideWidth = leftSide.offsetWidth;

window.addEventListener("load", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
});

window.addEventListener("resize", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
});

window.addEventListener("scroll", function () {

    if (window.scrollX == 0) {
        leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    }
    else if (window.scrollX > 0) {
        leftSide.style.left = window.scrollX * -1 + "px";
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
                            postBody.setAttribute("id", post.postNo);

                            postBody.addEventListener("click", ()=>{
                                const modal = document.getElementById("postSelect-modal");
                                modal.classList.toggle("show");
                                document.body.style.overflow = "hidden";
                                document.querySelector("#postSelect-view > main").scrollTop = 0;
                                selectPostNo = postBody.getAttribute("id")
                                selectPostDetail(selectPostNo);
                                selectReplyList(selectPostNo);
                                // 메뉴창 추가
                                if(memberNo == post.memberNo){
                                    const updateMenu = document.createElement("button");
                                    updateMenu.innerText = "글 수정";
                                    updateMenu.setAttribute("onclick", "updatePost("+post.postNo+")");

                                    const deleteMenu = document.createElement("button");
                                    deleteMenu.innerText = "삭제하기";
                                    deleteMenu.setAttribute("onclick", "deletePost("+post.postNo+")");
                                    moreViewMenu.append(updateMenu, deleteMenu);

                                } else {
                                    // const reportMenu = document.createElement("button");
                                    // reportMenu.innerText = "신고하기"
                                    // moreViewMenu.append(reportMenu);
                                }
                            });

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
                            faceIcon.classList.add("fa-regular", "fa-thumbs-up");
                            
                            const eCount = document.createElement("span");
                            eCount.classList.add("count", "eCount");
                            eCount.innerText = "  " + post.likeCount + "  ";
                            
                            // (2) comment
                            const comment = document.createElement("button");
                            comment.classList.add("comment");         
                            comment.innerText = " 댓글 ";
                            
                            const rCount = document.createElement("span");
                            rCount.classList.add("count", "rCount");
                            rCount.innerText = " " + post.replyCount + " ";
                            
                            // 2) shareRead 댓글
                            const shareRead = document.createElement("span");
                            shareRead.classList.add("share-read");
                            
                            const gSrOnly = document.createElement("span");
                            gSrOnly.classList.add("gSrOnly");
                            
                            const eyeIcon = document.createElement("i");
                            eyeIcon.classList.add("fa-solid", "fa-eye");
                            
                            const vCount = document.createElement("span");
                            vCount.classList.add("count","vCount");
                            vCount.innerText = " " + post.postView;
                            
                            postCountView.append(postCount);
                            postCount.append(faceComment, shareRead);

                            faceComment.append(emotionView, comment);
                            emotionView.append(emotionWrap, eCount);
                            emotionWrap.append(icon);
                            icon.append(faceIcon);
                            comment.append(rCount);

                            shareRead.append(gSrOnly, eyeIcon, vCount);

                            postWrap.append(contentCard);
                            contentCard.append(postListView);
                            postListView.append(postAuthorView, postBody, postCountView);
                            
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



// 게시글 상세조회 모달
(()=>{
    const modal = document.getElementById("postSelect-modal");
    const closeBtn = document.querySelector(".sModal-closeBtn");
    const post = document.getElementsByClassName("post-body");

    for(let p of post){
        p.addEventListener("click", ()=>{
            modal.classList.toggle("show");
            document.body.style.overflow = "hidden";
            document.querySelector("#postSelect-view > main").scrollTop = 0;
            selectPostDetail(p.getAttribute("id"));
            selectReplyList(p.getAttribute("id"));
            // 선택된 post의 postNo를 전역변수로 선언
            selectPostNo = p.getAttribute("id");
        });
    }

    closeBtn.addEventListener("click",()=>{
        // modal.classList.toggle("show");
        window.location.reload(true);
        // document.body.style.overflow = "auto";
        // history.scrollRestoration = "auto";
    });

    // if(modal.classList.contains("show")){
    //     window.onclick=function(e){
    //         if(!e.target.matches("#postSelect-section, #postSelect-section *")){
    //             window.location.reload(true);
    //         }
    //     };
    // }

})();

let viewCount = document.getElementById("viewCount");
let commentCount  = document.getElementById("commentCount");
let likeCount = document.getElementById("likeCount");
let postContent = document.getElementById("postContent");
let memberName = document.getElementById("memberName");
let postDate = document.getElementById("postDate");
let profileImg = document.getElementById("profile-img");
const likeBtn = document.getElementById("likeBtn");
const moreViewMenu = document.querySelector(".moreView-menu");

const selectPostDetail = (postNo)=>{
    $.ajax({
        url : "/bond/" + groupNo + "/" + postNo,
        type : "GET",
        dataType : "JSON",
        success : (post)=>{
            console.log("성공");
            console.log(post.postView);
            viewCount.innerText = post.postView;
            commentCount.innerText = post.replyCount;
            likeCount.innerText = post.likeCount;
            postContent.innerHTML = post.postContent;
            memberName.innerText = post.memberName;
            postDate.innerText = post.postDate;
            if(post.memberImage !=null) {
                profileImg.setAttribute("src", post.memberImage);
            }else {
                profileImg.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
            };
            if(post.likeCheck=="on"){
                likeBtn.classList.add('checkLikeBtn');
            }

            // 메뉴창 추가
            if(memberNo == post.memberNo){
                const updateMenu = document.createElement("button");
                updateMenu.innerText = "글 수정";
                updateMenu.addEventListener("click", ()=>{
                    modal('postUpdate-modal', 'postUpdate-iframe');
                    const postUpdateIframe = document.getElementById("postUpdate-iframe");
                    postUpdateIframe.setAttribute("src", "/bond/post/"+post.postNo+"/postUpdate");
                })
                updateMenu.setAttribute("onclick", "modal('postUpdate-modal', 'postUpdate-iframe')");

                const deleteMenu = document.createElement("button");
                deleteMenu.innerText = "삭제하기";
                deleteMenu.setAttribute("onclick", "deletePost("+post.postNo+")");
                moreViewMenu.append(updateMenu, deleteMenu);

            } else {
                const reportMenu = document.createElement("button");
                reportMenu.innerText = "신고하기"
                moreViewMenu.append(reportMenu);
            }

        },
        error:()=>{console.log("실패");}
    });

    likeBtn.addEventListener("click", ()=>{
        let likeCount = document.getElementById("likeCount");

        if(likeBtn.classList.contains('checkLikeBtn')){
            // 좋아요 눌린 경우
            $.ajax({
                url: "/postLikeDown",
                data: {"postNo" : postNo, "memberNo" : memberNo},
                type: "GET",
                success: (result)=>{
                    if(result>0){
                        likeBtn.classList.remove("checkLikeBtn");
                        likeCount.innerText = Number(likeCount.innerText)-1;
                    } else{
                        console.log("감소 실패");
                    }
                },
                error: ()=>{console.log("감소 에러");}
            })
        } else {
            // 좋아요 안눌린 경우
            $.ajax({
                url: "/postLikeUp",
                data: {"postNo" : postNo, "memberNo" : memberNo},
                type: "GET",
                success: (result)=>{
                    if(result>0){
                        likeBtn.classList.add("checkLikeBtn");
                        likeCount.innerText = Number(likeCount.innerText)+1;
                    } else{
                        console.log("증가 실패");
                    }
                },
                error: ()=>{console.log("증가 에러");}
            })
        }
    });

};


// 게시글 상세조회 메뉴
const postmoreView = document.querySelector("[name=moreView]");
postmoreView.addEventListener("click", ()=>{
    moreViewMenu.classList.toggle("showMenu");
});

window.onclick=function(e){
    if(!e.target.matches("[name=moreView]>*")){

        if(moreViewMenu.classList.contains("showMenu")){
            moreViewMenu.classList.toggle("showMenu");
        } 
    }
};


// 댓글쓰기 창 늘리기
const autoResizeTextarea = () => {
    let textarea = document.getElementById("replyWrite-Content")

    textarea.style.height = 'auto';
    let height = textarea.scrollHeight; // 높이
    textarea.style.height = `${height+5}px`;
    
};

// 댓글 조회
const selectReplyList=(postNo)=>{
    $.ajax({
        url: "/reply/list",
        data: {"postNo" : postNo},
        type: "GET",
        dataType: "JSON",
        success: (rList)=>{
            console.log(rList);

            if(rList.length!=0){

                const replyList = document.getElementById("replyList"); // ul
                replyList.innerHTML = "";
    
                for(let reply of rList){
                    // 행
                    const replyOne = document.createElement("li");
                    replyOne.classList.add("replyOne");
    
                    // 작성자 이미지
                    const replyMemberImg = document.createElement("img");
                    replyMemberImg.classList.add("replyMember-img");
                    if(reply.memberImage!=null){
                        replyMemberImg.setAttribute("src", reply.memberImage);
                    } else{
                        replyMemberImg.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
                    }
                    
                    // 댓글 텍스트 부분
                    const replyText = document.createElement("div");
                    replyText.classList.add("reply-text");
    
                    replyOne.append(replyMemberImg, replyText);
    
                    // 작성자 닉네임
                    const replyMemberName = document.createElement("strong");
                    replyMemberName.classList.add("replyMember-name");
                    replyMemberName.innerText = reply.memberName;
    
                    // 댓글 내용
                    const replyContent = document.createElement("p");
                    replyContent.classList.add("reply-content");
                    replyContent.innerHTML = reply.replyContent;
    
                    // 답글일 경우 child 속성 추가
                    if(reply.parentNo!=0) {
                        replyOne.classList.add("child-comment");
                        replyMemberImg.classList.add("child-img");
                        replyContent.classList.add("child-content");
                    }
    
                    // 댓글 정보
                    const replyInfo = document.createElement("div");
                    replyInfo.classList.add("reply-info");
    
                    replyText.append(replyMemberName, replyContent, replyInfo);
    
                    // 답글 버튼
                    const replyBtn = document.createElement("div");
                    replyBtn.classList.add("reply-btn");
    
                    const replyDate = document.createElement("p");
                    replyDate.classList.add("replyDate");
                    replyDate.innerText = reply.replyDate;

                    replyBtn.append(replyDate);
                    
                    if(reply.replyDelYN == 'N'){
                        const childReplyBtn = document.createElement("button");
                        
                        childReplyBtn.setAttribute("onclick", "showInsertReply("+reply.replyNo+", this)");
                        childReplyBtn.innerText="•답글쓰기";
        
                        // 신고버튼
                        const reportBtn = document.createElement("button");
                        // reportBtn.setAttribute("onclick", )
                        reportBtn.innerText="•신고";
                        replyBtn.append(childReplyBtn, reportBtn);
                    }

                    // 수정/삭제버튼
                    const writerBtn = document.createElement("div");
    
                    if(memberNo == reply.memberNo && reply.replyDelYN == 'N'){
                        const updateBtn = document.createElement("button");
                        updateBtn.innerText = "수정 | ";
                        
                        updateBtn.setAttribute("onclick", "showUpdateReply("+reply.replyNo+", this)");
                        
                        const deleteBtn = document.createElement("button");
                        deleteBtn.innerHTML = "&nbsp;삭제";
                        
                        deleteBtn.setAttribute("onclick", "deleteReply("+reply.replyNo+",this)");
                        
                        writerBtn.append(updateBtn, deleteBtn);
                    }
                    replyInfo.append(replyBtn, writerBtn);
                    replyList.append(replyOne);
                }
                replyList.classList.remove("firstReply-inform")
            } else {
                replyList.innerText = "작성된 댓글이 없습니다";
                replyList.classList.add("firstReply-inform");
            }
        },
        error : (req, status, error)=>{
            console.log("에러 발생");
            console.log(req.responseText);
        }
    })
};



// 멤버 초대하기 - 본드 주소 복사
const href = location.href.toString();
const reAddress = href.substring(0, href.lastIndexOf("/"));

document.querySelector(".share").addEventListener("click", ()=>{
    const copyAdd = document.createElement("textarea");
    document.body.append(copyAdd);
    copyAdd.textContent = href;
    copyAdd.select();
    document.execCommand('copy');
    copyAdd.remove();
    alert("주소가 복사되었습니다.");
});

