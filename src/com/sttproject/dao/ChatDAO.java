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
	
//	public List<ChatDTO> getChatListByID(String fromid, String toid, String chatidx){
//		List<ChatDTO> chatList;
//		HashMap<String, String> datas = new HashMap<String, String>();
//		datas.put("fromid", fromid);
//		datas.put("toid", toid);
//		datas.put("chatidx", chatidx);
//		
//		return sqlsession.selectList("Chat.getChatListByID",datas);
//	}
//	public int submit(String fromid, String toid, String chatContent){
//		HashMap<String, String> datas = new HashMap<String, String>();
//		datas.put("fromid", fromid);
//		datas.put("toid", toid);
//		datas.put("chatContent", chatContent);
//		
//		return sqlsession.insert("Chat.submit",datas);
//	}

}
