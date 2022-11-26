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
}
