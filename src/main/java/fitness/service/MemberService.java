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
	//----------| 회원등록1 |----------//
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
	
	//----------| 회원상세보기(한명) |----------//
	public MemberDto listOne(int mem_num){
		return dao.listOne(mem_num);
	}
	//----------| 회원삭제하기 |----------//	
	public int memDelete(int mem_num){
		return dao.memDelete(mem_num);
	}
	
	//----------| 회원상세보기(한명) |----------//	
	public int memUpdate(MemberDto dto){
		return dao.memUpdate(dto);
	}
	//----------| 회원검색하기 |----------//	
	public List<MemberDto> memSearchList(HashMap<String, String> map){
		return dao.memSearchList(map);
	}
}
