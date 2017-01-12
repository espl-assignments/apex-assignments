public class Employee{
	private Integer employeeId;
	private String employeeName;
	private Double employeeSalary;
	
	public Employee(){
		//super();
	}
	
	public Employee(Integer employeeId, String employeeName, Double employeeSalary){
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.employeeSalary = employeeSalary; 
	}
	 
}