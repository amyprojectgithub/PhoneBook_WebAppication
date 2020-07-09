package com.ashokit.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ashokit.entity.ContactEntity;
import com.ashokit.model.Contact;
import com.ashokit.repo.ContactRepository;

@Service
public class ContactServiceImpl implements ContactService {
	@Autowired
	private ContactRepository repo;

	@Override
	public boolean save(Contact contact) {		
		//convert Contact to ContactEntity
		ContactEntity entity=new ContactEntity();
		BeanUtils.copyProperties(contact, entity);
		ContactEntity contactEntity = repo.save(entity);
		return contactEntity.getConatctId()!=null;
	}

	@Override
	public List<Contact> getAllContacts() {
		List<ContactEntity> contactEntityList = repo.findAll();
		//convert List<ContactEntity> to List<Contact>
		return contactEntityList.stream().map(contactEntity->{
			//converting ContactEntity to Contact
			Contact contact=new Contact();
			BeanUtils.copyProperties(contactEntity, contact);
			return contact;
		}).collect(Collectors.toList());
	}

	@Override
	public Contact getContactById(Integer id) {
		Optional<ContactEntity> optional = repo.findById(id);
		if(optional.isPresent()) {
			 ContactEntity contactEntity = optional.get();
			 //convert ContactEntity to Contact obj
			 Contact contact=new Contact();
			 BeanUtils.copyProperties(contactEntity, contact);
			 return contact;
		}
		return null;
	}

	@Override
	public boolean deleteContact(Integer id) {
		repo.deleteById(id);
		return true;
	}

}
