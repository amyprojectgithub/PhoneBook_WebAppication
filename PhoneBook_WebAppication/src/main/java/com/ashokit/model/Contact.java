package com.ashokit.model;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
public class Contact implements Serializable{
	private static final long serialVersionUID = 6777358629706530489L;

	private Integer conatctId;
	private String contactName;
	private String contactEmail;
	private Long contactNo;
	private Date createdDate;
	private Date updatedDate;
}
