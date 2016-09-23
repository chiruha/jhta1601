package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.RefundDayDao;
import fitness.dto.MemberDto;
import fitness.dto.RefundDayImpleDto;
import fitness.dto.RegistrationDto;

@Service
public class RefundDayService {
	@Autowired private RefundDayDao refundDayDao;
	
	public List<RegistrationDto> totregimoney(int mem_num){		
		return refundDayDao.totregimoney(mem_num);
	}
	public List<MemberDto> memNaSeList(HashMap<String, Object>map){
		return refundDayDao.memNaSeList(map);
	}
	public List<RefundDayImpleDto> ptgxoneday(int mem_num){
		return refundDayDao.ptgxoneday(mem_num);
	}

	
	
	
}
