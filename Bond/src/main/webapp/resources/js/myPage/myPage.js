
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
