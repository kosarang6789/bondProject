const checkObj = {
    "memberEmail" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberName" : false,
    "memberTel" : false,
    "memberBirth" : false
}


document.getElementById("signUpFrm").addEventListener("submit", function(event){

    for(let key in checkObj){
        let str;

        if(!checkObj[key]){
            switch(key){
                case "memberEmail" : str="이메일이 유효하지 않습니다."; break;
                case "memberPw" : str="비밀번호가 유효하지 않습니다."; break;
                case "memberPwConfirm" : str="비밀번호 확인이 유효하지 않습니다."; break;
                case "memberName" : str="닉네임이 유효하지 않습니다."; break;
                case "memberTel" : str="전화번호가 유효하지 않습니다."; break;
                case "memberBirth" : str="생년월일이 유효하지 않습니다."; break;
            }
            alert(str);
            document.getElementById(key).focus();
            event.preventDefault();
            return;
        }
    }
});


// 이메일 유효 검사
const memberEmail = document.getElementById("memberEmail");
const emailConfirm = document.getElementById("emailConfirm");

memberEmail.addEventListener("input", function(){
    if(memberEmail.value.trim().length == 0){
        emailConfirm.innerText="메일을 받을 수 있는 이메일을 입력해주세요.";
        memberEmail.value="";
        emailConfirm.classList.remove("confirm", "error");
        checkObj.memberEmail = false;
        return;
    }

    const regEx = /^[a-zA-Z\d\_\-]{4,}@[가-힇\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(memberEmail.value)){
        emailConfirm.innerText = "유효한 이메일 입니다.";
        emailConfirm.classList.add("confirm");
        emailConfirm.classList.remove("error");
        checkObj.memberEmail = true;
    }else{
        emailConfirm.innerText = "유효하지 않는 이메일 입니다.";
        emailConfirm.classList.add("error");
        emailConfirm.classList.remove("confirm");
        checkObj.memberEmail = false;
    }
});


// 비밀번호 유효 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwConfirm = document.getElementById("pwConfirm");

memberPw.addEventListener("input", function(){
    if(memberPw.value.trim().length == 0){
        pwConfirm.innerText="영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자 사이로 입력해주세요.";
        memberPw.value="";
        memberPw.classList.remove("error", "confrim");
        checkObj.memberPw = false;
        return;
    }

    const regEx = /^[a-zA-Z\d!@#\-\_]{8,20}$/;

    if(regEx.test(memberPw.value)){
        checkObj.memberPw = true;

        if(memberPwConfirm.value.trim().length == 0){
            pwConfirm.innerText="유효한 비밀번호 입니다.";
            pwConfirm.classList.add("confirm");
            pwConfirm.classList.remove("error");
        }else{
            if(memberPw.value == memberPwConfirm.value){
                checkObj.memberPwConfirm=true;
                pwConfirm.innerText="비밀번호가 일치합니다.";
                pwConfirm.classList.add("confirm");
                pwConfirm.classList.remove("error");
            }else{
                checkObj.memberPwConfirm=false;
                pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
                pwConfirm.classList.add("error");
                pwConfirm.classList.remove("confirm");
            }
        }
    }else{
        pwConfirm.innerText="비밀번호 형식이 유효하지 않습니다.";
        pwConfirm.classList.add("error");
        pwConfirm.classList.remove("confirm");
        checkObj.memberPw=false;
    }
});

memberPwConfirm.addEventListener("input", function(){
    if(checkObj.memberPw){
        if(memberPw.value == memberPwConfirm.value){
            pwConfirm.innerText="비밀번호가 일치합니다.";
            pwConfirm.classList.add("confirm");
            pwConfirm.classList.remove("error");
            checkObj.memberPwConfirm=true;
        }else{
            pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
            pwConfirm.classList.add("error");
            pwConfirm.classList.remove("confirm");
            checkObj.memberPwConfirm=false;
        }
    }else{
        checkObj.memberPwConfirm=false;
    }
})


// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const nameConfirm = document.getElementById("nameConfirm");

memberName.addEventListener("input", function(){
    if(memberName.value.trim().length == 0){
        nameConfirm.innerText = "한글, 영어 숫자로만 2~10글자 입력해주세요.";
        nameConfirm.classList.remove("confirm", "error");
        checkObj.memberName = false;
        return;
    }
    const regEx = /^[\w가-힇]{2,10}$/;
    if(regEx.test(memberName.value)){
        nameConfirm.innerText = "유효한 이름입니다.";
        nameConfirm.classList.add("confirm");
        nameConfirm.classList.remove("error");
        checkObj.memberName=true;
    }else{
        nameConfirm.innerText="이름 형식이 유효하지 않습니다.";
        nameConfirm.classList.add("error");
        nameConfirm.classList.remove("confirm");
        checkObj.memberName=false;
    }
});


// 전화번호 유효검사
const memberTel = document.getElementById("memberTel");
const telConfirm = document.getElementById("telConfirm");

memberTel.addEventListener("input", function(){
    if(memberTel.value.trim().length == 0){
        telConfirm.innerText = "전화번호를 입력해주세요. (-제외)";
        telConfirm.classList.remove("confirm", "error");
        checkObj.memberTel = false;
        return;
    }
    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{2,3}\d{4}$/;
    if(regEx.test(memberTel.value)){
        telConfirm.innerText="유효한 전화번호 형식입니다.";
        telConfirm.classList.add("confirm");
        telConfirm.classList.remove("error");
        checkObj.memberTel=true;
    }else{
        telConfirm.innerText="전화번호 형식이 유효하지 않습니다.";
        telConfirm.classList.add("error");
        telConfirm.classList.remove("confirm");
        checkObj.memberTel=false;

    }
});

// 생일 유효검사
const memberBirth = document.getElementById("memberBirth");
const birthConfirm = document.getElementById("birthConfirm");

memberBirth.addEventListener("input", function(){
    if(memberBirth.value.trim().length == 0){
        birthConfirm.innerText = "생년월일을 입력해주세요.";
        birthConfirm.classList.add("error");
        birthConfirm.classList.remove("confirm");
    }
});