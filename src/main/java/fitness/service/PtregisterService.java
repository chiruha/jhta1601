package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.PtregisterDao;
import fitness.dto.GxsubjectDto;
import fitness.dto.PtregisterDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;



import fitness.dto.RegistrationDto;

import fitness.dto.PtrMemDto;




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
	public List<PtrMemDto>  ptmemOkService(HashMap<String, Object> map){
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
	public int ptr_numinfo(int mem_num){		
		return ptregisterDao.ptr_numinfo(mem_num);
	}
	public Integer ptrcount(int rg_num){
		return ptregisterDao.ptrcount(rg_num);
	}
	public int ptDelete(int ptr_num){
		return ptregisterDao.ptDelete(ptr_num);
	}
	public List<PtregisterDto> ptr_rg_numinfo(String rg_num){
		return ptregisterDao.ptr_rg_numinfo(rg_num);
	}
	public RegistrationDto regi_info(int mnum){
		return ptregisterDao.regi_info(mnum);
	}
	public PtsignDto ptsignOk(int mnum){
		return ptregisterDao.ptsignOk(mnum);
	}
	public int joong(int mnum){
		return ptregisterDao.joong(mnum);
	}
	public int joong2(int mnum){
		return ptregisterDao.joong2(mnum);
	}
	public Integer rowback(){
		return ptregisterDao.rowback();
	}
	
}
