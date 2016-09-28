package fitness.service;

import java.util.HashMap;
import java.util.List;

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
	public int payCnt(HashMap<String, Object> map){
		return   dao.payCnt(map);
	}
	public List<PaymentDto> payList(HashMap<String, Object> map){
		return   dao.payList(map);
	}
}
