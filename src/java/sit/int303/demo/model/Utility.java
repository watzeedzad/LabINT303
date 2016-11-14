/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.model;

/**
 *
 * @author int303
 */
public class Utility {

    public static int isPrime(int n) {
        for (int i = 2; i < n / 2 + 1; i++) {
            if (n % i == 0) {
                return i;
            }
        }
        return (n < 2 ? -1 : 1);
    }

    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";

    public static void main(String[] args) {
        for (int i = -1; i < 105; i++) {
            int x = isPrime(i);
            if (x < 1) {
                System.out.println("Invalid number: " + i + "( is not prime number)");
            } else if (x == 1) {
                System.out.println( i + " is "+ANSI_RED+" prime number"+ANSI_RESET );
            } else {
                System.out.println(i + " is "+ ANSI_BLUE+ "not prime number"+ANSI_RESET+ " ("+ x+ ")" );
            }
        }
    }
}
