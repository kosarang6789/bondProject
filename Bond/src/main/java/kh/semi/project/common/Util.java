package kh.semi.project.common;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

public class Util {
	
	public static String fileRename(String originFileName) {
		// 현재 시간을 기준으로 파일명을 만듬
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);
		System.out.println(originFileName);
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
	
	   // xss 방지 처리 : HTML에서 해석되는 문자를 단순 글자로 변경
	   public static String XSSHandling(String content) {
		   
		   if(content != null) {
			   content = content.replaceAll("&", "&amp;");
			   content = content.replaceAll("<", "&lt;");
			   content = content.replaceAll(">", "&gt;");
			   content = content.replaceAll("\"", "&quot;");
		   }
		   return content;
	   }

	   
	   // 개행 문자 처리 : \r\n, \n, \r, \n\r -> <br>로 변경
	   public static String newLineHandling(String content) {
		   return content.replaceAll("(\r\n|\n|\r|\n\r)", "<br>");
	   }
	   
	   
	   // 개행 문자 처리 해제
	   public static String newLineClear(String content) {
		   return content.replaceAll("<br>", "\n");
	   }
	   
	   // 문자열 형식의 날짜(예 : 2022-12-03 )를 입력받아 요일 구하기
	   public static String getDate(String startDate) {
			
			
			int year = Integer.parseInt(startDate.substring(0, 4));
			int month = Integer.parseInt(startDate.substring(5, 7));
			int day = Integer.parseInt(startDate.substring(8, 10));
			
			LocalDate date = LocalDate.of(year, month, day);
			
			int dateValue = date.getDayOfWeek().getValue();
			
			String result = "";
			
			switch (dateValue) {
			case 1: result = "월요일"; break;
			case 2: result = "화요일"; break;
			case 3: result = "수요일"; break;
			case 4: result = "목요일"; break;
			case 5: result = "금요일"; break;
			case 6: result = "토요일"; break;
			case 7: result = "일요일"; break;
			}
			
			return result;
	   }
	   
	   // 주소에서 groupNo를 가져오는 메서드
	   public static int getGroupNo(String path) throws NumberFormatException {
		   
		   // 주소 예시 : /bond/11/album
		   
		   int firstIndex = path.indexOf("/"); // 첫 번째 /의 위치
		   int secondIndex = path.indexOf("/", firstIndex + 1); // 두 번째 /의 위치
		   int thirdIndex = path.indexOf("/", secondIndex + 1); // 세 번째 /의 위치
		   
		   int result = -1;
		   
		   if(thirdIndex != -1) { // 세 번째 /가 있는 경우
			   result = Integer.parseInt(path.substring(secondIndex + 1, thirdIndex));
		   }
		   
		   if(thirdIndex == -1) { // 세 번째 /가 없는 경우, 끝까지 가져옴
			   result = Integer.parseInt(path.substring(secondIndex + 1));
		   }
				   
		   return result; // 숫자를 보냅니다.
	   }
	   
}
