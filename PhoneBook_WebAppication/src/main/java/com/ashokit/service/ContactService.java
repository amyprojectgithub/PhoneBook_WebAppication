package com.ashokit.service;

import java.util.List;

import com.ashokit.model.Contact;

public interface ContactService {
	boolean save(Contact contact);
	List<Contact> getAllContacts();
	Contact getContactById(Integer id);
	boolean deleteContact(Integer id);

}
