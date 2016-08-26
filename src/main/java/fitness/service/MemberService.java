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
	//----------| ȸ�����1 |----------//
	public int insert(MemberDto dto){
		return dao.insert(dto);
	}
	//----------| ȸ����ü��Ϻ��� |----------//
	public int getMemCount(){
		return dao.getMemCount();
	}
	public List<MemberDto> list(HashMap<String, Integer> map){
		return dao.listAll(map);
	}
	
	//----------| ȸ���󼼺���(�Ѹ�) |----------//
	public MemberDto listOne(int mem_num){
		return dao.listOne(mem_num);
	}
	//----------| ȸ�������ϱ� |----------//	
	public int memDelete(int mem_num){
		return dao.memDelete(mem_num);
	}
	
	//----------| ȸ���󼼺���(�Ѹ�) |----------//	
	public int memUpdate(MemberDto dto){
		return dao.memUpdate(dto);
	}
	//----------| ȸ���˻��ϱ� |----------//	
	public List<MemberDto> memSearchList(HashMap<String, String> map){
		return dao.memSearchList(map);
	}
}
