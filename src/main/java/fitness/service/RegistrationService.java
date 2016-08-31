package fitness.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.RegistrationDao;
import fitness.dto.ProsignDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

@Service
public class RegistrationService {
	@Autowired RegistrationDao dao;
		
	//----------| ȸ���������(insert)(���̺��: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return dao.regiInsert(dto1);
	}
	//----------| �ܰ�������(insert)(���̺��: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return dao.prosignInsert(dto2);
	}
		
	//----------| pt������(insert)(���̺��: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return dao.ptsignInsert(dto3);
	}
}
