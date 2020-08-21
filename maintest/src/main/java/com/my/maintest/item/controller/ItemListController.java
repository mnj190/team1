package com.my.maintest.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.maintest.item.dao.ItemListDAO;
import com.my.maintest.item.svc.ItemListSVC;
import com.my.maintest.item.vo.ItemCategoryVO;
import com.my.maintest.item.vo.ItemVO;
import com.my.maintest.item.vo.ListVO;
import com.my.maintest.member.vo.MemberVO;

@Controller
@RequestMapping("/itemlist")
public class ItemListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemListController.class);
	@Inject
	ItemListDAO itemListDAO;
	
	@Inject
	ItemListSVC itemListSVC;
		
	@GetMapping("category2")
	public String itemForm2(
			ItemVO itemVO,
			ItemCategoryVO itemCategoryVO,
			Model model) {
		
		model.addAttribute("categoryList", itemListSVC.selectAllCategory());
		model.addAttribute("itemList", itemListSVC.selectAllItem());
		
		return "/packinglist/packingList2";
	}	
	

	@PostMapping(value="/lname", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map> lname(@RequestBody HashMap<String, String> map) {
		ResponseEntity<Map> res = null;
		
		int result = 0;
		int lnum= 0; 
		
		String ucode = map.get("ucode");
		String lname = map.get("lname");
		
		result = itemListSVC.listNameInsert(ucode, lname);
		lnum = itemListSVC.getNum(ucode, lname);
		map.put("lnum", String.valueOf(lnum));
		Map<String, Object> resultMap = new HashMap<>();
		
		if(result ==1) {
			map.put("rtcode","00");
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
			}else {
				map.put("rtcode","01");
				res = new ResponseEntity<Map>(map, HttpStatus.OK);
			}
		return res;		
	}

	//세션추가
	@RequestMapping(value="/saveListForm", method=RequestMethod.POST)
	public String inum(
			@RequestParam(value="inum" , required = false) List<String> inum,
			@RequestParam(value="iname", required = false) List<String> iname,
			@RequestParam(value="icount", required = false) List<String> icount,	
			@RequestParam(value="icategory", required = false) List<String> icategory,
			@RequestParam(value="ichecked", required = false) List<String> checked,	
			Model model) {
		

		List<Map<String, String>> listing = new ArrayList<Map<String, String>>();
		if(inum!=null) {
		for(int i=0; i<inum.size(); i++) {
			Map<String, String> itemMap = new HashMap<>();
			itemMap.put("inum", inum.get(i));
			itemMap.put("iname", iname.get(i));
			itemMap.put("icategory", icategory.get(i));
			itemMap.put("icount", icount.get(i));
			itemMap.put("checked", checked.get(i));
			listing.add(i,itemMap);
			}		
		}
		String ucode = "0";
		List<ListVO> listVO = null;
		listVO = itemListSVC.loadList(ucode);
		
		model.addAttribute("list", listVO);
		model.addAttribute("listing", listing);
		
		return "/packinglist/saveListForm";
	}
	
	
	

}
