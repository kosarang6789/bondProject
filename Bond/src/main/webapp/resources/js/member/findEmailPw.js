// findEmail
document.getElementById("findEmail-frm").addEventListener("click", (e)=>{
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

    $.ajax({
        url : "",
        data : "",
        success : ()=>{},
        error : ()=>{}
    });
});