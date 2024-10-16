package entities;

import java.util.Date;

public class Commentaire {
	public Commentaire() {
		super();
	}
	private int id;
	private int id_blog;
	private String comment;
	private Date date;
	
	
	
	public Commentaire(int id_blog, String comment, Date date) {
		super();
		this.id_blog = id_blog;
		this.comment = comment;
		this.date = date;
	}
	public Commentaire(int id, int id_blog, String comment, Date date) {
		super();
		this.id = id;
		this.id_blog = id_blog;
		this.comment = comment;
		this.date = date;
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
	 * @return the id_blog
	 */
	public int getId_blog() {
		return id_blog;
	}
	/**
	 * @param id_blog the id_blog to set
	 */
	public void setId_blog(int id_blog) {
		this.id_blog = id_blog;
	}
	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
