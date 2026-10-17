import java.util.Scanner;

public class CalculoDelta {

    /* Questão apresentada:
    
    Desenvolva uma lógica que leia os valores de A, B e C de uma equação do
    segundo grau e mostre o valor de Delta.
    
    */

    public static void main(String[] args) {
        //Criando variavel leitor para solicitar perguntas ao usuario.
        Scanner leitor = new Scanner(System.in);

        //Criação das variaveis para armazenar valores de a,b,c conforme atividade proposta.
        double a, b, c;

        //Solicitando primeira variavel.
        System.out.print("Digite o valor de A: ");
        //Armazenando resposta em variavel.
        a = leitor.nextDouble();

        //Solicitando segunda variavel.
        System.out.print("Digite o valor de B: ");
        b = leitor.nextDouble();

        //Solicitando terceira variavel.
        System.out.print("Digite o valor de C: ");
        c = leitor.nextDouble();

        //Encerrando leitor pois não sera realizado mais nenhuma informação ao usuario.
        leitor.close();

        //Apresentando dados ao usuario, e invocando o metodo para calcular os valores solicitados.
        System.out.print("O resultado do Delta e: " + calcularDelta(a, b, c));
    }
    public static double calcularDelta(double a, double b, double c){
        //Variavel para receber resultado dos valores
        double resultado;
        
        //Calculo conforme a equação de segundo grau.
        // B² -4 * A * C
        resultado = (b*b)-4*(a*c);
        //retornando resultado do calculo.
        return resultado;
    }

}
