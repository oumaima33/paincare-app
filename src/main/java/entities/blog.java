package entities;

import java.util.Date;

public class blog {
	private int id;
	private String image_url;
	private String titre;
	private String description;
	private Date creation;
	private int userId;
	private int nbr_pub;
	
	
	
	
	public blog() {
		super();
	}
	public blog(String image_url, String titre, String desription, Date creation, int userId, int nbr_pub) {
		super();
		this.image_url = image_url;
		this.titre = titre;
		this.description = desription;
		this.creation = creation;
		this.userId = userId;
		this.nbr_pub = nbr_pub;
	}
	public blog(int id, String image_url, String titre, String description, Date creation, int userId, int nbr_pub) {
		super();
		this.id = id;
		this.image_url = image_url;
		this.titre = titre;
		this.description = description;
		this.creation = creation;
		this.userId = userId;
		this.nbr_pub = nbr_pub;
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
	/**
	 * @return the titre
	 */
	public String getTitre() {
		return titre;
	}
	/**
	 * @param titre the titre to set
	 */
	public void setTitre(String titre) {
		this.titre = titre;
	}
	/**
	 * @return the desription
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param desription the desription to set
	 */
	public void setDescription(String desription) {
		this.description = desription;
	}
	/**
	 * @return the creation
	 */
	public Date getCreation() {
		return creation;
	}
	/**
	 * @param creation the creation to set
	 */
	public void setCreation(Date creation) {
		this.creation = creation;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the nbr_pub
	 */
	public int getNbr_pub() {
		return nbr_pub;
	}
	/**
	 * @param nbr_pub the nbr_pub to set
	 */
	public void setNbr_pub(int nbr_pub) {
		this.nbr_pub = nbr_pub;
	}
	
	

}
