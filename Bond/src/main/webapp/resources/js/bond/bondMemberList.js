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


// 무한스크롤

const option = {
    root: null,
    rootMargind: "0px 0px 0px 0px",
    thredhold: 1
}

const observer = new IntersectionObserver(selectBoardScroll, option);
const target = document.getElementById("pageTarget");
observer.observe(target);

let flag = true;
function selectBoardScroll (){
    if(cp==0){ cp++; }
    else{
        if(flag){
            console.log(cp);
            $.ajax({
                url : "/bond/"+groupNo+"/bondMemberList/scroll",
                data : {"cp":++cp},
                type : "POST",
                dataType : "JSON",
                success : function(memMap){
                    if(memMap != null){
                        console.log(memMap);
                        
                        const memberAll = document.querySelector(".member-all");
                        
                        for(let mem of memMap.memList){
                            if(myNo != mem.memberNo){
    
                                const members = document.createElement("div");
                                members.classList.add("member-list");
                                
                                const memberImage = document.createElement("div");
                                memberImage.classList.add("member-image");
                                memberImage.setAttribute("id", mem.memberNo);
                                memberImage.addEventListener("click",()=>{
                                    modal.classList.remove("hidden");
                                    modal.classList.add("show");
                                    selectMemPro(memberImage.getAttribute("id"));
                                })
    
                                const image = document.createElement("img");
                                if(mem.memberImage!=null){
                                    image.setAttribute("src", mem.memberImage);
                                    image.classList.add("memImg");
                                } else {
                                    image.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
                                    image.classList.add("memImg");
                                }
    
                                const memberName = document.createElement("div");
                                memberName.classList.add("member-name");
                                memberName.innerText=mem.memberName;
    
                                const memberReport = document.createElement("div");
                                memberReport.classList.add("member-report");
                                memberReport.setAttribute("id", mem.memberNo);
    
                                const userSlash = document.createElement("i");
                                userSlash.classList.add("userSlash");
                                userSlash.classList.add("fa-solid");
                                userSlash.classList.add("fa-user-slash");
    
                                memberAll.append(members);
                                members.append(memberImage, memberName, memberReport);
                                memberImage.append(image);
                                memberReport.append(userSlash);
                            }

                            const reportMemList = document.getElementsByClassName("member-report");

                            // 무한 스크롤에서 신고하기 이벤트줌.
                            for(let rm of reportMemList){
                                rm.addEventListener("click", ()=>{
                                    let memberNo = rm.getAttribute("id");
                                    
                                    const url = "/report/member/" + memberNo; 
                                    open(url, "신고하기", "width=500px, height=600px")
                                })
                            }
                        }
                        
                    }else{
                        alert("멤버가 없습니다.");
                    }
                },
                error : function(req, status, error){
                    alert("ajax 통신 오류");
                }
            }); flag = false;
        }else{
            flag = true;
        }
    }
} ;


// 멤버 초대하기 - 본드 주소 복사
const href = location.href.toString();
const reAddress = href.substring(0, href.lastIndexOf("/"));

document.querySelector(".inviteBtn").addEventListener("click", ()=>{
    const copyAdd = document.createElement("textarea");
    document.body.append(copyAdd);
    copyAdd.textContent = reAddress;
    copyAdd.select();
    document.execCommand('copy');
    copyAdd.remove();
    alert("주소가 복사되었습니다.");
});

// ---------회원 정보 모달 창------------


let image = document.getElementsByClassName("memImg");
const modal = document.getElementById("modal");
const modalx = document.getElementById("modalx");
let mmm = document.getElementsByClassName("member-image");

modalx.addEventListener("click",()=>{
    modal.classList.remove("show");
    modal.classList.add("hidden");
});

const modalImg = document.getElementById("image");
const modalName = document.getElementById("modalName");
const modalLeader = document.getElementById("modalLeader");
const modalJoinDate = document.getElementById("modalJoinDate");
const modalBirth = document.getElementById("modalBirth");
const modalReport = document.querySelector(".reportBtn");


// 멤버 이미지 불러와 for문 안에 넣어 id값 얻고 모달창 띄움
for(let m of mmm){
    m.addEventListener("click", ()=>{
        modal.classList.remove("hidden");
        modal.classList.add("show");
        selectMemPro(m.getAttribute("id"));
        
    });
};

// 내가 아닐 때
const modalBtn1 = document.createElement("button");
modalBtn1.classList.add("report");
const modalBtn2 = document.createElement("button");
modalBtn2.classList.add("chatting");

const modalNMe = document.createElement("div");

