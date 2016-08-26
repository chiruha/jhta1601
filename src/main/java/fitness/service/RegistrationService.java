package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.RegistrationDao;
import fitness.dto.MemberDto;

@Service
public class RegistrationService {
	@Autowired RegistrationDao dao;
	
	//----------| ȸ����ȣ�˻��ϱ� |----------//
	public List<MemberDto> searchMemNum(HashMap<String, String> map){
		return dao.searchMemNum(map);
	}
	
	
	
	//----------| ȸ��������� |----------//
	
	
	
}
