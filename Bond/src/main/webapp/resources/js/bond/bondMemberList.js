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
                                members.setAttribute("id", mem.memberNo);
                                members.addEventListener("click",()=>{
                                    modal.style.display="flex";
                                    selectMemPro(members.getAttribute("id"));
                                })
    
                                const memberImage = document.createElement("div");
                                memberImage.classList.add("member-image");
    
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
    
                                const userSlash = document.createElement("i");
                                userSlash.classList.add("userSlash");
                                userSlash.classList.add("fa-solid");
                                userSlash.classList.add("fa-user-slash");
    
                                memberAll.append(members);
                                members.append(memberImage, memberName, memberReport);
                                memberImage.append(image);
                                memberReport.append(userSlash);
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
let mm = document.getElementsByClassName("member-list");
const modal = document.getElementById("modal");
const modalx = document.getElementById("modalx");

modalx.addEventListener("click",()=>{
    modal.style.display="none";
});

const modalImg = document.getElementById("image");
const modalName = document.getElementById("modalName");
const modalLeader = document.getElementById("modalLeader");
const modalJoinDate = document.getElementById("modalJoinDate");
const modalBirth = document.getElementById("modalBirth");
const modalReport = document.getElementById("modalReport");


for(let m of mm){
    m.addEventListener("click", ()=>{
        modal.style.display="flex";
        selectMemPro(m.getAttribute("id"));
    });
};

// 내가 아닐 때
const modalBtn = document.createElement("button");
modalBtn.classList.add("report");

const modalNMe = document.createElement("div");
modalNMe.classList.add("report");
const modalIcon = document.createElement("i");
modalIcon.classList.add("fa-solid");
modalIcon.classList.add("fa-user-slash");
modalIcon.innerText = "신고하기";

modalNMe.append(modalBtn);
modalBtn.append(modalIcon);

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

modalMe.append(modalA);
modalA.append(modalMyI);

// 프로필 부분
const modalImgarea = document.getElementById("modalImgarea");
const ii = document.createElement("img");
ii.classList.add("image");
modalImgarea.append(ii);

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

            const modalProfile = document.getElementById("modalProfile");
            if(myNo != memPro.memberNo){
                modalProfile.append(modalNMe);
                modalMe.remove();
            }else{
                modalProfile.append(modalMe);
                modalNMe.remove();
            }

        },
        error : ()=>{
            console.log("ajax 통신 실패ㅠㅜㅠㅜ");
        }
    })
}
