
with open('arq.txt', 'r') as arquivo:
    linhas = [linha.strip() for linha in arquivo.readlines()]


lista = list(map(int, linhas[0].split()))


qtd_acoes = int(linhas[1])


for i in range(2, 2 + qtd_acoes):
    partes = linhas[i].split()
    if not partes:
        continue
        
    acao = partes[0]
    
    if acao == 'A':  # Adicionar
        numero = int(partes[1])
        posicao = int(partes[2])
        if 0 <= posicao <= len(lista):
            lista.insert(posicao, numero)
    
    elif acao == 'R':  # Remover
        numero = int(partes[1])
        if numero in lista:
            lista.remove(numero)
    
    elif acao == 'P':  # Imprimir
        print(' '.join(map(str, lista)))