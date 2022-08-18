package com.sttproject.dto;

public class ChatDTO {
	int chatid;
	String fromid;
	String toid;
	String chatContent;
	String chatTime;
	
	public int getChatid() {
		return chatid;
	}
	public void setChatid(int chatid) {
		this.chatid = chatid;
	}
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
	}
	public String getToid() {
		return toid;
	}
	public void setToid(String toid) {
		this.toid = toid;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	
}
