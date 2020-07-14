package plan;
import java.sql.Date;
import java.util.ArrayList;

public interface PlanDAO {
	public void addPlan(PlanBean plan);
	public ArrayList<PlanBean> getPlans(Date day); 
}