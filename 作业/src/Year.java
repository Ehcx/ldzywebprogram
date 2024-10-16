public class Year {
    public boolean isLeepYear(int year) {
        // 能被4整除且不能被100整除，或能被400整除
        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            return true;
        } else {
            return false;
        }
    }
}
