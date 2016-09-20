package fitness.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.PaymentDao;
import fitness.dto.PaymentDto;

@Service
public class PaymentService {
	@Autowired private PaymentDao dao;
	public int spayService(HashMap<String, Object> map){
		return dao.sattCnt(map);
	}
	public int insertService(PaymentDto dto){
		return dao.insertDao(dto);
	}
}
