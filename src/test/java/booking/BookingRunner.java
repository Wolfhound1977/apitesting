package booking;

import com.intuit.karate.junit5.Karate;

public class BookingRunner {
    @Karate.Test
    Karate testBooking() {
        return new Karate().feature("booking").relativeTo(getClass());
    }
}
