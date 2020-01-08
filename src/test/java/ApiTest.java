

import com.intuit.karate.junit5.Karate;

public class ApiTest {

    @Karate.Test
    Karate testAll() {
        return new Karate().relativeTo(getClass());
    }
}
