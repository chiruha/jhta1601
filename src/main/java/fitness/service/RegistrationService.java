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
		
	//----------| 회원수강등록(insert)(테이블명: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return dao.regiInsert(dto1);
	}
	//----------| 단과과목등록(insert)(테이블명: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return dao.prosignInsert(dto2);
	}
		
	//----------| pt과목등록(insert)(테이블명: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return dao.ptsignInsert(dto3);
	}
}
