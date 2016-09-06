package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fitness.service.CommentsListService;

@Controller
public class CommentsListController {
	@Autowired private CommentsListService service;
	
	
}
