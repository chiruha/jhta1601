package fitness.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.PtregisterDao;
import fitness.dto.PtregisterDto;



@Service
public class PtregisterService {
	@Autowired PtregisterDao ptregisterDao;
	public int insert(PtregisterDto dto){
		return ptregisterDao.insert(dto);
	}
}
