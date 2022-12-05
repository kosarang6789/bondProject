package kh.semi.project.alram.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattingRoom {
	
	private int chattingNo; // 채팅번호
	private String lastMessage; // 마지막 메세지
	private String sendTime; // 보낸 시간
	private int targetNo; // 받는 사람 번호
	private String targetName; // 받는 사람 이름
	private String targetProfile; // 받는 사람 프로필사진
	private int notReadCount; // 안 읽음

}
