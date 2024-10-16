package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entities.User;
public class UsersDAOImpl implements UsersDAO {

    private Connection connection;

    // Le constructeur prend une connexion à la base de données
    public UsersDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public User getByid(int id) {
        User user = null;
        String query = "SELECT * FROM user WHERE uid = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("uid"));
                user.setName(resultSet.getString("uname"));
                user.setEmail(resultSet.getString("uemail"));
                user.setPassword(resultSet.getString("upwd"));
                user.setImage_url(resultSet.getString("photo"));



                
                
                // Ajoutez d'autres attributs en fonction de votre modèle User
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM user";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("uid"));
                user.setName(resultSet.getString("uname"));
                // Ajoutez d'autres attributs en fonction de votre modèle User
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    

    @Override
    public void delete(int id) {
        String query = "DELETE FROM user WHERE uid = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(User usr) {
        String query = "UPDATE user SET uname = ?, upwd = ?, uemail=?, photo=? WHERE uid = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, usr.getName());
            preparedStatement.setString(2, usr.getPassword());
            preparedStatement.setString(3, usr.getEmail());
            preparedStatement.setString(4, usr.getImage_url());


            preparedStatement.setInt(5, usr.getId());
            // Ajoutez d'autres attributs en fonction de votre modèle User
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

