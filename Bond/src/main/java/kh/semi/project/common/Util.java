package kh.semi.project.common;

import java.text.SimpleDateFormat;

public class Util {
	
	public static String fileRename(String originFileName) {
		// 현재 시간을 기준으로 파일명을 만듬
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}
}