modalNMe.classList.add("report");
const modalIcon = document.createElement("i");
modalIcon.classList.add("fa-solid");
modalIcon.classList.add("fa-user-slash");
modalIcon.classList.add("memberReport");
modalIcon.innerText = "신고하기";

const modalChat = document.createElement("a");
const modalChatI = document.createElement("i");
modalChatI.classList.add("fa-solid");
modalChatI.classList.add("fa-comment-dots");
modalChatI.classList.add("chat-icon");
modalChatI.classList.add("chattingIcon");
modalChatI.innerText = "채팅하기";


// 나 일때
const modalA = document.createElement("a");
modalA.setAttribute("href", "/myPage/myPage");

const modalMe = document.createElement("div");
modalMe.classList.add("report");
const modalMyI = document.createElement("i");
modalMyI.classList.add("fa-solid");
modalMyI.classList.add("fa-gear");
modalMyI.classList.add("sidbar-icon");
modalMyI.innerText="내 정보 수정";


// 프로필 부분
const modalImgarea = document.getElementById("modalImgarea");
const ii = document.createElement("img");
ii.classList.add("image");
modalImgarea.append(ii);
const modalProfile = document.getElementById("modalProfile");

const selectMemPro = (memberNo) =>{
    $.ajax({
        url : "/bond/bondMemberList/" + memberNo,
        dataType : "JSON",
        success : (memPro)=>{
            console.log(memPro.memberName);

            if(memPro.memberImage !=null) {
                ii.setAttribute("src", memPro.memberImage);
                modalImgarea;
            }else {
                ii.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
                modalImgarea;
            };

            modalName.innerText = memPro.memberName;

            if(memPro.leaderYN == 'N'){
                modalLeader.innerText="멤버";
            }else{
                modalLeader.innerText="리더";
            };

            modalJoinDate.innerText= "since" + memPro.joinDate;

            modalBirth.innerText = memPro.memberBirth;

            modalReport.innerHTML="";
            if(myNo != memPro.memberNo){
                modalReport.append(modalBtn1, modalBtn2);
                // modalReport.setAttribute("id", memPro.memberNo);
                modalBtn1.append(modalIcon);
                modalBtn1.setAttribute("id", memPro.memberNo);
                modalBtn2.append(modalChat);
                modalChat.append(modalChatI);
            }else{
                modalReport.append(modalA);
                modalA.append(modalMyI);
                // modalReport.setAttribute("id", myNo);
            }

        },
        error : ()=>{
            console.log("ajax 통신 실패ㅠㅜㅠㅜ");
        }
    })
};

window.addEventListener("click", e=>{
    let ev = e.target;

    if(ev.classList.contains("show")){
        modal.classList.remove("show");
        modal.classList.add("hidden");
    }
})


// 밴드 신고
// 신고하기 버튼
const reportBtn = document.getElementById("reportBtn");

// 신고 버튼 클릭 시 팝업창
reportBtn.addEventListener("click", () => {
    const url = "/report/group/" + groupNo; 
    open(url, "신고하기", "width=500px, height=600px")
});


// 멤버 신고
// 멤버 리스트 신고(무한 스크롤 신고하기는 무한 스크롤 부분에서 작성함.)
const reportMemList = document.getElementsByClassName("member-report");

for(let rm of reportMemList){
    rm.addEventListener("click", ()=>{
        let memberNo = rm.getAttribute("id");
        
        const url = "/report/member/" + memberNo; 
        open(url, "신고하기", "width=500px, height=600px")
    })
};
// 모달 창에서 신고
let memberNo;
if(modal.classList.contains("show")){
    // const modalReportList = document.getElementsByClassName("report");
    
    // for(let mr of modalReportList){
    //     mr.addEventListener("click", ()=>{
    //         let memberNo = mr.getAttribute("id");
                    
    //         const url = "/report/member/" + memberNo; 
    //         open(url, "신고하기", "width=500px, height=600px")
    //     })
    // }

    // let memberNo = modalReport.getAttribute("id");
    // // 신고하기 버튼

    // // 신고 버튼 클릭 시 팝업창
    // modalBtn1.addEventListener("click", () => {
    //     const url = "/report/member/" + memberNo; 
    //     open(url, "신고하기", "width=500px, height=600px")
    // });
    
    memberNo = modalBtn1.getAttribute("id");
}
console.log(memberNo);
// 신고하기 버튼
// let memberNo;

// 신고 버튼 클릭 시 팝업창
modalBtn1.addEventListener("click", () => {
    const url = "/report/member/" + memberNo; 
    open(url, "신고하기", "width=500px, height=600px")
});