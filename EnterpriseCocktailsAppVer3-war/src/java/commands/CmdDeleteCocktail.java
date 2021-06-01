package commands;

import control.CocktailFacade;
import entities.Cocktail;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import servlet.FrontController;

/**
 *
 * @author Jesus Larez
 */
public class CmdDeleteCocktail extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession(true);
        CocktailFacade cocktailFacade = null;
        try {
            cocktailFacade = InitialContext.doLookup("java:global/EnterpriseCocktailsAppVer3/EnterpriseCocktailsAppVer3-ejb/CocktailFacade");
        } catch (NamingException ex) {
            Logger.getLogger(FrontController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Cocktail cocktail = cocktailFacade.findByName(request.getParameter("name"));
        cocktailFacade.remove(cocktail);
        forward("/main.jsp");
    }
    
}
