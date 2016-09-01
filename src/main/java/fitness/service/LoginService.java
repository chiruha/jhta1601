package fitness.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.LoginDao;

@Service
public class LoginService {
	@Autowired private LoginDao dao;
	
	public HashMap<String, Object> loginMem(HashMap<String, Object> map){
		return dao.loginMem(map);
	}
	public HashMap<String, Object> loginAdmin(HashMap<String, Object> map){
		return dao.loginAdmin(map);
	}
}
