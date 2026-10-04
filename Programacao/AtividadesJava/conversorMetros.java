import java.util.Scanner;
public class conversorMetros{
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);
        float valorMetros = 0;

        System.out.print("Digite um valor em metros para covertelo: ");
        valorMetros = leitor.nextFloat();

        System.out.println("Metros em Kilometro: " + conversorMetroKilometro(valorMetros));
        System.out.println("Metros em Hectometro: " + conversorMetroHectometro(valorMetros));
        System.out.println("Metros em Decametro: " + conversorMetroDecametro(valorMetros));
        System.out.println("Metros em decimetro: " + conversorMetroDecimetro(valorMetros));
        System.out.println("Metros em Centimetros: " + conversorMetroCentimetros(valorMetros));
        System.out.println("Metros em Milimitros: " + conversorMetroMilimetro(valorMetros));
        leitor.close();

    }
    public static float conversorMetroCentimetros(float val){
        return val * 100;
    }
    public static float conversorMetroKilometro(float val){
        return val / 1000;
    }
    public static float conversorMetroHectometro(float val){
        return val / 100;
    }
    public static float conversorMetroDecametro(float val){
        return val / 10;
    }
    public static float conversorMetroDecimetro(float val){
        return val * 10;
    }
    public static float conversorMetroMilimetro(float val){
        return val * 1000;
    }
}
