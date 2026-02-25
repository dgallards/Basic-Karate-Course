package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTest {

    @Test
    void testParallel() {
        Results results = //Runner.path("classpath:examples/myTests")
                          Runner.path("classpath:examples/myTests/demo-01.feature")
                          //Runner.path("classpath:examples/myTests").tags("@restful")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
