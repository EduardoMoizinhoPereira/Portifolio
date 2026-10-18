import java.util.Scanner;
public class LocadoraCarro{
    /* Questão apresentada:

    A locadora de carros precisa da sua ajuda para cobrar seus serviços. Escreva
    um programa que pergunte a quantidade de Km percorridos por um carro alugado e a
    quantidade de dias pelos quais ele foi alugado. Calcule o preço total a pagar,
    sabendo que o carro custa R$90 por dia e R$0,20 por Km rodado.
    
    */
    public static void main(String[] args) {
        //Criando a variavel para solicitar dados do usuario.
        Scanner leitor = new Scanner(System.in);

        //Variaveis para armazenar dias da locação e kilometros percorridos pelo carro.
        double kmPercorrido;
        int dias;

        //Solicitando kilometragem percorrida.
        System.out.print("Digite os kilometros do carro: ");
        kmPercorrido = leitor.nextDouble();

        //Solicitando dias que foi locado o carro.
        System.out.print("Digite os dias que foi alugado o carro: ");
        dias = leitor.nextInt();

        //Encerrando o leitor pois não sera realizado mais nenhuma questão.
        leitor.close();

        //Calculo da kilometragem cada km é igual a: $0,20.
        kmPercorrido = kmPercorrido * 0.20;
        //valor da kilometragem 
        System.out.println("\nValor dos kilometros percorrido: " + kmPercorrido);

        //Cada dia é igual a $90,00.
        dias = dias * 90;
        //valor dos dias alugados.
        System.out.println("Valor dos dias alugado: " + dias);

        //Valor total a se pagar.
        System.out.println("Valor total a se pagar: " + (dias + kmPercorrido));
    }
}