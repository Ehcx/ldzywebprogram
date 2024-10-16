import java.util.Scanner;

public class IDCard {
    public static void main(String[] args) {
        func();
    }

    public static void func() {
        char[] card = new char[18];
        Scanner input = new Scanner(System.in);
        System.out.println("请输入一个18位身份证号码：");
        String s = input.next();
        input.close();

        if (s.length() != 18) {
            System.err.println("输入错误：要求输入的身份证号码为18位");
            return;
        }

        for (int i = 0; i < card.length; i++) {
            card[i] = s.charAt(i);
            if (i == 17) { // 判断最后一位
                if (!Character.isDigit(card[i]) && card[i] != 'x' && card[i] != 'X') {
                    System.err.println("身份证号码输入有误");
                    return;
                }
            } else if (!Character.isDigit(card[i])) {
                System.err.println("身份证号码输入有误");
                return;
            }
        }

        int an = Character.getNumericValue(card[16]);
        System.out.println("第17位数字为：" + an);
        if (an % 2 == 0) {
            System.out.println("性别：女");
        } else {
            System.out.println("性别：男");
        }
    }
}
