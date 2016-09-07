package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.PtregisterDao;
import fitness.dto.GxsubjectDto;
import fitness.dto.PtregisterDto;
import fitness.dto.ptrMemDto;



@Service
public class PtregisterService {
	@Autowired PtregisterDao ptregisterDao;
	
	public int insert(PtregisterDto dto){
		return ptregisterDao.insert(dto);
	}
	public PtregisterDto detailService(int num){
		return ptregisterDao.detailDao(num);
	}
	public List<PtregisterDto>  ptOkService(HashMap<String, Object> map){
		return ptregisterDao.list(map);
	}
	public List<ptrMemDto>  ptmemOkService(HashMap<String, Object> map){
		return ptregisterDao.memlist(map);
	}
	
	public int ptrOkupdate(PtregisterDto dto){
		return ptregisterDao.ptrOkupdate(dto);
	}
	
	public int ptmaxNum(){
		return ptregisterDao.ptmaxNum();
	}
	public PtregisterDto ptrgDetail(int rg_num){
		return ptregisterDao.ptrgDetail(rg_num);
	}
	public PtregisterDto ptr_numinfo(int tr_num){		
		return ptregisterDao.ptr_numinfo(tr_num);
	}
	
	
}
