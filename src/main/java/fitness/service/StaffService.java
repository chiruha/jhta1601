package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.StaffDao;
import fitness.dto.StaffDto;

@Service
public class StaffService {
	@Autowired StaffDao dao;
	public int insertService(StaffDto dto){
		return dao.insertDao(dto);
	}
	public int updateService(StaffDto dto){
		return dao.updateDao(dto);
	}
	public StaffDto detailService(int num){
		return dao.detailDao(num);
	}
	public List<StaffDto> listService(HashMap<String, Object> map){
		return dao.listDao(map);
	}
	public int deleteService(int num){
		return dao.deleteDao(num);
	}
	public int getStfCount(HashMap<String, Object> map){
		return dao.getStfCount(map);
	}
	public List<StaffDto> ptstafflist(){
		return dao.ptstafflist();
	}
}
