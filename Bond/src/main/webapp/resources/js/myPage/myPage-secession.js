document.getElementById("secessionFrm").addEventListener("submit",(e)=>{

    const agree = document.getElementById("agree");
    if(agree != checked){
        alert("탈퇴를 원하신다면 약관에 동의해주세요.")
        e.preventDefault();
    }
});