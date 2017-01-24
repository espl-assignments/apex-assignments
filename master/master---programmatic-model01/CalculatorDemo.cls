public class CalculatorDemo{
	public Integer calculator(String operation,Integer inp1,Integer inp2)
	{
		if(operation.equals('sum')){
			return(inp1 + inp2);
		}
		else if(operation.equals('sub')){
			return(inp1 - inp2);
		}
		
		else if(operation.equals('mul')){
			return(inp1 * inp2);
		}
		
		else if(operation.equals('div')){
			return(inp1 / inp2);
		}
		return null;	
	}
}

/*
CalculatorDemo cd = new CalculatorDemo();
System.debug('Sum: '+cd.calculator('sum' , 5 ,2));
System.debug('Subtract: '+cd.calculator('sub' , 5 ,2));
System.debug('Multiply: '+cd.calculator('mul' , 5 ,2));
System.debug('Division: '+cd.calculator('div' , 5 ,2));
*/