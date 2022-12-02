// const replyYN = document.getElementById("reply-yn")
// replyYN.addEventListener("change", ()=>{
//     if(this.check){
//         replyYN.classList.add("ok");
//         replyYN.classList.remove("no");
//     }else{
//         replyYN.classList.remove("ok");
//         replyYN.classList.add("no");
//     }
// });

$(document).ready(function() {

    $('#summernote').summernote({
        placeholder: "새로운 소식을 남겨보세요. <br>공개밴드에 남긴 글은 누구나 볼 수 있습니다.",
        tabsize: 2,
        height: 380,
        focus: true,
        lang: "ko-KR",
        disableResizeEditor: true,
        fontNames: ['nanumsquare', 'serif'],
        toolbar: [
            ['font', ['bold', 'italic', 'underline', 'strikethrough', 'color']],
            ['insert', ['picture']],
        ]
    });




});