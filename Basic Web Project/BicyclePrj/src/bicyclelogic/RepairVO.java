package bicyclelogic;

public class RepairVO {
	private int month;
	private String repairType;
	private int repairCnt;
	private double repairPct;
	
	public RepairVO(int month, String repairType, int repairCnt, double repairPct) {
		super();
		this.month = month;
		this.repairType = repairType;
		this.repairCnt = repairCnt;
		this.repairPct = repairPct;
	}
	
	public RepairVO() {
		super();
	}
	
	public int getMonth() {
		return month;
	}
	
	public void setMonth(int month) {
		this.month = month;
	}
	
	public String getRepairType() {
		return repairType;
	}
	
	public void setRepairType(String repairType) {
		this.repairType = repairType;
	}
	
	public int getRepairCnt() {
		return repairCnt;
	}
	
	public void setRepairCnt(int repairCnt) {
		this.repairCnt = repairCnt;
	}
	
	public double getRepairPct() {
		return repairPct;
	}
	
	public void setRepairPct(double repairPct) {
		this.repairPct = repairPct;
	}

}
