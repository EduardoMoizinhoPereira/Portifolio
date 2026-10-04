import java.util.Scanner;
public class antecessorSucessor{
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);
        int numero = 0;

        System.out.print("Digite um numero para descobrir seu sucessor e seu antecessor: ");
        numero = leitor.nextInt();
        leitor.close();
        
        System.out.println("O antecessor de "+numero+ " e: " + (numero-1));
        System.out.println("O numero informado e: " +numero);
        System.out.println("O sucessor de "+numero+ " e: "+(numero+1));
        


    }
}