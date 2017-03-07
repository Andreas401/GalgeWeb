/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package semesterprojektgalgeleg;


import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.util.Scanner;

/**
 *
 * @author Thanh Pham
 */
public class StandardPlayer {
    public static void main(String[] args) throws MalformedURLException {
        URL url = new URL("http://ubuntu4.javabog.dk:9978/galgeleg?wsdl");
          //URL url = new URL("http://localhost:9978/galgeleg?wsdl");
		QName qname = new QName("http://server/", "GameLogicService");
                Service service = Service.create(url, qname);
                MainInterface i = service.getPort(MainInterface.class);
                    i.nulstil();
                    
                while(i.erSpilletSlut() == false){
                    System.out.println("" + i.getSynligtOrd());
                    i.logStatus();
                System.out.println("Indtast bogstav her: ");
                Scanner scan = new Scanner(System.in);
                String letter = scan.nextLine();
                
                i.gætBogstav(letter);
                
              
                if(i.erSpilletTabt() == true){
                    System.out.println("Spillet er tabt!");
                } else if(i.erSpilletVundet() == true){
                    System.out.println("Spillet er vundet!");
                } else {
                    System.out.println("SENT");
                }
                
                }    
                
                        
                    
                
                
    }
}
