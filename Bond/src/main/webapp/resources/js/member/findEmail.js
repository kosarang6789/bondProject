// findEmail
if(document.getElementById("findEmail-frm") != null){

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
}



// findPw
if(document.getElementById("findPw-frm") != null){
    
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
            url:"/findPw/sendKey",
            data:{"inputEmail":memberEmail.value, "inputName":memberName.value, "inputTel":memberTel.value},
            success:(res)=>{
                switch(res){
                    case 2 : alert("인증번호 발송"); break;
                    case 1 : alert("인증번호 발생 실패"); break;
                    case 0 : alert("일치하는 회원이 없습니다."); break;
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
                url : "/findPw/checkKey",
                data : {"inputKey":inputKey.value},
                success : (res)=>{
                    if(res>0){
                        clearInterval(authTimer);
                        authKeyMessage.innerText="인증되었습니다.";
                        return;
                    }else{
                        authKeyMessage.innerText="인증번호가 일치하지 않습니다."; 
                        e.preventDefault();
                        return;
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
  
    // 비밀번호 유효 검사
    const memberPw = document.getElementById("memberPw");
    const memberPwConfirm = document.getElementById("memberPwConfirm");
    const pwConfirm = document.getElementById("pwConfirm");
    
    memberPw.addEventListener("input", function(e){
        if(memberPw.value.trim().length == 0){
            pwConfirm.innerText="영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자 사이로 입력해주세요.";
            memberPw.value="";
            memberPw.classList.remove("error", "confrim");
            memberPw.focus();
            e.preventDefault();
            return;
        }
    
        const regEx = /^[a-zA-Z\d!@#\-\_]{8,20}$/;
    
        if(regEx.test(memberPw.value)){
    
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
            e.preventDefault();
            memberPw.focus();
            return;
        }
    });
    
    memberPwConfirm.addEventListener("input", function(e){
        if(checkObj.memberPw){
            if(memberPw.value == memberPwConfirm.value){
                pwConfirm.innerText="비밀번호가 일치합니다.";
                pwConfirm.classList.add("confirm");
                pwConfirm.classList.remove("error");
            }else{
                pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
                pwConfirm.classList.add("error");
                pwConfirm.classList.remove("confirm");
                e.preventDefault();
                memberPwConfirm.focus();
                return;
            }
        }else{
            e.preventDefault();
            memberPwConfirm.focus();
            return;
        }
    })
} 
