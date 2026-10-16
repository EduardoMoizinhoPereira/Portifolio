import java.util.Scanner;

public class ParedeTinta {

    /*Questão apresentada:

    Faça um algoritmo que leia a largura e altura de uma parede, calcule e
    mostre a área a ser pintada e a quantidade de tinta necessária para o serviço,
    sabendo que cada litro de tinta pinta uma área de 2metros quadrados.
    
    */
    public static void main(String[] args) {
        //Variaveis.
        double largura;
        double altura;
        double tinta;
        
        //Criando Scanner para receber dados do usuario.
        Scanner leitor = new Scanner(System.in);

        //Solicitando altura da parede.
        System.out.print("Digite a altura da parede em metros: ");
        altura = leitor.nextDouble();

        //Solicitando largura da parede.
        System.out.print("Digite a largura da parede em metros: ");
        largura = leitor.nextDouble();
        
        //Encerrando o leitor pois não sera utilizado novamente.
        leitor.close();

        //Armazenando metodo em variavel.
        tinta = calculoArea(altura, largura);

        //Imprimindo resultado dos calculos.
        System.out.println("Area a ser pintada: "+ tinta + "m");
        //Cada litro representa 2m² de uma parede.
        System.out.println("Quantidade de litros necessarios: " + tinta / 2 );

    }

    //Metodo criado para calcular area em metros.
    public static double calculoArea(double altura, double largura) {
        double area = largura * altura;
        return area;
    }
}
