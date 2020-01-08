package users;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {


        @Karate.Test
        Karate testUsers() {
            return new Karate().feature("users").relativeTo(getClass());
        }
}
