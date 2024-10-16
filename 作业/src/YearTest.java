import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class YearTest {
    Year year = new Year();

    @Test
    public void testLeapYear() {
        assertTrue(year.isLeepYear(2020) == true);  // 2020年应为闰年
        assertTrue(year.isLeepYear(2100) == false); // 2100年不应为闰年
        assertTrue(year.isLeepYear(2004) == true);  // 2004年应为闰年
        assertTrue(year.isLeepYear(2021) == false); // 2021年不应为闰年
    }
}
