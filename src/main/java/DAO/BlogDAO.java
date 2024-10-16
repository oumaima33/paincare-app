package DAO;

import java.sql.SQLException;
import java.util.List;

import entities.Commentaire;

import entities.blog;

public interface BlogDAO {
	blog  getByid(int id);
	List<blog> getAll();
    void insert(blog blog);
    void update(blog blog);
    void delete(int id);
	void addComment(int blogId, String commentContent);
	List<Commentaire> getCommentsByBlogId(int id) throws SQLException;
	List <blog> searchByTitle( String searchQuery) throws SQLException;
}
