public class ArraySorting{
	public static void ascendingOrder(List<Integer> values){
		List<Integer> integerArray = new List<Integer>(values);
		for(Integer i = 0 ; i < integerArray.size() ; i ++) {
			for(integer j = i+1 ; j <= integerArray.size() -1 ; j ++ ){
  				integer temporaryVariable = 0 ;
  				if(integerArray[i] >  integerArray[j]){
   					temporaryVariable = integerArray[i];
   					integerArray[i] = integerArray[j];
   					integerArray[j] = temporaryVariable;
				}
			}
		}
		System.debug(integerArray);
	}
	
	public static void descendingOrder(List<Integer> elements){
		List<Integer> arrayList = new List<Integer>(elements);
		for(Integer i = 0 ; i < arrayList.size() ; i ++) {
			for(integer j = i+1 ; j <= arrayList.size() -1 ; j ++ ){
  				integer temporary_Var = 0 ;
  				if(arrayList[i] <  arrayList[j]){
   					temporary_Var = arrayList[i];
   					arrayList[i] = arrayList[j];
   					arrayList[j] = temporary_Var;			
				}
			}
		}
		System.debug(arrayList);
	}
	
	
	public static void maximumNumber(List<Integer> elementList){
		List<Integer> arrayElements = new List<Integer>(elementList);
		for(Integer i = 0 ; i < arrayElements.size() -1 ; i++ ){
  			integer temp_Var = 0 ;
  			if(arrayElements[i] >  arrayElements[i+1]){
   				temp_Var = arrayElements[i];
   				arrayElements[i] = arrayElements[i+1];
   				arrayElements[i+1] = temp_Var;
			}
		}			
		System.debug(arrayElements[arrayElements.size()-1]);
	}

	public static void minimumNumber(List<Integer> numbers){
		List<Integer> arrayNumbers = new List<Integer>(numbers);
		for(Integer i = 0 ; i < arrayNumbers.size() -1 ; i++ ){
  			integer temp_Var1 = 0 ;
  			if(arrayNumbers[i] <  arrayNumbers[i+1]){
   				temp_Var1 = arrayNumbers[i];
   				arrayNumbers[i] = arrayNumbers[i+1];
   				arrayNumbers[i+1] = temp_Var1;
			}
		}
		System.debug(arrayNumbers[arrayNumbers.size()-1]); 
	}

public static void arrayDigitOccurrence(List<Integer> digits){
		List<Integer> arrayIntegers = new List<Integer>(digits);
		Integer counter = 1;
		Map<Integer,Integer> myMap = new Map<Integer,Integer>(); 
		Integer i;
		for(i=0 ; i < 5; i++){
			if(myMap.containsKey(arrayIntegers[i])){
				counter++;
				myMap.put(arrayIntegers[i],counter);
			}
			else{
				myMap.put(arrayIntegers[i],counter);
			}
		}
		System.debug(myMap);
	}
}




/*
List<Integer> integerList = new List<integer>{1,20,10,5,1} ;

System.debug('Ascending order: ');
ArraySorting.ascendingOrder(integerList);

System.debug('Descending order: ');
ArraySorting.descendingOrder(integerList);

System.debug('Maximum Number: ');
ArraySorting.maximumNumber(integerList);

System.debug('Minimum Number: ');
ArraySorting.minimumNumber(integerList);

System.debug('Repeating Number: ');
ArraySorting.arrayDigitOccurrence(integerList); */