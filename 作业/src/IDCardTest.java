import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class IDCardTest {

    @Test
    public void testValidIDCard() {
        assertEquals("性别：男", getGender("123456789012345678"));
        assertEquals("性别：女", getGender("123456789012345679"));
        assertEquals("性别：男", getGender("12345678901234567x"));
    }

    @Test
    public void testInvalidIDCard() {
        assertThrows(IllegalArgumentException.class, () -> getGender("12345678901234567"));
        assertThrows(IllegalArgumentException.class, () -> getGender("12345678901234567y"));
        assertThrows(IllegalArgumentException.class, () -> getGender("12345678901234567Z"));
    }

    // 模拟输入和返回性别的函数
    public String getGender(String idCard) {
        if (idCard.length() != 18) {
            throw new IllegalArgumentException("输入错误：要求输入的身份证号码为18位");
        }

        for (int i = 0; i < idCard.length(); i++) {
            if (i == 17) {
                if (!Character.isDigit(idCard.charAt(i)) && idCard.charAt(i) != 'x' && idCard.charAt(i) != 'X') {
                    throw new IllegalArgumentException("身份证号码输入有误");
                }
            } else if (!Character.isDigit(idCard.charAt(i))) {
                throw new IllegalArgumentException("身份证号码输入有误");
            }
        }

        int an = Character.getNumericValue(idCard.charAt(16));
        return (an % 2 == 0) ? "性别：女" : "性别：男";
    }
}
