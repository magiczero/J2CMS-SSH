package org.j2cms.utils;

import java.math.BigInteger;
import java.util.ArrayList;

/**
 * 计算工具类
 * @author young
 *
 */
public class CalculationUtils {

	/**
     * 阶乘算法
     * @param num
     * @return
     */
    public static synchronized BigInteger factorial(int num){//利用BigInteger类计算阶乘
    	 
        ArrayList<BigInteger> list = new ArrayList<BigInteger>();//创建集合数组
        list.add(BigInteger.valueOf(1));//往数组里添加一个数值
        for (int i = list.size(); i <= num; i++) {
            BigInteger lastfact = list.get(i - 1);//获得第一个元素
            BigInteger nextfact = lastfact.multiply(BigInteger.valueOf(i));//获得下一个数组
            list.add(nextfact);
        }
        return list.get(num);//返回数组中的下标为num的值

    }
    
    /**
     * n次方
     * @param a
     * @param n
     * @return
     */
    public static double power(double a, int n) {
        double r = 1;
        while (n >= 1) {
            if ((n & 1) == 1) {
                r *= a;
            }
            a *= a;
            n = n >> 1;
        }
        return r;
    }
}
