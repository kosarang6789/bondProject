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
