/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package semesterprojektgalgeleg;
import java.io.IOException;
import java.util.ArrayList;
import javax.jws.WebMethod;
import javax.jws.WebService;
@WebService
public interface MainInterface {
    @WebMethod ArrayList<String> getBrugteBogstaver();
    @WebMethod String getSynligtOrd();
    @WebMethod String getOrdet();
    @WebMethod int getAntalForkerteBogstaver();
    @WebMethod boolean erSidsteBogstavKorrekt();
    @WebMethod boolean erSpilletVundet();
    @WebMethod boolean erSpilletTabt();
    @WebMethod boolean erSpilletSlut();
    @WebMethod void nulstil();
    @WebMethod void opdaterSynligtOrd();
    @WebMethod void gætBogstav(String bogstav);
    @WebMethod void logStatus();
   // @WebMethod String hentUrl(String url) throws IOException;
    @WebMethod void hentOrdFraDr() throws Exception;
    //@WebMethod void login();
    
}
