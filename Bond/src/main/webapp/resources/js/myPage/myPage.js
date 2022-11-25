
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
        // "currentPw" : false
    }

    changePwFrm.addEventListener("submit", (e)=>{

        if(currentPw.value.trim().length==0){
            alert("현재 비밀번호를 작성해주세요.");
            // checkpw.currentPw = false;
            currentPw.focus();
            e.preventDefault();
            return;
        }
        if(newPw.value.trim().length==0){
            alert("새 비밀번호를 작성해주세요.");
                newPw.focus();
                e.preventDefault();
                return;
                // checkpw.newPW = false;
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
            // checkpw.currentPw = false;
            currentPw.focus();
            e.preventDefault();
            return;
        }
        

    })

    
    // pwConfirm.innerText="영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자로 입력해주세요.";
    pwConfirm.classList.remove("confirm", "error");
    
    newPw.addEventListener("input",()=>{
            // if(newPw.value.trim().length==0){
            //     alert("새 비밀번호를 작성해주세요.");
            //     // newPw.focus();
            //     // e.preventDefault();
            //     // return;
            //     checkpw.newPW = false;
            // }

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
                        // newPwConfirm.focus();
                        // e.preventDefault();
                        // return;
                    }
                }
            }else{
                pwConfirm.innerText="유효하지 않는 비밀번호입니다.";
                pwConfirm.classList.add("error");
                pwConfirm.classList.remove("confirm");
                checkpw.newPw=false;
                // e.preventDefault();
                // return;
            }
        });
        
        newPwConfirm.addEventListener("input", ()=>{
            // if(newPwConfirm.value.trim().length==0){
            //     alert("새 비밀번호 확인을 작성해주세요.");
            //     // newPwConfirm.focus();
            //     // e.preventDefault();
            //     // return;
            //     checkpw.newPwConfirm = false;
            // }

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
                    // e.preventDefault();
                    // return;
                }
            }else{
                checkpw.newPwConfirm=false;
            }
            
            
        })


        // if(regEx.test(newPwConfirm))


    // const checkObj = {
    //     "newPw":false,
    //     "newPwConfirm" : false,
    //     "currentPw" : false};
    
    //     changePwFrm.addEventListener("submit", (e)=>{
    //         for(let key in checkObj){

    //         let str;
    
    //         if(!checkObj[key]){
    //             switch(key){
    //                 case "currentPw" : str="현재 비밀번호를 확인해주세요"; break;
    //                 case "newPw" : str="새 비밀번호를 확인해주세요"; break;
    //                 case "newPwConfirm" : str="새 비밀번호 확인을 확인해주세요"; break;
    //             }
    //             alert(str);
    //             document.getElementById(key).focus();
    //             e.preventDefault();
    //             return;
    //         }
    //     }
    // });
    
    
    // // 비밀번호 유효 검사
    // const newPw = document.getElementById("newPw");
    // const newPwConfirm = document.getElementById("newPwConfirm");
    // const pwConfirm = document.getElementById("pwConfirm");
    // const currentPw = document.getElementById("currentPw");
    
    // currentPw.addEventListener("input", ()=>{

    //     if(currentPw.value.trim().length == 0){
    //         // alert("현재 비밀번호를 입력해주세요");
    //         checkObj.currentPw = false;
    //     }else{
    //         checkObj.currentPw=true;
    //     }
    // });
    
    // newPw.addEventListener("input", function(){
    //     if(newPw.value.trim().length == 0){
    //         pwConfirm.innerText="영어, 숫자, 특수문자(!,@,#,-,_) 8~20글자로 입력해주세요.";
    //         newPw.classList.remove("error", "confrim");
    //         checkObj.newPw = false;
    //     }
    
    //     const regEx = /^[a-zA-Z\d!@#\-\_]{8,20}$/;
    
    //     if(regEx.test(newPw.value)){
    //         checkObj.newPw = true;
    
    //         if(newPwConfirm.value.trim().length == 0){
    //             pwConfirm.innerText="유효한 비밀번호 입니다.";
    //             pwConfirm.classList.add("confirm");
    //             pwConfirm.classList.remove("error");
    //         }else{
    //             if(newPw.value == newPwConfirm.value){
    //                 checkObj.newPwConfirm=true;
    //                 pwConfirm.innerText="비밀번호가 일치합니다.";
    //                 pwConfirm.classList.add("confirm");
    //                 pwConfirm.classList.remove("error");
    //             }else{
    //                 checkObj.newPwConfirm=false;
    //                 pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
    //                 pwConfirm.classList.add("error");
    //                 pwConfirm.classList.remove("confirm");
    //             }
    //         }
    //     }else{
    //         pwConfirm.innerText="비밀번호 형식이 유효하지 않습니다.";
    //         pwConfirm.classList.add("error");
    //         pwConfirm.classList.remove("confirm");
    //         checkObj.newPw=false;
    //     }
    // });
    
    // newPwConfirm.addEventListener("input", function(){
    //     if(checkObj.newPw){
    //         if(newPw.value == newPwConfirm.value){
    //             pwConfirm.innerText="비밀번호가 일치합니다.";
    //             pwConfirm.classList.add("confirm");
    //             pwConfirm.classList.remove("error");
    //             checkObj.newPwConfirm=true;
    //         }else{
    //             pwConfirm.innerText="비밀번호가 일치하지 않습니다.";
    //             pwConfirm.classList.add("error");
    //             pwConfirm.classList.remove("confirm");
    //             checkObj.newPwConfirm=false;
    //         }
    //     }else{
    //         checkObj.newPwConfirm=false;
    //     }
    // })


};