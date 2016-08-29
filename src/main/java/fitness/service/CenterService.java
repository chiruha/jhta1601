package fitness.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.CenterDao;
import fitness.dto.CenterDto;

@Service
public class CenterService {
	@Autowired private CenterDao dao;
	public int insertService(CenterDto dto){
		return dao.insertDao(dto);
	}
	public List<CenterDto> listService(){
		return dao.listDao();
	}
	public CenterDto detailService(int num){
		return dao.detailDao(num);
	}
	public int deleteService(int num){
		return dao.deleteDao(num);
	}
	public int updateService(CenterDto dto){
		return dao.updateDao(dto);
	}
	
}
