const saveId = document.getElementById("saveId");
const idCheck = document.getElementById("idCheck")

saveId.addEventListener("change",function(event){
    if(this.checked){
        const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다."
                    +"개인 PC가 아닌 경우 취소를 눌러주세요.";
        idCheck.classList.add("idOk");
        if(!confirm(str)){
            this.checked = false;
            idCheck.classList.remove("idOk"); 
        }
    }else{
            idCheck.classList.remove("idOk");
    }
});

const loginFrm = document.getElementById("loginFrm");
if(loginFrm != null){
    
    loginFrm.addEventListener("submit", function(e){
        const memberEmail = document.getElementById("memberEmail");
        const memberPw = document.getElementById("memberPw");
        const loginCheck = document.getElementById("loginCheck");
    
        if(memberEmail.value.trim().length == 0){
            loginCheck.innerText = "아이디를 입력해주세요";
            loginCheck.classList.add("error");
            e.preventDefault();
            memberEmail.focus();
            return;
        }
        if(memberPw.value.trim().length == 0){
            loginCheck.innerText = "비밀번호를 입력해주세요";
            loginCheck.classList.add("error");
            e.preventDefault();
            memberPw.focus();
            return;
        }
    });
}