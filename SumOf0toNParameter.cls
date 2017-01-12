public class SumOf0toNParameter{
	public static void sumNumbers(Integer num){
		Integer result = 0 , i ;
		for (i=0 ; i <= num ; i++){
			result = result + i;
		}
		System.debug('Sum of parameters: '+result);
	}
}

//SumOf0toNParameter.sumNumbers(4);