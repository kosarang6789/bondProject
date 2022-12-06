package kh.semi.project.common.test;

public class TempUtil {
	public static void main(String[] args) {
		
		String sample = "<img src=\"/resources/images/post/20";
		String sample2 = "<img src=12/3abcABC_.=/;\" >";
		
//		String regEx = "<img[a-z0-9ㄱ-힣\s\"/_:;.=]+>";
		// ^(<p>)[\w\dㄱ-힣]+(<\/p>)$
		
		String regEx = "<img src=[\\s\\d\\w.=/:;\">]+";
		String filtered = sample.replaceAll(regEx, "");
		String filtered2 = sample2.replaceAll(regEx, "");
		
		System.out.println(filtered);
		System.out.println();
		
		System.out.println("123 : " +  filtered2);
		
	}

}
