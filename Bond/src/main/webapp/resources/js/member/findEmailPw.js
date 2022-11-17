// findEmail
document.getElementById("findEmail-btn").addEventListener("click", (e)=>{
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

    const btnArea = document.getElementById("btnArea");
    const findEmailResult = document.getElementById("findEmailResult");
    const modal = document.getElementById("modal");
    const div = document.createElement("div");
    
        $.ajax({
            url : "/findEmail",
            data : {"inputName":inputName.value, "inputTel":inputTel.value},
            success : (res)=>{
                // 로그인 나오게 하기
                if(res != null){
                    findEmailResult.innerText = member.memberEmail+"입니다";
                    modal.classList.add("modalO");
                    btnArea.append(div);
                    e.preventDefault();
                    return;
                }else{
                    // 회원가입 나오게 하기
                    // t.innerText = "등록된 이메일이 없습니다.";
                    // loginSignUpBtn.innerText = "회원가입";
                    // modal.classList.add = "modalO";
                    findEmailResult.innerText = "등록된 이메일이 없습니다.";
                    modal.classList.add("modalO");
                    btnArea.append(div);
                    div.innerHTML = "<a herf='/signUp'>회원가입</a>";
                    if(inputName.value.trim().length != 0 && inputTel.value.trim().length != 0){
                        loginSignUpBtn.innerText = "로그인";
                    }
                    e.preventDefault();
                    return;
                    }
                },
                error : ()=>{
                    alert("에러");
                }
            });


    // // 4,5 번째 줄을 위로 빼면 실행 되는지도 봐보자 -> 중복 코드가 있으니까 줄여보자
    // if(memberEmail != null){
    //     // 로그인 나오게 하기
    //     findEmailResult.innerText = "${memberEmail}"+"입니다.";
    //     modal.classList.add = "modalO";
    //     btnArea.append(div);
    //     div.setAttribute("class", "btns");
    //     div.innerHTML = "<a herf='/login'>로그인</a>";
    //     e.preventDefault();
    //     return;
    // }else{
    //     // 회원가입 나오게 하기
    //     findEmailResult.innerText = "등록된 이메일이 없습니다.";
    //     modal.classList.add = "modalO";
    //     btnArea.append(div);
    //     div.setAttribute("class", "btns");
    //     div.innerHTML = "<a herf='/signUp'>회원가입</a>";
    //     e.preventDefault();
    //     return;
    // }
})
