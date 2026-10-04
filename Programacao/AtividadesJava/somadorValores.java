import java.util.Scanner;
public class somadorValores {
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);
        int primeiroValor = 0;
        int segundoValor = 0;

        System.out.print("Digite o primeiro valor: ");
        primeiroValor = leitor.nextInt();

        System.out.print("Digite o segundo valor: ");
        segundoValor = leitor.nextInt();

        System.out.println("Primeiro valor: " + primeiroValor);
        System.out.println("Segundo valor: " + segundoValor);
        System.out.println("Somatorio dos valores: " + somadorInteiro(primeiroValor, segundoValor));
        leitor.close();
    }
    public static int somadorInteiro(int primeiroValor, int segundoValor){
        return primeiroValor + segundoValor;
    }
}
