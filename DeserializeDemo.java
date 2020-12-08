import java.io.*;
import org.apache.commons.collections4.Ordere;
public class DeserializeDemo {

   public static void main(String [] args) {
      Employee e = null;
      try {
        System.out.println("Deserializing " + args[0]);
        FileInputStream fileIn = new FileInputStream(args[0]);
        ObjectInputStream in = new ObjectInputStream(fileIn);
        e = (Employee) in.readObject();
        in.close();
        fileIn.close();
      } catch (IOException i) {
        i.printStackTrace();
        return;
      } catch (ClassNotFoundException c) {
        System.out.println("Employee class not found");
        c.printStackTrace();
        return;
      }
      
      System.out.println("Deserialized Employee...");
      System.out.println("Name: " + e.name);
      System.out.println("Address: " + e.address);
      System.out.println("SSN: " + e.SSN);
      System.out.println("Number: " + e.number);
   }
}