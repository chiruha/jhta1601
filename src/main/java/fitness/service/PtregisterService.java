package fitness.service;

import java.util.HashMap;
import java.util.List;

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
	public PtregisterDto detailService(int num){
		return ptregisterDao.detailDao(num);
	}
	public List<PtregisterDto>  ptOkService(HashMap<String, Object> map){
		return ptregisterDao.list(map);
	}
	public List<PtregisterDto>  ptmemOkService(HashMap<String, Object> map){
		return ptregisterDao.memlist(map);
	}
	
	public int ptrOkupdate(PtregisterDto dto){
		return ptregisterDao.ptrOkupdate(dto);
	}
	
	
}
