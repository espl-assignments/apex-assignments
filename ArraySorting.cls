/*3. Method which will accept array of integers as parameters write a code to
a. Sort the array in ascending order
b. Sort the array in descending order
c. Print the Maximum number in the array
d. Print the Minimum number in the array
e. Print duplicates and its occurrences in the array*/

//a. Sort the array in ascending order
public class ArraySorting{
	public static void arrayOrder(List<Integer> values){
		//Sort the array in ascending order
		values.sort();
		System.debug('Ascending Order: '+ values);
		
		//Sort the array in descending order
		Integer[] descList = new List<Integer>();
		for(Integer i = values.size() - 1 ; i >= 0; i--){
			descList.add(values.get(i));
		}
		System.debug('Descending Order: '+ descList);
		
		// Print the Maximum number in the array
		Integer maxNo = descList[0];
		for(Integer temp = 0 ; temp < descList.size() ; temp++){
			if(descList[temp] > maxNo){
				maxNo = descList[temp];
			}
		}
		System.debug('Max Number: '+maxNo);
		
		// Print the Minimum number in the array
		Integer minNo = values[0];
		for(Integer temp = 0 ; temp < descList.size() ; temp++){
			if(values[temp] < minNo){
				minNo = values[temp];
			}
		}
		System.debug('Min Number: '+minNo);
    	
    	//Print duplicates and its occurrences in the array
    	Map<Integer,Integer> elCount = new Map<Integer,Integer>(); 

		for(Integer key : values)
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


/*
List<Integer> integerList = new List<integer>{2,3,3,4,2} ;
ArraySorting.arrayOrder(integerList);

*/