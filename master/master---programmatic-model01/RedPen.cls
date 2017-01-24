// Extension for the Pen class
public class RedPen extends Pen {
    public override void write() {
        System.debug('Writing some text using the red pen.');
    } 
}

/*
Pen p = new Pen();
p.write();
System.debug(p.discount());
Pen p1 = new RedPen();
p1.write();
System.debug(p1.discount());
*/