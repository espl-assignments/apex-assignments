/*
2. Write a method which will accept following parameters & return the result :
Parameter: String : (Value here will be any of the following :
‘SUM’,’SUB’,’MUL’,’DIV’)
Parameter: Two integers :
Example :
Integer result = Calculator(‘SUM’, 2 ,3);
// here the result will be 5
Public integer calculator(String operation, Integer inp1 , Integer Inp2)
{
// Write a logic which will identify the operation & return the result
Return integer ;
}
*/

public class CalculatorDemo{
	public Integer calculator(String operation,Integer inp1,Integer inp2)
	{
		try{ 
			if(operation.equalsIgnoreCase ('sum')){
				return(inp1 + inp2);
			}
			else if(operation.equalsIgnoreCase('sub')){
				return(inp1 - inp2);
			}
			else if(operation.equalsIgnoreCase('mul')){
				return(inp1 * inp2);
			}
			else if(operation.equalsIgnoreCase('div')){	 
				return(inp1 / inp2);  
			}
		}catch(MathException e){  
            	System.debug(e);  
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