import java.util.Scanner;
public class dobroTerco{
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);
        float numero = 0.0f;

        System.out.print("Digite um numero: ");
        numero = leitor.nextFloat();
        leitor.close();

        System.out.println("O dobro de "+numero+ " e: " + (numero * 2));
        System.out.println("O numero informado: "+numero);
        System.out.println("O terço de " +numero+ " e: " +(numero / 3));
    }
}
