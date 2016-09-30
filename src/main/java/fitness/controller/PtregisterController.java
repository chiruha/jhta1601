package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.GxregisterDto;
import fitness.dto.PtregisterDto;
import fitness.dto.RegistrationDto;
import fitness.dto.StaffDto;
import fitness.dto.TrainerDto;
import fitness.dto.PtrMemDto;
import fitness.service.CenterService;
import fitness.service.PtregisterService;
import fitness.service.RegistrationService;
import fitness.service.StaffService;
import fitness.service.TrainerService;
import fitness.service.GxregisterService;
import fitness.service.MemberService;

@Controller
public class PtregisterController {
	@Autowired
	private PtregisterService service;
	@Autowired
	private CenterService cts;
	@Autowired
	private TrainerService trservice;
	@Autowired
	private RegistrationService regiservice;
	@Autowired
	private GxregisterService gxservice;

	@Autowired
	private MemberService mservice;

	@RequestMapping(value = "/ptrinsert", method = RequestMethod.GET)
	public String insert(HttpSession session) {
		List<CenterDto> ctlist = cts.listService();
		session.setAttribute("ctlist", ctlist);

		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TrainerDto> stlist = trservice.listService(map);
		System.out.println("stlist" + stlist);
		session.setAttribute("stlist", stlist);

		return ".exercise.PtRegisterView";
	}

	@RequestMapping(value = "/MemPTscOkView", method = RequestMethod.GET)
	public String memptscOkviewmove(HttpSession session) {
		System.out.println("MemPTscOkView도착");
		int mnum = (Integer) session.getAttribute("mnum");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mnum);
		List<PtrMemDto> list = service.ptmemOkService(map);
		System.out.println("map" + map);

		session.setAttribute("list", list);

		System.out.println("list:" + list);

		return ".exercise.MemPTscOkView";
	}

	@RequestMapping(value = "/PTscOkView", method = RequestMethod.GET)
	public String ptscOkviewmove(HttpSession session) {
		System.out.println("ptscOkviewmove도착");
		int snum = (Integer) session.getAttribute("snum");
		System.out.println("snum:" + snum);

		int tr_num = trservice.detail2Service(snum).getTr_num();
		System.out.println("tr_num:" + tr_num);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tr_num", tr_num);
		List<PtregisterDto> list = service.ptOkService(map);
		System.out.println(map);

		session.setAttribute("list", list);
		System.out.println(list);
		return ".exercise.PTscOkView";
	}

	@RequestMapping(value = "/PTokmResult", method = RequestMethod.POST)
	public String ptokmresult(HttpServletRequest request, PtregisterDto dto) {
		String ptr_num2 = request.getParameter("ptr_num2");
		if (ptr_num2 != null) {
			System.out.println("삭제");
			service.ptDelete(Integer.parseInt(ptr_num2));
			return "redirect:/PTscOkView";
		} else {
			String pokm = request.getParameter("okm");
			String ptr_num = request.getParameter("ptr_num");
			System.out.println("trainer 전송결과:" + pokm + "," + ptr_num);

			dto.setPtr_num(Integer.parseInt(ptr_num));
			dto.setPtr_ok(pokm);
			System.out.println("ok" + dto.getPtr_ok());
			System.out.println("num" + dto.getPtr_num());
			service.ptrOkupdate(dto);
			System.out.println("수정된 dto" + dto);
			return "redirect:/PTscOkView";
		}
	}

	@RequestMapping(value = "/ptrinsert", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object insert(PtregisterDto dto, HttpSession session) {
		System.out.println("ptrinsert 도착" + dto.toString());
		int mnum = (Integer) session.getAttribute("mnum");
		String mem_name = mservice.listOne(mnum).getMem_name();
		dto.setMem_name(mem_name);
		dto.setMem_num(mnum);

		try {
			int ptr_count = service.ptsignOk(mnum).getPtr_count();
			int rg_num = service.ptsignOk(mnum).getRg_num();
			dto.setPtr_count(ptr_count);
			dto.setRg_num(rg_num);
		} catch (Exception e) {
			System.out.println("널발생");
			int n = 9999;
			return n;
		}

		Integer n = service.rowback();
		System.out.println("n이다:" + n);
		System.out.println("2번째 DTO:" + dto);

		// ----중복처리 하면된다.--------------------------------------------
		PtregisterDto ptrdto = null;

		try {
			if (service.rowback() == 0) {
				service.insert(dto);
				int ptr_num = service.joong2(mnum);
				ptrdto = service.detailService(ptr_num);
				return ptrdto;
			} else if (mnum != service.joong(mnum)) {

			}
		} catch (Exception e) {
			service.insert(dto);
			int ptr_num = service.joong2(mnum);
			ptrdto = service.detailService(ptr_num);
			return ptrdto;
		}

		int nk = 9990;
		return nk;

	}

}
