package entities;

import java.util.List;

import enums.Painlocation;
import enums.SymptomType;
import enums.PainWorse;
import enums.Feelings;

public class Track {
	private int id;
	private int Painlevel;
	private List<Painlocation> PainLoc;
	private List<SymptomType> symptoms;
	private List<PainWorse> Painworse;
	private List<Feelings> Feelings;
	private String Date;
	
	
	
	public Track(int id, int painlevel, List<Painlocation> painLoc, List<SymptomType> symptoms,
			List<PainWorse> painworse, List<enums.Feelings> feelings, String date) {
		super();
		this.id = id;
		Painlevel = painlevel;
		PainLoc = painLoc;
		this.symptoms = symptoms;
		Painworse = painworse;
		Feelings = feelings;
		Date = date;
	}
	

	public Track() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPainlevel() {
		return Painlevel;
	}
	public void setPainlevel(int painlevel) {
		Painlevel = painlevel;
	}
	public List<Painlocation> getPainLoc() {
		return PainLoc;
	}
	public void setPainLoc(List<Painlocation> painLoc) {
		PainLoc = painLoc;
	}
	public List<SymptomType> getSymptoms() {
		return symptoms;
	}
	public void setSymptoms(List<SymptomType> symptoms) {
		this.symptoms = symptoms;
	}
	public List<PainWorse> getPainWorse() {
		return Painworse;
	}
	public void setPainWorse(List<PainWorse> painworse) {
		Painworse = painworse;
	}
	public List<Feelings> getFeelings() {
		return Feelings;
	}
	public void setFeelings(List<Feelings> feelings) {
		Feelings = feelings;
	}
	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	
	

}
