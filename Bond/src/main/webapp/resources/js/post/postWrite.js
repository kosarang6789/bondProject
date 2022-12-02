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

const postWriteContent = document.getElementById("summernote");

const writeValidate=()=>{

    
};

const submitContent = ()=>{

    if(postWriteContent.value.trim().length==0){
        alert("내용을 입력해주세요.");
        postWriteContent.value="";
        return false;
    } else {
        $.ajax({
            url : "/bond/"+ groupNo +"/postWrite",
            data : {"postContent" : postWriteContent.value},
            type : "POST",
            dataType : "JSON",
            success: (postNo)=> {
                console.log("성공");
                parent.window.location.reload();
            },
            error: ()=>{
                console.log("실패");
            }
        })
    }

};


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
        ],
         // 이미지 업로드 이벤트가 발생했을 때 
        callbacks: { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor) {
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadImageFile(files[i], this);
                }
            }
        }
    });
});

// 업로드된 이미지를 ajax를 이용하여 서버로 전송하여 저장하는 함수
function uploadImageFile(file, editor){
    
    // 매개변수 
    // file : 업로드된 이미지 정보
    // editor : 이미지 업로드가 발생한 summernote 에디터 요소

    form_data = new FormData();
    // FormData : form 태그 내부 값 전송을 위한  k:v 쌍을 쉽게 생성할 수 있는 객체
    
    form_data.append("file", file);
    // FormData 객체에 새로운 K, V 를 추가
    
    $.ajax({
        url : "/uploadImageFile",
        type : "post",
        data : form_data,
        dataType: "json",
        enctype: "multipart/form-data",   // 파일을 전달하기 때문에 enctype 설정 필수
        cache : false,
        contentType : false,
        // contentType : 서버로 전송되는 데이터의 형식 설정
        // 기본값  : application/x-www-form-urlencoded; charset=UTF-8
        // 파일 전송 시 multipart/form-data 형식으로 데이터를 전송해야 하므로
        // 데이터의 형식이 변경되지 않도록 false로 지정.

        processData : false,
        // processData : 서버로 전달되는 값을 쿼리스트링으로 보낼경우 true(기본값), 아니면 false
        //            파일 전송 시 false로 지정 해야 함.

        success : function(at){
            // console.log(at.url);
            // contextPath(최상위 주소)를 javascript로 얻어오는 방법
            // -> js 파일에서는 EL을 사용할 수 없음 (EL은 JSP에서만 사용 가능) 
            // var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
            
            // 저장된 이미지를 에디터에 삽입(이미지)
            $(editor).summernote('editor.insertImage', at.url);
        },
        error : function(e) {
            console.log(e);
        }
    })
}