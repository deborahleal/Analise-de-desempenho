import time
import psutil
import platform
import os


def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr


def ler_arquivo(nome_arquivo):
    try:
        with open(nome_arquivo, "r") as file:
            return [int(linha.strip()) for linha in file if linha.strip()]
    except FileNotFoundError:
        print(f"Erro: Arquivo '{nome_arquivo}' não encontrado.")
        exit(1)


def escrever_arquivo(nome_arquivo, dados):
    with open(nome_arquivo, "w") as file:
        for numero in dados:
            file.write(f"{numero}\n")


def medir_desempenho(funcao, dados):
    processo = psutil.Process(os.getpid())
    mem_inicio = processo.memory_info().rss / 1024  # em KB
    tempo_inicio = time.time()

    resultado = funcao(dados.copy())

    tempo_fim = time.time()
    mem_fim = processo.memory_info().rss / 1024  # em KB

    tempo_total = (tempo_fim - tempo_inicio) * 1000  # ms
    mem_usada = mem_fim - mem_inicio  # KB

    return resultado, tempo_total, mem_usada

def print_info_sistema():
    print("\n--- INFORMAÇÕES DO SISTEMA ---")
    print(f"Sistema Operacional: {platform.system()} {platform.release()}")
    print(f"Processador: {platform.processor()}")
    print(f"Memória RAM Total: {round(psutil.virtual_memory().total / (1024 ** 2), 2)} MB\n")

def main():
    arquivo_entrada = "arquivo_3.txt"
    arquivo_saida = "arq-saida.txt"

    dados = ler_arquivo(arquivo_entrada)

    
    print_info_sistema()

    # Bubble Sort
    _, tempo_bubble, memoria_bubble = medir_desempenho(bubble_sort, dados)
    print("--- Bubble Sort ---")
    print(f"Tempo: {tempo_bubble:.2f} ms")
    print(f"Memória RAM usada: {memoria_bubble:.2f} KB\n")

    # Sorted (Timsort)
    dados_ordenados, tempo_sort, memoria_sort = medir_desempenho(sorted, dados)
    print("--- Algoritmo Eficiente (sorted) ---")
    print(f"Tempo: {tempo_sort:.2f} ms")
    print(f"Memória RAM usada: {memoria_sort:.2f} KB\n")

    escrever_arquivo(arquivo_saida, dados_ordenados)
    print(f"Arquivo ordenado salvo como '{arquivo_saida}'")

if __name__ == "__main__":
    main()
