// findEmail
document.getElementById("findEmail-frm").addEventListener("submit", (e)=>{
    const inputName = document.getElementById("e-inputName");
    const inputTel = document.getElementById("e-inputTel");

    if(inputName.value.trim().length == 0){
        alert("이름을 입력해주세요");
        inputName.focus();
        e.preventDefault();
        return;
    }
    
    if(inputTel.value.trim().length == 0){
        alert("전화번호를 입력해주세요");
        inputTel.focus();
        e.preventDefault();
        return;
    }
});


// findPw
document.getElementById("findPw-frm").addEventListener("submit", (e)=>{
    const inputName = document.getElementById("inputName");
    const inputEmail = document.getElementById("inputEmail");
    const inputTel = document.getElementById("inputTel");
    
    if(inputName.value.trim().length == 0){
        alert("이름을 입력해주세요");
        inputName.focus();
        e.preventDefault();
        return;
    }
    if(inputEmail.value.trim().length == 0){
        alert("이메일을 입력해주세요");
        inputEmail.focus();
        e.preventDefault();
        return;
    }
    if(inputTel.value.trim().length == 0){
        alert("전화번호를 입력해주세요");
        inputTel.focus();
        e.preventDefault();
        return;
    }

});

const sendKey  = document.getElementById("sendKey");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

sendKey.addEventListener("click", ()=>{
    authMin=4;
    authSec=59;
    $.ajax({
        url:"/member/findPw/sendKey",
        data:{"memberEmail":memberEmail.value, "memberName":memberName.value, "memberTel":memberTel.value},
        success:(res)=>{
            if(res>0){
                alert("인증번호 발송")
            }else{
                alert("인증번호 발생 실패")
            }
        },
        error:()=>{
            alert("이메일 발송 중 에러 발생")
        }
    })
    alert("인증번호 발송");

    authKeyMessage.innerText = "05:00";
    
    authTimer = windwo.setInterval(() => {
        authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec)

        // 남은 시간이 0분 0초
        if(authMin == 0 && authSec == 0){
            clearInterval(authTimer);
            return;
        }
        if(authSec == 0){
            authSec = 60;
            authMin--;
        }
        authSec--;
    }, 1000);
});


// 인증 확인
const inputKey = document.getElementById("inputKey");
const checkKey = document.getElementById("checkKey");

checkKey.addEventListener("click",(e)=>{
    if(authMin > 0 || authSec > 0){
        $.ajax({
            url : "/member/findPw/checkKey",
            data : {"inputKey":inputKey.value},
            success : (res)=>{
                switch(res){
                    case 2 : clearInterval(authTimer);
                            authKeyMessage.innerText="인증되었습니다."; break;
                        case 1 : 
                            authKeyMessage.innerText="인증번호가 일치하지 않습니다."; 
                            e.preventDefault();
                            break;
                        case 0 :
                            authKeyMessage.innerText="등록된 회원이 아닙니다.";  
                            e.preventDefault();
                            break;
                }
            },
            error : ()=>{
                alert("인증코드 확인 오류");
            }
        })
    }else{
        alert("인증시간이 만료되었습니다. 다시 시도해주세요.")
    }
})