public class ArrayDemo {
	public static void printArray(Integer arraysize){
		List<Integer> a= new List<Integer>(); 
		Integer i;
		for(i=0; i < arraysize; i++){	
			a.add(i);
			System.debug('a[i]: '+a[i]);
		}	
	} 
}