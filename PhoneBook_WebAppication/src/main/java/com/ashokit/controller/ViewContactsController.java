package com.ashokit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ashokit.model.Contact;
import com.ashokit.service.ContactService;

@Controller
@RequestMapping("/viewContact")
public class ViewContactsController {
	@Autowired
	private ContactService service;
	@GetMapping("/editContact")
	public String editMe( @RequestParam("id") Integer id, Model model) {
		Contact  getOneContact= service.getContactById(id);
		model.addAttribute("contact", getOneContact);
		return "contact";
	}

	@GetMapping("/deleteContact")
	public String deleteMe(@RequestParam("id")Integer id,Model model) {
		boolean isDeleted = service.deleteContact(id);
		if(isDeleted) {
			return "redirect:/contactInfo/viewAll";
		}
		return "viewContacts";
	}
}
