package examples.jsontests;

import com.intuit.karate.junit5.Karate;

class testRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("posts").relativeTo(getClass());
    }    

}
