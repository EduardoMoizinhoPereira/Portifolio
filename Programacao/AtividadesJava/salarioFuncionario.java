import java.util.Scanner;

public class salarioFuncionario {
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);
        float salario = 0;
        String nome = "";

        System.out.print("Digite o seu nome: ");
        nome = leitor.next();

        System.out.print("Digite o seu salario: ");
        salario = leitor.nextFloat();

        System.out.println("Nome do funcionario: " + nome);
        System.out.println("Salario do funcionario: " + salario);
        System.out.println("O funcionario "+nome+" tem um salario de " + salario + " em junho");
        leitor.close();
    }

}
