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
	public int getRgnum(){//���� ū rg_num������
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
	//PT����
	public PtsignDto ptsignListone(HashMap<String, Integer> map2){
		return dao.ptsignListone(map2);
	}

////////////////////////////////--| Update |--////////////////////////////////	
	//update�ϱ� ���� getInfo
	public RegistrationDto regiGetInfo(HashMap<String, Integer>map){
		return dao.regiGetInfo(map);
	}
	//----------| ȸ���������(Update)(���̺��: registration) |----------//
	public int regiUpdate(RegistrationDto dto1){
		return dao.regiUpdate(dto1);
	}
	
	//----------| �ܰ�������(Update)(���̺��: prosign) |----------//
	public int prosignUpdate(ProsignDto dto2){
		return dao.prosignUpdate(dto2);
	}

	//----------| pt������(Update)(���̺��: ptsign) |----------//
	public int ptsignUpdate(PtsignDto dto3){
		return dao.ptsignUpdate(dto3);
	}

	//----------| �ܰ����� �Ⱓ���(Update)(���̺��: properiod) |----------//
	public int properiodUpdate(ProperiodDto dto4){
		return dao.properiodUpdate(dto4);
	}

	//----------| pt���� �Ⱓ���(Update)(���̺��: ptperiod) |----------//
	public int ptperiodUpdate(PtperiodDto dto5){
		return dao.ptperiodUpdate(dto5);
	}
////////////////////////////////--| Delete |--////////////////////////////////	
	//-- delete �������� :registration(�������rg_type) table
	public int regiDel(int rg_num){
		return dao.regiDel(rg_num);
	}
	//-- delete �������� :prosign(�ܰ�������) table
	public int prosignDel(int rg_num){
		return dao.prosignDel(rg_num);
	}
	//-- delete �������� :ptsign(pt���) table
	public int ptsignDel(int rg_num){
		return dao.ptsignDel(rg_num);
	}
	//-- delete �������� :properiod(�ܰ�-��Ⱓ���) table
	public int properiodDel(int rg_num){
		return dao.properiodDel(rg_num);
	}
	//-- delete �������� :ptperiod(pt-��Ⱓ���) table
	public int ptperiodDel(int rg_num){
		return dao.ptperiodDel(rg_num);
	}
	//-- pt�� register
	public RegistrationDto ptRe(int mem_num){
		return dao.ptRe(mem_num);
	}
	
}
