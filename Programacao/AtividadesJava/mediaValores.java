import java.util.Scanner;
public class mediaValores{
    
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);
        float primeiraNota = 0;
        float segundaNota = 0;

        System.out.print("Digite a primeira nota: ");
        primeiraNota = leitor.nextFloat();

        System.out.print("Digite a primeira nota: ");
        segundaNota = leitor.nextFloat();

        System.out.println("primeira nota: " + primeiraNota);
        System.out.println("segunda nota: " + segundaNota);
        System.out.println("media das notas: " + media(primeiraNota, segundaNota));

        leitor.close();
    }
    public static float media(float valor1, float valor2){
        return (valor1 + valor2) / 2;
    }
}
