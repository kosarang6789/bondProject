const replyYN = document.getElementById("reply-yn")
replyYN.addEventListener("change", ()=>{
    if(this.check){
        replyYN.classList.add("ok");
        replyYN.classList.remove("no");
    }else{
        replyYN.classList.remove("ok");
        replyYN.classList.add("no");
    }
});
