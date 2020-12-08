import java.io.*;
public class SerializeDemo {

   public static void main(String [] args) {
      Employee e = new Employee();
      e.name = "Peter Smith";
      e.address = "1, PS Street, Chicago, IL";
      e.SSN = 933849493;
      e.number = 3934;
      
      try {
         FileOutputStream fileOut = new FileOutputStream(args[0]);
         ObjectOutputStream out = new ObjectOutputStream(fileOut);
         out.writeObject(e);
         out.close();
         fileOut.close();
         System.out.printf("Serialized data is saved in /tmp/employee.ser");
      } catch (IOException i) {
         i.printStackTrace();
      }
   }
}