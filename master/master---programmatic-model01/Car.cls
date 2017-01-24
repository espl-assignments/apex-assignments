/*
4. Implement an abstract method
5. Override the abstract method created above*/
public class Car extends Vehicle {
    
    String modelType;
    public void showDetail()
    {
        vehicleType = 'Car';        //accessing Vehicle class member
        modelType = 'sports';
        System.debug(modelType+' '+vehicleType);
    }
}