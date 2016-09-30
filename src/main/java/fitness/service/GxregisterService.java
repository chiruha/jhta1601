package fitness.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.GxregisterDao;
import fitness.dao.PtregisterDao;
import fitness.dto.GxregisterDto;
import fitness.dto.GxsubjectDto;
import fitness.dto.PtregisterDto;



@Service
public class GxregisterService {
	@Autowired GxregisterDao gxregisterDao;
	
	public int insert(GxregisterDto dto){
		return gxregisterDao.insert(dto);
	}
	public GxregisterDto detail(int gx_num){
		return gxregisterDao.detail(gx_num);
	}
	public GxregisterDto gxlist(String ct_name){
		return gxregisterDao.gxlist(ct_name);
	}
	public List<GxsubjectDto> gxsubject(){
		return gxregisterDao.gxsubject();
	}
	public String searchGx(String ct_name){
		return gxregisterDao.searchGx(ct_name);
	}
	
	
}
