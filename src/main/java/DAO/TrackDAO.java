package DAO;
import entities.Track;

import java.util.List;
public interface TrackDAO {
	Track getById(int id);
    List<Track> getAll();
    void insert(Track track);
  
}
