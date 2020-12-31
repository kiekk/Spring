package com.koreait.mapper;

import java.util.Date;

import com.koreait.domain.LoginDTO;
import com.koreait.domain.UserVO;

public interface UserMapper {
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String id, String sessionId, Date next) throws Exception;
	
	public UserVO checkUserWithSessionKey(String value) throws Exception;
}
