package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


import entities.Diagnostic;


public class DiagnosticDAOImpl implements DiagnosticDAO {
private Connection connection;
public DiagnosticDAOImpl(Connection connection) {
    this.connection = connection;
}
@Override

public void saveDiagnostic(Diagnostic responseBean) {
   
        String insertQuery = "INSERT INTO diagnostic (user_id, answers,risk) VALUES (?, ?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
          
            preparedStatement.setInt(1, responseBean.getUser_id()); 

            String answersString = String.join(",", responseBean.getResponses());
            preparedStatement.setString(2, answersString);
            String riskLevel = responseBean.evaluateRiskLevel();
            preparedStatement.setString(3, riskLevel);
     
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
public Diagnostic getLastDiagnosticForUser(int userId)  {
    Diagnostic lastDiagnostic = null;

    String selectQuery = "SELECT * FROM diagnostic WHERE user_id = ? ORDER BY id DESC LIMIT 1";

    try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
        preparedStatement.setInt(1, userId);

        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                lastDiagnostic = mapResultSetToDiagnostic(resultSet);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return lastDiagnostic;
}

private Diagnostic mapResultSetToDiagnostic(ResultSet resultSet) throws SQLException {
    Diagnostic diagnostic = new Diagnostic();
    diagnostic.setId(resultSet.getInt("id"));
    diagnostic.setUser_id(resultSet.getInt("user_id"));
    diagnostic.setRiskLevel(resultSet.getString("risk"));

    // Assuming that the 'answers' column in the database stores responses as a comma-separated string
    String answersString = resultSet.getString("answers");
    List<String> responses = Arrays.asList(answersString.split(","));
    diagnostic.setResponses(responses);

    return diagnostic;
}

}