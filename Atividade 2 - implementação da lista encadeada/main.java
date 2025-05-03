import java.io.*;
import java.nio.file.*;
import java.util.*;

public class main {

    public static void executarOperacoes() throws IOException {
        List<String> linhas = Files.readAllLines(Paths.get("arq-novo.txt"));

        List<Integer> lista = new ArrayList<>();
        for (String numStr : linhas.get(0).trim().split(" ")) {
            lista.add(Integer.parseInt(numStr));
        }

        int qtdAcoes = Integer.parseInt(linhas.get(1).trim());

        for (int i = 2; i < 2 + qtdAcoes; i++) {
            String[] partes = linhas.get(i).trim().split(" ");
            if (partes.length == 0) continue;

            String acao = partes[0];

            if (acao.equals("A")) {
                int numero = Integer.parseInt(partes[1]);
                int posicao = Integer.parseInt(partes[2]);
                if (posicao >= 0 && posicao <= lista.size()) {
                    lista.add(posicao, numero);
                }
            } else if (acao.equals("R")) {
                int numero = Integer.parseInt(partes[1]);
                lista.remove((Integer) numero);
            } else if (acao.equals("P")) {
                for (int val : lista) {
                    System.out.print(val + " ");
                }
                System.out.println();
            }
        }
    }

    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            System.out.println("\nExecução " + i + ":");
            long inicio = System.nanoTime();

            try {
                executarOperacoes();
            } catch (IOException e) {
                System.out.println("Erro ao ler o arquivo: " + e.getMessage());
                return;
            }

            long fim = System.nanoTime();
            double tempoSegundos = (fim - inicio) / 1_000_000_000.0;
            System.out.printf("Tempo total de execução: %.4f segundos%n", tempoSegundos);
        }
    }
}
