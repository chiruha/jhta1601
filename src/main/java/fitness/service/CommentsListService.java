package fitness.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.CommentsListDao;
import fitness.dto.CommentsListDto;

@Service
public class CommentsListService {
	@Autowired CommentsListDao dao;
	
	public List<CommentsListDto> commlist(){
		return dao.commlist();
	}
}
