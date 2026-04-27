package edu.poly.entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Accounts")
public class Account implements Serializable{
	@Id
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	@NotBlank 
	@Column(name = "Fullname")
	private String fullname;
	@NotBlank
	@Email
	private String email;
	@Column(name = "Photo")
	private String photo = "default.jpg";

	@Column(name = "Activated")
	private Boolean activated = false;

	@Column(name = "Admin")
	private Boolean admin = false;
	//...
	@OneToMany(mappedBy = "account")
	private List<Order> orders;
	@OneToMany(mappedBy = "accountCart")
	private List<Cart> accountCarts;
}
