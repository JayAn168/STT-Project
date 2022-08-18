package com.sttproject.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sttproject.dto.ChatDTO;
import com.sttproject.mybatis.SqlMapConfig;

public class ChatDAO {
	SqlSession sqlsession;
	
	public ChatDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public List<ChatDTO> getChatListByID(String fromID, String toID, String chatID){
		List<ChatDTO> chatList;
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("fromID", fromID);
		datas.put("toID", toID);
		datas.put("chatID", chatID);
		
		return sqlsession.selectList("Chat.getChatListByID",datas);
	}
//	public int submit(String fromid, String toid, String chatContent){
//		HashMap<String, String> datas = new HashMap<String, String>();
//		datas.put("fromid", fromid);
//		datas.put("toid", toid);
//		datas.put("chatContent", chatContent);
//		
//		return sqlsession.insert("Chat.submit",datas);
//	}
	public List<ChatDTO> getChatListByRecent(String fromID, String toID, int number){
		List<ChatDTO> chatList;
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("fromID", fromID);
		datas.put("toID", toID);
		datas.put("number", number);
		
		return sqlsession.selectList("Chat.getChatListByRecent",datas);
	}

	public int submit(String fromID, String toID, String chatContent) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("fromID", fromID);
		datas.put("toID", toID);
		datas.put("chatContent", chatContent);
		
		return sqlsession.insert("Chat.submit",datas);
	}
	
}
