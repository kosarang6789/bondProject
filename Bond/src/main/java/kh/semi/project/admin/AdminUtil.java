package kh.semi.project.admin;

public class AdminUtil {
	
	   // 개행 문자 처리 해제
	   public static String newLineClear(String content) {
		   return content.replaceAll("<br>", "\n");
	   }
	   
	   // 개행 문자 처리 해제 for list출력용
	   public static String newLineClear2(String content) {
		   return content.replaceAll("<br>", " ");
	   }
	   
	   // 게시글에서 모든 특수문자 제거 for list출력용
	   public static String pTagClear(String content) {
		   String regEx = "<img src=[\\s\\d\\w.=/:;\">]+";
		   content = content.replaceAll(regEx, "");
		   
		   String regEx2 = "<p>";
		   content = content.replaceAll(regEx2, "");
		   
		   String regEx3 = "</p>";
		   content = content.replaceAll(regEx3, "");
		   
		   String regEx4 ="&bnsp;";
		   content = content.replaceAll(regEx4, "");
		   
		   String regEx5 = "</";
		   content = content.replaceAll(regEx5, "");
		   
		   String regEx6 = "<";
		   content = content.replaceAll(regEx6, "");
		   
		   return content;
	}
}
