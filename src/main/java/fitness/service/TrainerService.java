package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.TrainerDao;
import fitness.dto.TrainerDto;

@Service
public class TrainerService {
	@Autowired TrainerDao dao;
	public int insertService(TrainerDto dto){
		return dao.insertDao(dto);
	}
	public int updateService(TrainerDto dto){
		return dao.updateDao(dto);
	}
	public TrainerDto detailService(int num){
		return dao.detailDao(num);
	}
	public TrainerDto detail2Service(int num){
		return dao.detail2Dao(num);
	}
	public List<TrainerDto> listService(HashMap<String, Object> map){
		return dao.listDao(map);
	}
	public int deleteService(int num){
		return dao.deleteDao(num);
	}
	public int getTrCount(HashMap<String, Object> map){
		return dao.getTrCount(map);
	}
}
