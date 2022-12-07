// ---------회원 정보 모달 창------------

// 밴드 게시글의 프로필 이미지 모달
// if(document.querySelector(".uprofile") != null){
    let images = document.getElementsByClassName("uprofile");

    // 멤버 이미지 불러와 for문 안에 넣어 id값 얻고 모달창 띄움
    for(let m of images){
        m.addEventListener("click", ()=>{
            modalMemPro.classList.add("show");
            modalMemPro.classList.remove("hidden");
            selectMemPro(m.getAttribute("id"));
            
        });
    };
// }

// // 밴드 게시글 상세조회 프로필 이미지 모달
// if(document.querySelector(".postMember-img") != null){
//     let images = document.getElementsByClassName("uprofile");

//     // 멤버 이미지 불러와 for문 안에 넣어 id값 얻고 모달창 띄움
//     for(let m of images){
//         m.addEventListener("click", ()=>{
//             modalMemPro.classList.add("show");
//             modalMemPro.classList.remove("hidden");
//             selectMemPro(m.getAttribute("id"));
            
//         });
//     };
// }

const modalMemPro = document.querySelector(".modalMemPro");
const modalx = document.querySelector(".modalx");



modalx.addEventListener("click",()=>{
    modalMemPro.classList.remove("show");
    modalMemPro.classList.add("hidden");
});

// const modalImg = document.getElementById("image");
const modalName = document.getElementById("modalName");
const modalLeader = document.getElementById("modalLeader");
const modalJoinDate = document.getElementById("modalJoinDate");
const modalBirth = document.getElementById("modalBirth");
const modalReport = document.querySelector(".reportBtn");

// 내가 아닐 때
const modalBtn1 = document.createElement("button");
modalBtn1.classList.add("report");

const modalNMe = document.createElement("div");

modalNMe.classList.add("report");
// 회원이 회원 신고
const modalIcon = document.createElement("i");
modalIcon.classList.add("fa-solid");
modalIcon.classList.add("fa-user-slash");
modalIcon.classList.add("memberReport");
modalIcon.innerText = "신고하기";
// 리더가 회원 탈퇴
const modalIconG = document.createElement("i");
modalIconG.classList.add("fa-solid");
modalIconG.classList.add("fa-user-slash");
modalIconG.classList.add("memberReport");
modalIconG.innerText = "탈퇴시키기";


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

const selectMemPro = (memNo) =>{
    $.ajax({
        url : "/bond/bondMemberList/" + memNo,
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

            if(memberNo == memPro.leaderNo){ // 내가 리더인 경우
                if(memberNo != memPro.memberNo){ /* 회원 */
                    modalReport.append(modalBtn1);
                    modalBtn1.append(modalIconG);
                    modalBtn1.setAttribute("id", memPro.memberNo);

                    let memberNo2 = memPro.memberNo;

                    // 모달 창 신고
                    modalBtn1.addEventListener("click", () => {
                        const url = "/report/member/" + memberNo2; 
                        open(url, "신고하기", "width=500px, height=600px")
                    });
                }else{ /* 나 */
                    modalReport.append(modalA);
                    modalA.append(modalMyI);
                    // modalReport.setAttribute("id", myNo);
                }
            }else{ /* 내가 리더가 아닌 경우 */
                if(memberNo != memPro.memberNo){ /* 회원 */
                    modalReport.append(modalBtn1);
                    modalBtn1.append(modalIcon);
                    modalBtn1.setAttribute("id", memPro.memberNo);

                    let memberNo2 = memPro.memberNo;

                    // 모달 창 신고
                    modalBtn1.addEventListener("click", () => {
                        const url = "/report/member/" + memberNo2; 
                        open(url, "신고하기", "width=500px, height=600px")
                    });
                }else{ /* 나 */
                    modalReport.append(modalA);
                    modalA.append(modalMyI);
                    // modalReport.setAttribute("id", myNo);
                }
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
        modalMemPro.classList.remove("show");
        modalMemPro.classList.add("hidden");
    }
})