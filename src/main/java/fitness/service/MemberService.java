package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.MemberDao;
import fitness.dto.MemberDto;

@Service
public class MemberService {
	@Autowired MemberDao dao;
	//----------| 회원등록 |----------//
	public int insert(MemberDto dto){
		return dao.insert(dto);
	}
	//----------| 회원전체목록보기 |----------//
	public int getMemCount(){
		return dao.getMemCount();
	}
	public List<MemberDto> list(HashMap<String, Integer> map){
		return dao.listAll(map);
	}
}
