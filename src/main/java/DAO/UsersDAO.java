package DAO;

import java.util.List;
import entities.User;

public interface UsersDAO {
	User  getByid(int id);
	List<User> getAll();
    void delete(int id);
    void update(User usr);
}
