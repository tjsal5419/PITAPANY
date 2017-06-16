package com.pitapany.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.Style;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {

	@Autowired
	private AccompanyBoardDao accompanyBoardDao;

	@Autowired
	private StyleDao styleDao;

	@RequestMapping("/matching")
	public String matching(Model model) {
		List<Style> list = styleDao.getList();
		model.addAttribute("styles", list);
		return "accompany.matching";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Model model, String id) {
		accompanyBoardDao.addHits(id);

		AccompanyBoard accompanyBoard = accompanyBoardDao.get(id);
		
		model.addAttribute("accDetail", accompanyBoard);

		return "accompany.detail";
	}

	@RequestMapping("/reg")
	public String reg(Model model) {
		return "accompany.reg";

	}

	@RequestMapping("/board")
	public String board(Model model) {
		return "accompany.board";

	}
}
