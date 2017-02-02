/*3. Method which will accept array of integers as parameters write a code to
a. Sort the array in ascending order
b. Sort the array in descending order
c. Print the Maximum number in the array
d. Print the Minimum number in the array
e. Print duplicates and its occurrences in the array*/

//a. Sort the array in ascending order
public class ArraySorting{
	public static void arrayOrder(){
		Integer[] arrayList = new List<Integer> {2,2,3,3,3,4};
		
		//Sort the array in ascending order
		arrayList.sort();
		System.debug('Ascending Order: '+ arrayList);
		
		//Sort the array in descending order
		Integer[] descList = new List<Integer>();
		for(Integer i = arrayList.size() - 1 ; i >= 0; i--){
			descList.add(arrayList.get(i));
		}
		System.debug('Descending Order: '+ descList);
		
		// Print the Maximum number in the array
		Integer maxNo = descList[0];
		for(Integer temp = 0 ; temp < descList.size() ; temp++){
			if(descList[temp] > maxNo)
				maxNo = descList[temp];
		}
		System.debug('Max Number: '+maxNo);
		
		// Print the Minimum number in the array
		Integer minNo = arrayList[0];
		for(Integer temp = 0 ; temp < descList.size() ; temp++){
			if(arrayList[temp] < minNo)
				minNo = arrayList[temp];
		}
		System.debug('Min Number: '+minNo);
    	
    	//Print duplicates and its occurrences in the array
    	Map<Integer,Integer> elCount = new Map<Integer,Integer>(); 

		for(Integer key : arrayList)
		{
    		if(!elCount.containsKey(key)){
    			elCount.put(key,0);
    		}
    	Integer currentInt=elCount.get(key)+1;
    		elCount.put(key,currentInt);
		}
		System.debug(elCount);
	}	
}