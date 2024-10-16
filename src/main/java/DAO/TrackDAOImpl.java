package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


import entities.Track;
import enums.Feelings;
import enums.PainWorse;
import enums.Painlocation;
import enums.SymptomType;

public class TrackDAOImpl implements TrackDAO {
private Connection connection;
	
	public TrackDAOImpl(Connection connection) {
        this.connection = connection;
    }
	@Override
	public Track getById(int id) {
		Track track = null;
        String sql = "SELECT * FROM track WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	track= new Track();
            	track.setId(resultSet.getInt("id"));
                track.setPainlevel(resultSet.getInt("Painlevel"));
                track.setDate(resultSet.getString("Date"));
             // Récupérer la chaîne de caractères des emplacements de douleur depuis la base de données
                String painLocString = resultSet.getString("PainLoc");
                // Convertir la chaîne de caractères en une liste d'énumérations Painlocation
                List<Painlocation> painLoc = Arrays.stream(painLocString.split(","))
                                                   .map(Painlocation::valueOf)
                                                   .collect(Collectors.toList());
                track.setPainLoc(painLoc);

                // Récupérer la chaîne de caractères des symptômes depuis la base de données
                String symptomsString = resultSet.getString("Symptoms");
                // Convertir la chaîne de caractères en une liste d'énumérations SymptomType
                List<SymptomType> symptoms = Arrays.stream(symptomsString.split(","))
                                                   .map(SymptomType::valueOf)
                                                   .collect(Collectors.toList());
                track.setSymptoms(symptoms);

                // Récupérer la chaîne de caractères des objectifs depuis la base de données
                String painWorseString = resultSet.getString("Painworse");
                // Convertir la chaîne de caractères en une liste d'énumérations PainWorse
                List<PainWorse> painWorse = Arrays.stream(painWorseString.split(","))
                                                 .map(PainWorse::valueOf)
                                                 .collect(Collectors.toList());
                track.setPainWorse(painWorse);

                // Récupérer la chaîne de caractères des lieux depuis la base de données
                String feelingsString = resultSet.getString("Feelings");
                // Convertir la chaîne de caractères en une liste d'énumérations Feelings
                List<Feelings> feelings = Arrays.stream(feelingsString.split(","))
                                               .map(Feelings::valueOf)
                                               .collect(Collectors.toList());
                track.setFeelings(feelings); 

               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return track;
	}

	@Override
	public List<Track> getAll() {
		List<Track> tracks = new ArrayList<>();
        String sql = "SELECT * FROM track";

        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
            	Track track = new Track();
            	track.setId(resultSet.getInt("id"));
                track.setPainlevel(resultSet.getInt("Painlevel"));
                track.setDate(resultSet.getString("Date"));
             // Récupérer la chaîne de caractères des emplacements de douleur depuis la base de données
                String painLocString = resultSet.getString("PainLoc");
                // Convertir la chaîne de caractères en une liste d'énumérations Painlocation
                List<Painlocation> painLoc = Arrays.stream(painLocString.split(","))
                                                   .map(Painlocation::valueOf)
                                                   .collect(Collectors.toList());
                track.setPainLoc(painLoc);

                // Récupérer la chaîne de caractères des symptômes depuis la base de données
                String symptomsString = resultSet.getString("Symptoms");
                // Convertir la chaîne de caractères en une liste d'énumérations SymptomType
                List<SymptomType> symptoms = Arrays.stream(symptomsString.split(","))
                                                   .map(SymptomType::valueOf)
                                                   .collect(Collectors.toList());
                track.setSymptoms(symptoms);

                // Récupérer la chaîne de caractères des objectifs depuis la base de données
                String painWorseString = resultSet.getString("Painworse");
                // Convertir la chaîne de caractères en une liste d'énumérations PainWorse
                List<PainWorse> painWorse = Arrays.stream(painWorseString.split(","))
                                                 .map(PainWorse::valueOf)
                                                 .collect(Collectors.toList());
                track.setPainWorse(painWorse);

                // Récupérer la chaîne de caractères des lieux depuis la base de données
                String feelingsString = resultSet.getString("Feelings");
                // Convertir la chaîne de caractères en une liste d'énumérations Feelings
                List<Feelings> feelings = Arrays.stream(feelingsString.split(","))
                                               .map(Feelings::valueOf)
                                               .collect(Collectors.toList());
                track.setFeelings(feelings);

              
                tracks.add(track);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tracks;
	}

	
	@Override
	public void insert(Track track) {
	    String sql = "INSERT INTO track ( Painlevel, PainLoc, symptoms, Painworse, Feelings, Date) VALUES (?, ?, ?, ?, ?,?)";



	    try (PreparedStatement statement = connection.prepareStatement(sql)) {
	      
	        statement.setInt(1, track.getPainlevel());

	        // Convertir la liste d'énumérations PainLocation en une chaîne de caractères
	        String painLocString = track.getPainLoc().stream()
	                .map(Enum::name)
	                .collect(Collectors.joining(","));
	        statement.setString(2, painLocString);

	        // Convertir la liste d'énumérations SymptomType en une chaîne de caractères
	        String symptomsString = track.getSymptoms().stream()
	                .map(Enum::name)
	                .collect(Collectors.joining(","));
	        statement.setString(3, symptomsString);

	        // Convertir la liste d'énumérations PainWorse en une chaîne de caractères
	        String painWorseString = track.getPainWorse().stream()
	                .map(Enum::name)
	                .collect(Collectors.joining(","));
	        statement.setString(4, painWorseString);

	        // Convertir la liste d'énumérations Feelings en une chaîne de caractères
	        String feelingsString = track.getFeelings().stream()
	                .map(Enum::name)
	                .collect(Collectors.joining(","));
	        statement.setString(5, feelingsString);

	        statement.setString(6, track.getDate());

	        statement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

    }



