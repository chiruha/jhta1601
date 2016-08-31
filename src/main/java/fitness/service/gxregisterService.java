package fitness.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.GxregisterDao;
import fitness.dao.PtregisterDao;
import fitness.dto.GxregisterDto;
import fitness.dto.PtregisterDto;



@Service
public class gxregisterService {
	@Autowired GxregisterDao gxregisterDao;
	
	public int insert(GxregisterDto dto){
		return gxregisterDao.insert(dto);
	}
	public GxregisterDto detail(int gx_num){
		return gxregisterDao.detail(gx_num);
	}
	
	
}
