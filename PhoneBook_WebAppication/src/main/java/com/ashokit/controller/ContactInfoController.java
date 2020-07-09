package com.ashokit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ashokit.model.Contact;
import com.ashokit.service.ContactService;

@Controller
@RequestMapping("/contactInfo")
public class ContactInfoController {
	@Autowired
	private ContactService service;
	@GetMapping(value = {"/","/home"})
	public String loadForm(Model model) {
		//bind form with the form binding object aka Command object
		Contact contact=new Contact();
		model.addAttribute("contact", contact);	    
		return "contact";
	}

	@PostMapping("/saveContact")
	public String handleSubmitButton(@ModelAttribute("contact") Contact contact,RedirectAttributes attribute) {
		//use service
		boolean isSaved=service.save(contact);
		if(isSaved) 
			attribute.addFlashAttribute("succMsg", "Contact saved successfully");
		else
			attribute.addFlashAttribute("errorMsg", "Failed to save contact");
		attribute.addFlashAttribute("contact", new Contact());
		return "redirect:/contactInfo/redirectMe";
	}
	@GetMapping("/viewAll")
	public String handleViewAllLink(Model model) {
		List<Contact> allContacts = service.getAllContacts();
		model.addAttribute("contactList", allContacts);
		return "viewContacts";
	}
	/**
	 * @param model
	 * This method is meant to solve DoublePosting problem
	 * @return String
	 */
	@GetMapping("/redirectMe")
	public String solveDoublePost(Model model) {
		model.addAttribute("contact",new Contact());
		return "contact";
	}
}
