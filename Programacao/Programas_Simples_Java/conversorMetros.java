import java.util.Scanner;
public class conversorMetros{

    /* Questão apresentada:
    Desenvolva um programa que leia uma distância em metros e mostre os valores
    relativos em outras medidas.
    Ex:
    Digite uma distância em metros: 185.72
    A distância de 85.7m corresponde a:
    0.18572Km
    1.8572Hm
    18.572Dam
    1857.2dm
    18572.0cm
    185720.0mm
    */
    public static void main(String[] args) {
        //Scanner para receber o valor digitado pelo usuario.
        Scanner leitor = new Scanner(System.in);

        //Variavel para armazenar valores em metros.
        float valorMetros = 0;

        //Solicitação do valor em metros.
        System.out.print("Digite um valor em metros para covertelo: ");
        valorMetros = leitor.nextFloat();

        //Imprimindo metodos.
        System.out.println("Metros em Kilometro: " + conversorMetroKilometro(valorMetros) + "Km");
        System.out.println("Metros em Hectometro: " + conversorMetroHectometro(valorMetros) + "Hm");
        System.out.println("Metros em Decametro: " + conversorMetroDecametro(valorMetros) + "Dam");
        System.out.println("Metros em decimetro: " + conversorMetroDecimetro(valorMetros) + "dm");
        System.out.println("Metros em Centimetros: " + conversorMetroCentimetros(valorMetros) + "cm");
        System.out.println("Metros em Milimitros: " + conversorMetroMilimetro(valorMetros) + "mm");
        //Encerrar o Scanner pois não sera mais utilizado
        leitor.close();

    }
    //Criação de metodos:
    public static float conversorMetroCentimetros(float val){
        // 100 * 100 = 10.000
        return val * 100;
    }
    public static float conversorMetroKilometro(float val){
        // 100 / 1000 = 0.1
        return val / 1000;
    }
    public static float conversorMetroHectometro(float val){
        // 100 / 100 = 1.0
        return val / 100;
    }
    public static float conversorMetroDecametro(float val){
        // 100 / 10 = 10.0
        return val / 10;
    }
    public static float conversorMetroDecimetro(float val){
        // 100 * 10 = 1.000
        return val * 10;
    }
    public static float conversorMetroMilimetro(float val){
        // 100 * 1.000 = 100.000
        return val * 1000;
    }
}
