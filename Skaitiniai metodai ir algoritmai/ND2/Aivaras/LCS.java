/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package laboras2;

import java.util.Scanner;

/**
 *
 * @author Aivaras
 */
public class LCS {
    
    static int op;    
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Iveskite pirma eilute:");
        String x = in.nextLine();
        System.out.println("Iveskite antra eilute:");
        String y = in.nextLine();
        int M = x.length();
        int N = y.length();

        // opt[i][j] = length of LCS of x[i..M] and y[j..N]
        int[][] opt = new int[M+1][N+1];

        // compute length of LCS and all subproblems via dynamic programming
        for (int i = M-1; i >= 0; i--) {
            for (int j = N-1; j >= 0; j--) {
                if (x.charAt(i) == y.charAt(j))
                {
                    opt[i][j] = opt[i+1][j+1] + 1;
                    op++;
                }
                else 
                {
                    opt[i][j] = Math.max(opt[i+1][j], opt[i][j+1]);
                    op++;
                }
            }
        }
        
        System.out.println("Bendra ilgiausia seka:");
        
        // recover LCS itself and print it to standard output
        int i = 0, j = 0;
        while(i < M && j < N) {
            if (x.charAt(i) == y.charAt(j)) {
                System.out.print(x.charAt(i));
                i++;
                j++;
            }
            else if (opt[i+1][j] >= opt[i][j+1]) i++;
            else                                 j++;
        }
        System.out.println();
        System.out.print("Operaciju kiekis : " + op);
        System.out.println();

    }
}
