const autoResizeTextarea = () => {
    let textarea = document.getElementById("replyWrite-Content")

    textarea.style.height = 'auto';
    let height = textarea.scrollHeight; // 높이
    textarea.style.height = `${height+5}px`;
    
};
