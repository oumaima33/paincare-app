package entities;

import java.util.Date;

public class User {
	private int id;
	private String email;
	private String password;
	private String  name;
	private String image_url;
	
	
	
	
	public User() {
		super();
	}
	public User(int id, String email, String password, String  name, String image_url) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.image_url = image_url;
	}
	public User(int id, String email, String password, String name) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
	}
	public User(String email, String password, String name) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the naissance
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param naissance the naissance to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the image_url
	 */
	public String getImage_url() {
		return image_url;
	}
	/**
	 * @param image_url the image_url to set
	 */
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	
}
