package fitness.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.DepartmentDao;
import fitness.dto.DepartmentDto;

@Service
public class DepartmentService {
	@Autowired private DepartmentDao dao;
	public int insertService(DepartmentDto dto){
		return dao.insertDao(dto);
	}
	public List<DepartmentDto> listService(){
		return dao.listDao();
	}
	public DepartmentDto detailService(int num){
		return dao.detailDao(num);
	}
	public int updateService(DepartmentDto dto){
		return dao.updateDao(dto);
	}
	public int deleteService(int num){
		return dao.deleteDao(num);
	}
}
