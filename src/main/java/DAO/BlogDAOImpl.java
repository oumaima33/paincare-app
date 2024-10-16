package DAO;

import java.sql.Connection;


import java.sql.ResultSet;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entities.blog;
import entities.Commentaire;
public class BlogDAOImpl implements BlogDAO{
private Connection connection;
	
	public BlogDAOImpl(Connection connection) {
        this.connection = connection;
    }
	@Override
	public blog getByid(int id) {
		blog blog = null;
        String query = "SELECT * FROM blogs WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setInt(1, id);
        	ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	blog.setId(resultSet.getInt("id"));
                blog.setImage_url(resultSet.getString("image_url"));
                blog.setTitre(resultSet.getString("titre"));
                blog.setDescription(resultSet.getString("description"));
                blog.setCreation(resultSet.getDate("creation"));
                blog.setUserId(resultSet.getInt("userId"));
                blog.setNbr_pub(resultSet.getInt("nbr_pub"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
	}

	@Override
	public List<blog> getAll() {
		 List<blog> blogs = new ArrayList<>();
	        String query = "SELECT * FROM blogs";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
	             ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                blog blog = mapResultSetToBlog(resultSet);
	                blogs.add(blog);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return blogs;
	}

	@Override
	public void insert(blog blog) {
		String query = "INSERT INTO blogs (image_url, titre, description, creation, userId, nbr_pub) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, blog.getImage_url());
            preparedStatement.setString(2, blog.getTitre());
            preparedStatement.setString(3, blog.getDescription());
            preparedStatement.setDate(4, new java.sql.Date(blog.getCreation().getTime()));
            preparedStatement.setInt(5, blog.getUserId());
            preparedStatement.setInt(6, blog.getNbr_pub());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public void update(blog blog) {
		 String query = "UPDATE blogs SET image_url = ?, titre = ?, description = ?, creation = ?, userId = ?, nbr_pub = ? WHERE id = ?";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setString(1, blog.getImage_url());
	            preparedStatement.setString(2, blog.getTitre());
	            preparedStatement.setString(3, blog.getDescription());
	            preparedStatement.setDate(4, new java.sql.Date(blog.getCreation().getTime()));
	            preparedStatement.setInt(5, blog.getUserId());
	            preparedStatement.setInt(6, blog.getNbr_pub());
	            preparedStatement.setInt(7, blog.getId());
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
	}

	@Override
	public void delete(int id) {
		String query = "DELETE FROM blogs WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }		
	}
	private blog mapResultSetToBlog(ResultSet resultSet) throws SQLException {
        blog blog = new blog();
        blog.setId(resultSet.getInt("id"));
        blog.setImage_url(resultSet.getString("image_url"));
        blog.setTitre(resultSet.getString("titre"));
        blog.setDescription(resultSet.getString("description"));
        blog.setCreation(resultSet.getDate("creation"));
        blog.setUserId(resultSet.getInt("userId"));
        blog.setNbr_pub(resultSet.getInt("nbr_pub"));
        return blog;
    }
   
    public void addComment(int blogId, String commentContent) {
       
            // Requête SQL pour insérer un commentaire dans la base de données
            String sql = "INSERT INTO commentaire (id_blog, comment, date) VALUES (?, ?, NOW())";
           
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            	preparedStatement.setInt(1, blogId);
                preparedStatement.setString(2, commentContent);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
           

            
    }
	@Override
	public List<Commentaire> getCommentsByBlogId(int blogId) throws SQLException {
		List<Commentaire> comments = new ArrayList<>();
        String query = "SELECT * FROM commentaire WHERE id_blog = ?";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, blogId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Commentaire comment = new Commentaire();
                comment.setId(resultSet.getInt("id"));
                comment.setId_blog(resultSet.getInt("id_blog"));
                comment.setComment(resultSet.getString("comment"));
                comment.setDate(resultSet.getDate("date"));
                comments.add(comment);
            }
        }

        return comments;
	}
	@Override
	public List<blog> searchByTitle(String title) throws SQLException {
	    List<blog> searchResults = new ArrayList<>();

	    
	         PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM blogs WHERE titre LIKE ?") ;

	        preparedStatement.setString(1, "%" + title + "%");

	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                // Créez des objets Blog à partir des résultats de la base de données
	                blog blog = new blog();
	                blog.setId(resultSet.getInt("id"));
	                blog.setImage_url(resultSet.getString("image_url"));

	                blog.setTitre(resultSet.getString("titre"));
	                blog.setDescription(resultSet.getString("description"));
	                blog.setCreation(resultSet.getDate("creation"));
	                blog.setUserId(resultSet.getInt("userId"));
	                blog.setNbr_pub(resultSet.getInt("nbr_pub"));
	                searchResults.add(blog);
	            }
	        }
	    

	    return searchResults;
	}
	






	
}
