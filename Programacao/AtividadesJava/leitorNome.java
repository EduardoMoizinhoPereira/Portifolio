import java.util.Scanner;
public class leitorNome {

    
    public static void main(String[] args) {
        String nome = "";
        Scanner leitor = new Scanner(System.in);

        System.out.print("Digite o seu nome: ");
        nome = leitor.next();

        System.out.println("Ola " +nome+ ", e um prazer conhece-lo");
        leitor.close();
    } 
}
