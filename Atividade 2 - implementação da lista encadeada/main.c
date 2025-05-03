#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX 1000

int lista[MAX];
int tamanho = 0;

void adicionar(int numero, int posicao) {
    if (posicao < 0 || posicao > tamanho || tamanho >= MAX) return;
    for (int i = tamanho; i > posicao; i--) {
        lista[i] = lista[i - 1];
    }
    lista[posicao] = numero;
    tamanho++;
}

void remover(int numero) {
    int i;
    for (i = 0; i < tamanho; i++) {
        if (lista[i] == numero) {
            break;
        }
    }
    if (i == tamanho) return;
    for (; i < tamanho - 1; i++) {
        lista[i] = lista[i + 1];
    }
    tamanho--;
}

void imprimir() {
    for (int i = 0; i < tamanho; i++) {
        printf("%d ", lista[i]);
    }
    printf("\n");
}

void executarOperacoes() {
    FILE *fp = fopen("arq-novo.txt", "r");
    if (!fp) {
        printf("Erro ao abrir o arquivo.\n");
        exit(1);
    }

    // Lê a primeira linha (lista inicial)
    char linha[256];
    fgets(linha, sizeof(linha), fp);
    char *token = strtok(linha, " ");
    tamanho = 0;
    while (token) {
        lista[tamanho++] = atoi(token);
        token = strtok(NULL, " ");
    }

    // Lê a quantidade de ações
    int qtdAcoes;
    fscanf(fp, "%d\n", &qtdAcoes);

    for (int i = 0; i < qtdAcoes; i++) {
        fgets(linha, sizeof(linha), fp);
        char acao;
        int num, pos;
        if (linha[0] == 'A') {
            sscanf(linha, "%c %d %d", &acao, &num, &pos);
            adicionar(num, pos);
        } else if (linha[0] == 'R') {
            sscanf(linha, "%c %d", &acao, &num);
            remover(num);
        } else if (linha[0] == 'P') {
            imprimir();
        }
    }

    fclose(fp);
}

int main() {
    for (int i = 1; i <= 10; i++) {
        printf("\nExecução %d:\n", i);
        clock_t inicio = clock();
        executarOperacoes();
        clock_t fim = clock();
        double tempo = (double)(fim - inicio) / CLOCKS_PER_SEC;
        printf("Tempo total de execução: %.4f segundos\n", tempo);
    }
    return 0;
}
