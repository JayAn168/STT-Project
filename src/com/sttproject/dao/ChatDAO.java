package com.sttproject.dao;

import java.sql.SQLException;
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
	
	public List<ChatDTO> getChatListByID(String fromID, String toID, String chatID) throws SQLException{
		
		try {
			List<ChatDTO> chatList = null;
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("fromID", fromID);
			datas.put("toID", toID);
			datas.put("chatID", chatID);// parseInt
			
			chatList = sqlsession.selectList("Chat.getChatListByID",datas);
			
			return chatList;
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return null;
	}
//	public int submit(String fromid, String toid, String chatContent){
//		HashMap<String, String> datas = new HashMap<String, String>();
//		datas.put("fromid", fromid);
//		datas.put("toid", toid);
//		datas.put("chatContent", chatContent);
//		
//		return sqlsession.insert("Chat.submit",datas);
//	}
	
	public List<ChatDTO> getChatListByRecent(String fromID, String toID, int number) throws SQLException{
		
		try {
			List<ChatDTO> chatList = null;
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("fromID", fromID);
			datas.put("toID", toID);
			datas.put("number", number);
			
			chatList = sqlsession.selectList("Chat.getChatListByRecent",datas);
			
			return chatList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int submit(String fromID, String toID, String chatContent) {
		try {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("fromID", fromID);
			datas.put("toID", toID);
			datas.put("chatContent", chatContent);
			
			return sqlsession.insert("Chat.submit",datas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}
	
	public int readChat(String fromID, String toID) {
		try {
			HashMap<String, String> datas = new HashMap<String, String>();
			datas.put("fromID", fromID);
			datas.put("toID", toID);
			
			return sqlsession.update("Chat.readChat",datas);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			return -1;
		
	}
	public int getAllUnreadChat(String userid) {
		try {
			return sqlsession.selectOne("Chat.getAllUnreadChat",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			return -1;
		
	}
	
	public List<ChatDTO> getBox(String userid) throws SQLException{

		try {
			List<ChatDTO> chatList = null;
			
			chatList = sqlsession.selectList("Chat.getBox", userid);
			
			for(int i = 0; i < chatList.size(); i++) {
				ChatDTO x = chatList.get(i);
				for(int j = 0; j < chatList.size(); j++) {
					ChatDTO y = chatList.get(j);
					if(x.getFromID().equals(y.getToID()) && x.getToID().equals(y.getFromID())) {
						if(x.getChatID() < y.getChatID()) {
							chatList.remove(x);
							i--;
							break;
						} else {
							chatList.remove(y);
							j--;
						}
					}
				}
			}
			
			return chatList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
























