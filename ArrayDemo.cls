/*2. Method which will accept integer parameter and build an print array of upto that integer parameter.*/

public class ArrayDemo {
	public static void printArray(Integer arraysize){
		List<Integer> a= new List<Integer>(); 
		Integer i;
		for(i=0; i < arraysize; i++){
			a.add(i);
			System.debug(a[i]);
		}	
	} 
}