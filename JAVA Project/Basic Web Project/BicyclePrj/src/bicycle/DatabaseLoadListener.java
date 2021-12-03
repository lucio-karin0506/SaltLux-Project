package bicycle;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DatabaseLoadListener implements ServletContextListener {

    public DatabaseLoadListener() {
        // TODO Auto-generated constructor stub
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		System.out.println("Oracle class driver has been loaded!");
    	} catch(ClassNotFoundException e) {
    		System.out.println("There is no class driver.");
    	}
    }
	
}
