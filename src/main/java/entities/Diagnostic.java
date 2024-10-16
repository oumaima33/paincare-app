package entities;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Diagnostic {
    private int id;
    private int user_id;
    private List<String> responses;
    private List<Question> staticQuestions;
    private String riskLevel;


    public Diagnostic() {
    	super();
        this.staticQuestions = initializeStaticQuestions();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public List<String> getResponses() {
        return responses;
    }

    public void setResponses(List<String> responses) {
        this.responses = responses;
    }

    public List<Question> getStaticQuestions() {
        return staticQuestions;
    }

    private List<Question> initializeStaticQuestions() {
        Question question1 = new Question("When did your period start ?", Arrays.asList("After 11 years old", "Before 11 years old"));
        Question question2 = new Question("Your menstrual cycle length average ?", Arrays.asList("Less than 27 days", "More than 27 days"));
        Question question3 = new Question("Do you have a familly history of endometriosis ?", Arrays.asList("No", "Yes"));
        Question question4 = new Question("Did you give birth ?", Arrays.asList("Yes", "No"));
        Question question5 = new Question("Do you have trouble getting pregnant ?", Arrays.asList("No", "Yes"));
        Question question6 = new Question("What is your abdominal/pelvic pain intensity", Arrays.asList("0-5", "6-10"));
        Question question7 = new Question("When do you experience abdominal or pelvic pain ?", Arrays.asList("Related to period", "Related to ovulation"));
        Question question8 = new Question("Duration of period ?", Arrays.asList("1-7 days", "More than 7 days"));
        Question question9 = new Question("Nature of periods ?", Arrays.asList("Light", "Heavy"));
        Question question10 = new Question("What is your menstrual cycle pattern ?", Arrays.asList("Regular", "Irregular"));
        return Arrays.asList(question1, question2,question3,question4,question5,question6,question7,question8,question9,question10);
    }
    public static class Question {
        private String expression;
        private List<String> choices;

        public Question(String expression, List<String> choices) {
            this.expression = expression;
            this.choices = choices;
        }

        public String getExpression() {
            return expression;
        }

        public List<String> getChoices() {
            return choices;
        }
    }
    public int assignValues(String choice, int choiceIndex) {
      
        return choiceIndex + 1;
    }
    public String getRiskLevel() {
        return riskLevel;
    }

    public void setRiskLevel(String riskLevel) {
        this.riskLevel = riskLevel;
    }
    public int calculateSum() {
        int sum = 0;
        for (int i = 0; i < staticQuestions.size(); i++) {
            String answer = responses.get(i);
            int choiceIndex = staticQuestions.get(i).getChoices().indexOf(answer);
            sum += assignValues(answer, choiceIndex);
        }
        return sum;
    }
    public String evaluateRiskLevel() {
        int sum = calculateSum();
        if (sum >= 16 && sum <= 20) {
            setRiskLevel("High Risk");
            return getRiskLevel();
        } else if (sum >= 13 && sum <= 16) {
            setRiskLevel("Medium Risk");
            return getRiskLevel();
        } else if (sum >= 10 && sum <= 13) {
            setRiskLevel("Low Risk");
            return getRiskLevel();
        } else {
            setRiskLevel("Unknown Risk");
            return getRiskLevel();
        }
    }
}
