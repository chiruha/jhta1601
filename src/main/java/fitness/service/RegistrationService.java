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
		
	//----------| ȸ���������(insert)(���̺��: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return dao.regiInsert(dto1);
	}
	public int getRgnum(int reginum){//���� ū rg_num������
		return dao.getRgnum();
	}
	//----------| �ܰ�������(insert)(���̺��: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return dao.prosignInsert(dto2);
	}
		
	//----------| pt������(insert)(���̺��: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return dao.ptsignInsert(dto3);
	}
	//----------| �ܰ����� �Ⱓ���(insert)(���̺��: properiod) |----------//
	public int properiodInsert(ProperiodDto dto4){
		return dao.properiodInsert(dto4);
	}
	//----------| pt���� �Ⱓ���(insert)(���̺��: ptperiod) |----------//
	public int ptperiodInsert(PtperiodDto dto5){
		return dao.ptperiodInsert(dto5);
	}
//////////////////////////////--| select |--////////////////////////////////
	//----------| ȸ���������:����¡ó��(select)(���̺��: registration) |----------//
	public int getCountRegi(){
		return dao.getCountRegi();
	}
	//----------| ȸ���������:��ü��Ϻ���(selectList)(���̺��: registration) |----------//
	public List<RegistrationDto> regiListAll(HashMap<String, Integer> map){
		return dao.regiListAll(map);
	}
	//----------| ȸ����ȣ�� ���� ��������(rg_type)�� ��ü��Ϻ���(���̺��: prosign,ptsign) |----------//
	//�ܰ�����
	public ProsignDto prosignListone(HashMap<String, Integer> map1){
		return dao.prosignListone(map1);
	}
	/*
	//-- �ܰ���, ��ϰ����� �̾ƿ���
	public ProsignDto prosignListoneName(String pro_code){
		return dao.prosignListoneName(pro_code);
	}
	*/
	//PT����
	public PtsignDto ptsignListone(HashMap<String, Integer> map2){
		return dao.ptsignListone(map2);
	}
	/*
	//-- pt��, ��ϰ�����, Ƚ�� �̾ƿ��� 
	public PtsignDto ptsignListoneName(String pt_code){
		return dao.ptsingListoneName(pt_code);
	}
	*/
}
