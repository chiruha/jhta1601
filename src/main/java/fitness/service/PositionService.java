package fitness.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.PositionDao;
import fitness.dto.PositionDto;

@Service
public class PositionService {
	@Autowired private PositionDao dao;
	public int insertService(PositionDto dto){
		return dao.insertDao(dto);
	}
	public List<PositionDto> listService(){
		return dao.listDao();
	}
	public PositionDto detailService(String pos){
		return dao.detailDao(pos);
	}
	public int updateService(PositionDto dto){
		return dao.updateDao(dto);
	}
	public int deleteService(String pos){
		return dao.deleteDao(pos);
	}
}
