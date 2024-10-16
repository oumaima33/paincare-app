package DAO;
import entities.Diagnostic;
public interface DiagnosticDAO {
	void saveDiagnostic(Diagnostic responseBean);
	 Diagnostic getLastDiagnosticForUser(int userId) ;
}
