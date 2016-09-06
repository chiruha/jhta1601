package fitness.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.RegistrationDao;
import fitness.dto.ProperiodDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

@Service
public class RegistrationService {
	@Autowired RegistrationDao dao;
		
	//----------| 회원수강등록(insert)(테이블명: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return dao.regiInsert(dto1);
	}
	public int getRgnum(){//가장 큰 rg_num얻어오기
		return dao.getRgnum();
	}

	//----------| 단과과목등록(insert)(테이블명: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return dao.prosignInsert(dto2);
	}
		
	//----------| pt과목등록(insert)(테이블명: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return dao.ptsignInsert(dto3);
	}
	//----------| 단과과목 기간등록(insert)(테이블명: properiod) |----------//
	public int properiodInsert(ProperiodDto dto4){
		return dao.properiodInsert(dto4);
	}
	//----------| pt과목 기간등록(insert)(테이블명: ptperiod) |----------//
	public int ptperiodInsert(PtperiodDto dto5){
		return dao.ptperiodInsert(dto5);
	}
//////////////////////////////--| select |--////////////////////////////////
	//----------| 회원수강등록:페이징처리(select)(테이블명: registration) |----------//
	public int getCountRegi(){
		return dao.getCountRegi();
	}
	//----------| 회원수강등록:전체목록보기(selectList)(테이블명: registration) |----------//
	public List<RegistrationDto> regiListAll(HashMap<String, Integer> map){
		return dao.regiListAll(map);
	}
	//----------| 회원번호에 따른 과목유형(rg_type)별 전체목록보기(테이블명: prosign,ptsign) |----------//
	//단과과목
	public ProsignDto prosignListone(HashMap<String, Integer> map1){
		return dao.prosignListone(map1);
	}
	//PT과목
	public PtsignDto ptsignListone(HashMap<String, Integer> map2){
		return dao.ptsignListone(map2);
	}

////////////////////////////////--| Update |--////////////////////////////////	
	//update하기 위한 getInfo
	public RegistrationDto regiGetInfo(HashMap<String, Integer>map){
		return dao.regiGetInfo(map);
	}
	//----------| 회원수강등록(Update)(테이블명: registration) |----------//
	public int regiUpdate(RegistrationDto dto1){
		return dao.regiUpdate(dto1);
	}
	
	//----------| 단과과목등록(Update)(테이블명: prosign) |----------//
	public int prosignUpdate(ProsignDto dto2){
		return dao.prosignUpdate(dto2);
	}

	//----------| pt과목등록(Update)(테이블명: ptsign) |----------//
	public int ptsignUpdate(PtsignDto dto3){
		return dao.ptsignUpdate(dto3);
	}

	//----------| 단과과목 기간등록(Update)(테이블명: properiod) |----------//
	public int properiodUpdate(ProperiodDto dto4){
		return dao.properiodUpdate(dto4);
	}

	//----------| pt과목 기간등록(Update)(테이블명: ptperiod) |----------//
	public int ptperiodUpdate(PtperiodDto dto5){
		return dao.ptperiodUpdate(dto5);
	}
////////////////////////////////--| Delete |--////////////////////////////////	
	//-- delete 수강정보 :registration(등록유형rg_type) table
	public int regiDel(int rg_num){
		return dao.regiDel(rg_num);
	}
	//-- delete 수강정보 :prosign(단과과목등록) table
	public int prosignDel(int rg_num){
		return dao.prosignDel(rg_num);
	}
	//-- delete 수강정보 :ptsign(pt등록) table
	public int ptsignDel(int rg_num){
		return dao.ptsignDel(rg_num);
	}
	//-- delete 수강정보 :properiod(단과-운동기간등록) table
	public int properiodDel(int rg_num){
		return dao.properiodDel(rg_num);
	}
	//-- delete 수강정보 :ptperiod(pt-운동기간등록) table
	public int ptperiodDel(int rg_num){
		return dao.ptperiodDel(rg_num);
	}
	//-- pt용 register
	public RegistrationDto ptRe(int mem_num){
		return dao.ptRe(mem_num);
	}
	
}
