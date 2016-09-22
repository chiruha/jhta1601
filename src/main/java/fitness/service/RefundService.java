package fitness.service;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import fitness.dao.RefundDao;
import fitness.dto.RefundDto;
import fitness.dto.RegistrationDto;


@Service
public class RefundService {
	@Autowired private RefundDao refundDao;
	
	//----------| ȸ���������(insert)(���̺��: registration) |----------//
		public int regiInsert(RefundDto refundDto){
			return refundDao.insert(refundDto);
		}
		
		public List<RegistrationDto> refundrgnum(HashMap<String, Object>map){
			return refundDao.refundrgnumlist(map);
		}		
		public List<RefundDto> refundlist(){
			return refundDao.refundlist();
		}

	
	
	
}
