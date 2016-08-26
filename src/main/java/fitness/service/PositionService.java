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
}
