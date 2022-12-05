package kh.semi.project.alram.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
	
	private int messageNo; // 메세지 번호
	private String messageContent; // 채팅 내용
	private String readFlag; // 읽었는지 안읽었는지 확인 플래그
	private int senderNo; // 보내는 사람 번호
	private int targetNo; // 받는 사람 번호
	private int chattingNo; // 채팅 번호
	private String sendTime; // 보낸 시간

}
