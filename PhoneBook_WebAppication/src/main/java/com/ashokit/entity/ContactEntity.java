package com.ashokit.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import lombok.Data;

@Data
@Entity
@Table(name = "CONTACT_DTLS")
public class ContactEntity {
	@Id
	@SequenceGenerator(name = "cid_seq",
	sequenceName = "CONTACT_ID_SEQ",
	allocationSize = 1,
	initialValue = 1)
	@GeneratedValue(generator ="cid_seq",
	strategy = GenerationType.SEQUENCE)

	@Column(name ="CONTACT_ID")
	private Integer conatctId;
	@Column(name ="CONTACT_NAME")
	private String contactName;
	@Column(name ="CONTACT_EMAIL")
	private String contactEmail;
	@Column(name ="CONTACT_NO")
	private Long contactNo;

	/**
	 * TimeStamping
	 */
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name ="CREATED_DATE",updatable = false)
	private Date createdDate;
	@UpdateTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name ="UPDATED_DATE",insertable = false)
	private Date updatedDate; 
}
