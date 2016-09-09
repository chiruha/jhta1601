package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.ProgramPriceDao;
import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;

@Service
public class ProgramPriceService {
	@Autowired ProgramPriceDao dao;
	//------------------|ȸ����ȣ �˻��ϱ�(���̺��: member)|------------------//
	
	public List<MemberDto> memNum(HashMap<String, Object> map){
		return dao.memNum(map);
	}
	/*
	public MemberDto memNum(int mem_num){
		return dao.memNum(mem_num);
	}
	*/
	//------------------|�ܰ����� select(���̺��: programprice)|------------------//
	public List<ProgramPriceDto> list(HashMap<String, Integer> map){
		return dao.list(map);
	}
	public ProgramPriceDto proPirce(String pro_name){//�������ϸ� �ش簡�� �̾ƿ���
		return dao.proPrice(pro_name);
	}
	//------------------|pt���� select(���̺��: ptprice)|------------------//
	public List<PtPriceDto> ptlist(HashMap<String, Integer> map){
		return dao.ptlist(map);
	}
	public PtPriceDto ptPrice(String pt_name){//�������ϸ� �ش簡�� �̾ƿ���
		System.out.println("ptPrice Service: "+pt_name);
		return dao.ptPrice(pt_name);
	}
}
