
// 회원 탈퇴
const secessionFrm = document.getElementById("secessionFrm");
if(secessionFrm != null){
    secessionFrm.addEventListener("submit",(e)=>{
    
        const agree = document.getElementById("agree");
        if(!agree.checked){
            alert("탈퇴를 원하신다면 약관에 동의해주세요.");
            e.preventDefault();
            return;
        }

        const memberPw = document.getElementById("memberPw");
        if(memberPw.value.trim().length == 0){
            alert("비밀번호를 입력해주세요.");
            memberPw.focus();
            e.preventDefault();
            return;
        }

        if(!confirm("정말 탈퇴하시겠습니까?")){
            alert("탈퇴가 취소되었습니다.");
            e.preventDefault();
            return;
        }
    });
}

// 비밀번호 변경
const changePwFrm = document.getElementById("changePwFrm");
if(changePwFrm != null){

    const currentPw = document.getElementById("currentPw");
    const newPw = document.getElementById("newPw");
    const newPwConfirm = document.getElementById("newPwConfirm");
    const pwConfirm = document.getElementById("pwConfirm");

    const checkpw = {
        "newPw" : false,
        "newPwConfirm" : false
    }

    changePwFrm.addEventListener("submit", (e)=>{

        if(currentPw.value.trim().length==0){
            alert("현재 비밀번호를 작성해주세요.");
            currentPw.focus();
            e.preventDefault();
            return;
        }
        if(newPw.value.trim().length==0){
            alert("새 비밀번호를 작성해주세요.");
                newPw.focus();
                e.preventDefault();
                return;
        }
        if(newPwConfirm.value.trim().length==0){
            alert("새 비밀번호 확인을 작성해주세요.");
                newPwConfirm.focus();
                e.preventDefault();
                return;
        }
        for(let key in checkpw){
            if(!checkpw[key]){
                switch(key){
                    case "newPw" : alert("새 비밀번호가 유효하지 않습니다."); break;
                    case "newPwConfirm" : alert("새 비밀번호 확인이 유효하지 않습니다."); break;
                }
                document.getElementById(key).focus();
                e.preventDefault();
                return;
            }
        }
    })
    
    currentPw.addEventListener("input",()=>{
        if(currentPw.value.trim().length==0){
            alert("현재 비밀번호를 작성해주세요.");
            currentPw.focus();
            e.preventDefault();
            return;
        }
        

    })

    

    pwConfirm.classList.remove("confirm", "error");
    
    newPw.addEventListener("input",()=>{

            const regEx = /^[\w!@#-_]{8,20}$/;
            if(regEx.test(newPw.value)){
                checkpw.newPw = true;
    
                if(newPwConfirm.value.trim().length == 0){
                    pwConfirm.innerText="유효한 비밀번호입니다.";
                    pwConfirm.classList.add("confirm");
                    pwConfirm.classList.remove("error");
                    e.preventDefault();
                    return;
                }else{
                    if(newPw.value == newPwConfirm.value){
                        checkpw.newPwConfirm=true;
                        pwConfirm.innerText="비밀번호가 일치합니다.";
                        pwConfirm.classList.add("confirm");
                        pwConfirm.classList.remove("error");
                    }else{
                        checkpw.newPwConfirm=false;
                        pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
                        pwConfirm.classList.remove("confirm");
                        pwConfirm.classList.add("error");
                    }
                }
            }else{
                pwConfirm.innerText="유효하지 않는 비밀번호입니다.";
                pwConfirm.classList.add("error");
                pwConfirm.classList.remove("confirm");
                checkpw.newPw=false;
            }
    });
        
    newPwConfirm.addEventListener("input", ()=>{

        if(checkpw.newPw){

            if(newPw.value == newPwConfirm.value){
                pwConfirm.innerText="비밀번호가 일치합니다.";
                pwConfirm.classList.remove("error");
                pwConfirm.classList.add("confirm");
                checkpw.newPwConfirm=true;
            }else{
                pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
                pwConfirm.classList.add("error");
                pwConfirm.classList.remove("confirm");
                checkpw.newPwConfirm=false;
            }
        }else{
            checkpw.newPwConfirm=false;
        }
    })
};



// 내정보 수정
const imgFrm = document.getElementById("imgFrm");
const profileFrm = document.getElementById("profileFrm");

if(imgFrm != null){

    let initCheck;
    let deleteCheck=-1;
    
    const profileImage = document.getElementById("profile-image");
    const inputImg = document.getElementById("image-input");
    const deleteBtn = document.getElementById("deleteBtn");

    const originalImg = profileImage.getAttribute("src");
    const defaultImg = "/resources/images/member/profile/defaultProfile.png";

    if(profileImage.getAttribute("src") == defaultImg){
        initCheck = false;
    }else{
        initCheck = true;
    }

    inputImg.addEventListener("change", e=>{
        if(e.target.files[0] != undefined){ // 선택된 파일 o
            const reader = new FileReader(); // 파일을 읽음
            reader.readAsDataURL(e.target.files[0]); // 지정된 파일 읽기 시작
            reader.onload = event =>{
                profileImage.setAttribute("src", event.target.result);
                deleteCheck=1;
            }
        }else{ // 사진 업로드 취소 버튼 클릭
            profileImage.setAttribute("src", originalImg);
            deleteCheck=-1;
        }
    });
    deleteBtn.addEventListener("click", ()=>{
        profileImage.setAttribute("src", defaultImg);
        inputImg.value="";
        deleteCheck=0;
    });

    function profileValidate(){
        if(!initCheck && deleteCheck==1){return true;}
        if(initCheck && deleteCheck==0){return true;}
        if(initCheck && deleteCheck==1){return true;}
        alert("이미지 변경 후 클릭하세요");
        return false;
    }
    
}

if(profileFrm != null){

    const name = document.getElementById("name");
    const birth = document.getElementById("birth");
    const tel = document.getElementById("tel");
    const confirmMessage = document.getElementById("confirmMessage");

    name.addEventListener("click", ()=>{
        confirmMessage.innerText="한글, 영어, 숫자로만 2~10글자 입력해주세요.";
        confirmMessage.classList.remove("confirm", "error");
    });
    tel.addEventListener("click", ()=>{
        confirmMessage.innerText="- 빼고 입력해주세요.";
        confirmMessage.classList.remove("confirm", "error");
    });

    const ntcheck = {
        "name" : true,
        "tel" : true
    }
    

    name.addEventListener("input", ()=>{
        const regEx = /^[\w가-힇]{2,10}$/;

        if(oriName != name.value){
            // confirmMessage.innerText="한글, 영어, 숫자로만 2~10글자 입력해주세요.";
            // confirmMessage.classList.remove("confirm");
            // confirmMessage.classList.add("error");

            if(regEx.test(name.value)){
                $.ajax({
                    url : "/nameDupCheck",
                    data : {"memberName" : name.value},
                    success : result => {
                        if(result == 0){
                            confirmMessage.innerText = "사용 가능한 이름입니다.";
                            confirmMessage.classList.add("confirm");
                            confirmMessage.classList.remove("error");
                            ntcheck.name = true;
                        }else{
                            confirmMessage.innerText="사용 중인 이름입니다.";
                            confirmMessage.classList.add("error");
                            confirmMessage.classList.remove("confirm");
                            ntcheck.name = false;
                        }
                    },
                    error : ()=>{
                        alert("ajax 통신 중 오류 발생 - 이름 수정");
                        ntcheck.name = false;
                    }
                })
            }else{
                confirmMessage.innerText="이름 형식이 유효하지 않습니다.";
                confirmMessage.classList.add("error");
                confirmMessage.classList.remove("confirm");
                ntcheck.name = false;
            }
        }
        
    });

    tel.addEventListener("input", ()=>{
        // confirmMessage.innerText="- 빼고 입력해주세요.";
        // confirmMessage.classList.remove("confirm");
        // confirmMessage.classList.add("error");
        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{2,3}\d{4}$/;
        if(regEx.test(tel.value)){
            confirmMessage.innerText="유효한 전화번호 형식입니다.";
            confirmMessage.classList.add("confirm");
            confirmMessage.classList.remove("error");
            ntcheck.tel = true;
        }else{
            confirmMessage.innerText="전화번호 형식이 유효하지 않습니다.";
            confirmMessage.classList.add("error");
            confirmMessage.classList.remove("confirm");
            ntcheck.tel = false;

        }
    });


    function checkValidate(){
        
        if(oriName == name.value && oriTel == tel.value && oriBirth == birth.value){
            alert("변경 사항이 없습니다.");
            return false;
        }
        if(name.value.trim().length == 0){
            alert("이름을 입력해주세요");
            return false;
        }
        if(birth.value.trim().length == 0){
            alert("생일을 입력해주세요");
            return false;
        }
        if(tel.value.trim().length == 0){
            alert("전화번호를 입력해주세요");
            return false;
        }

        if(!ntcheck.name){
            alert("이름을 다시 입력해주세요.");
            return false;
        };
        
        if(ntcheck.tel == false){
            alert("전화번호를 다시 입력해주세요.");
            return false;
        };

    }
    
};

// Swiper

// $("document").ready(function () {
//     // 문서의 dom이 준비되면
//     // .mySwiper 클래스를 swiper 슬라이더로 만듦
//     // 이후에 swiper변수에 할당했기 때문에 스크립트로 제어할 수도 있음.
//     var swiper = new Swiper(".mySwiper", {
//         slidesPerView: 'auto',
//         spaceBetween: 80,
//         loop: true,

//         // 좌우 화살표 navigation element 지정
//         navigation: {
//             nextEl: ".swiper-button-next",
//             prevEl: ".swiper-button-prev"
//         },
//         // 반응형
//         breakpoints: {
//             // 600px 이하가 되면 슬라이드 간 간격을 0으로
//             600: {
//                 spaceBetween: 0
//             },
//         },

//         on: {
//             init: function() {
//                 $('.swiper-slide').addClass('changed');

//                 // fraction에 현재 인덱스와 전체 인덱스 표시
//                 // this.loopedSlides는 loop, slidesPerView: 'auto'일 때 제대로 동작
//                 $('.custom-fraction .current').text(this.realIndex + 1);
//                 $('.custom-fraction .all').text(this.loopedSlides);
//                 // console.log(this);
//                 // console.log(this.loopedSlides)
//             },

//             slideChangeTransitionStart: function() {
//                 // 기본적으로 제공하는 swiper-slide-active 클래스를 이용해
//                 // css transition 애니메이션 작성 가능하다.
//                 // 다만 루프 모드일 때에는 루프 픽스를 하며 slide를 바꿔치기를 하는데,
//                 // 이 때 플리커링이 발생할 수 있다.
//                 // css transition을 서로 다르게 설정한 changed, changing 클래스를 이용
//                 $('.swiper-slide').addClass('changing');
//                 $('.swiper-slide').removeClass('changed');

//                 // 페이지 넘어갈 때마다 fraction 현재 인덱스 변경
//                 $('.custom-fraction .current').text(this.realIndex + 1);
//             },

//             slideChangeTransitionEnd: function() {
//                 // changing : transition O
//                 // changed : transition X
//                 $('.swiper-slide').removeClass('changing');
//                 $('.swiper-slide').addClass('changed');
//             }
//         },
//     });

// });