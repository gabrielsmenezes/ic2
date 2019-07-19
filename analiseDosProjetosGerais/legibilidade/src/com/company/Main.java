package com.company;


import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {
        int i = 0;
        try {
            BufferedReader br = Files.newBufferedReader(Paths.get("/home/gabriel/Documentos/ic/frameworkCodeSamples/Samples/legibilidade/arquivos_java.csv"));
            String line;

            while ((line = br.readLine()) != null) {
                String[] informacoes = line.split(",");
                double soma_da_metrica = 0;
                int numero_de_arquivos = 0;
                for (i = 1; i < informacoes.length - 1; i++) {
                    try{
                        BufferedReader bbrr = Files.newBufferedReader(Paths.get(informacoes[i]));
                        String linha;
                        StringBuilder sb = new StringBuilder();
                        while ((linha = bbrr.readLine()) != null) {
                            sb.append(linha).append("\n");
                        }
                        sb.append("###");
                        double readbility = raykernel.apps.readability.eval.Main.getReadability(sb.toString());
                        soma_da_metrica = soma_da_metrica + readbility;
                        numero_de_arquivos++;

                    }catch (Exception e){
                        continue;
                    }
                }
                System.out.println(informacoes[0]+","+(soma_da_metrica/numero_de_arquivos));
            }
        } catch (Exception e) {
            System.out.println(i);
            System.err.format("IOException: %s%n", e);
        }


    }
}
