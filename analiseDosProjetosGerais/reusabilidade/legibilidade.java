import raykernel.apps.readability.eval.Main.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class legibilidade{
    public static void main(String[] args) {
        try (BufferedReader br = Files.newBufferedReader(Paths.get("arquivos_java.csv"))) {
            String line;

            while ((line = br.readLine()) != null) {
                String[] informacoes = line.split(",");
                double soma_da_metrica = 0;
                int numero_de_arquivos = 0;
                for (int i = 3; i < informacoes.length - 1; i++) {
                    BufferedReader bbrr = Files.newBufferedReader(Paths.get(informacoes[i]));
                    String linha;
                    StringBuilder sb = new StringBuilder();
                    while ((linha = bbrr.readLine()) != null) {
                        sb.append(linha).append("\n");
                    }
                    sb.append("###").append("\n");
                    double readbility = raykernel.apps.readability.eval.Main.getReadability(sb.toString());
                    soma_da_metrica = soma_da_metrica + readbility;
                    numero_de_arquivos++;

                System.out.println(informacoes[0]+","+informacoes[1]+","+(soma_da_metrica/numero_de_arquivos));
                    




                }
            }
        } catch (IOException e) {
            System.err.format("IOException: %s%n", e);
        }

        // System.out.println();
    }
}