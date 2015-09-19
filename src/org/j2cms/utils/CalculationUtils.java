package org.j2cms.utils;

import java.math.BigInteger;

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
    	 
    	BigInteger ret = BigInteger.ONE;
    	for (Integer i= 2; i<=num; i++) {
    		ret = ret.multiply(new BigInteger(i.toString()));
    	}
    	return ret;//回数组中的下标为num的值

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
