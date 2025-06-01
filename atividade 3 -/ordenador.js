const fs = require('fs');
const os = require('os');
const process = require('process');


const INPUT_FILE = 'arquivo_3.txt';
const OUTPUT_BUBBLE = 'arquivo_3-bubble-sort.txt';
const OUTPUT_QUICK = 'arquivo_3-quick-sort.txt';

// Função Bubble Sort (O(n²))
function bubbleSort(arr) {
    const n = arr.length;
    for (let i = 0; i < n-1; i++) {
        for (let j = 0; j < n-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                [arr[j], arr[j+1]] = [arr[j+1], arr[j]];
            }
        }
    }
    return arr;
}

// Função Quick Sort (O(n log n) em média)
function quickSort(arr) {
    if (arr.length <= 1) return arr;
    
    const pivot = arr[Math.floor(arr.length/2)]; // Pivô do meio para melhor desempenho
    const left = [];
    const right = [];
    const equal = [];
    
    for (const element of arr) {
        if (element < pivot) left.push(element);
        else if (element > pivot) right.push(element);
        else equal.push(element);
    }
    
    return [...quickSort(left), ...equal, ...quickSort(right)];
}

// Função para medir desempenho
function measureSortPerformance(sortFunction, arr, algorithmName) {
    const arrCopy = [...arr]; // Trabalha com cópia
    
  
    if (global.gc) global.gc();
    
    const startMemory = process.memoryUsage().heapUsed;
    const startTime = process.hrtime.bigint();
    
    const sorted = sortFunction(arrCopy);
    
    const endTime = process.hrtime.bigint();
    const endMemory = process.memoryUsage().heapUsed;
    
    return {
        algorithm: algorithmName,
        time: Number(endTime - startTime) / 1e6, // Converte para milissegundos
        memory: (endMemory - startMemory) / 1024, // Converte para KB
        sortedArray: sorted
    };
}

// Função principal
async function main() {
    try {
        // Exibe informações do sistema
        console.log('=== Informações do Sistema ===');
        console.log(`Sistema: ${os.platform()} ${os.arch()}`);
        console.log(`CPU: ${os.cpus()[0].model} (${os.cpus().length} núcleos)`);
        console.log(`Memória: ${(os.totalmem() / (1024 ** 3)).toFixed(2)} GB`);
        console.log(`Node.js: ${process.version}\n`);

        // Lê o arquivo de entrada
        console.log(`Lendo arquivo de entrada: ${INPUT_FILE}`);
        const data = fs.readFileSync(INPUT_FILE, 'utf8');
        const numbers = data.split('\n')
                          .filter(line => line.trim() !== '')
                          .map(Number)
                          .filter(num => !isNaN(num)); // Filtra valores não numéricos

        if (numbers.length === 0) {
            throw new Error('O arquivo está vazio ou não contém números válidos');
        }

        console.log(`\n=== Ordenando ${numbers.length.toLocaleString()} números ===`);

        
        const bubbleResult = measureSortPerformance(bubbleSort, numbers, 'Bubble Sort');
        const quickResult = measureSortPerformance(quickSort, numbers, 'Quick Sort');

        // Escreve os arquivos de saída
        fs.writeFileSync(OUTPUT_BUBBLE, bubbleResult.sortedArray.join('\n'));
        fs.writeFileSync(OUTPUT_QUICK, quickResult.sortedArray.join('\n'));

        // Exibe resultados
        console.log('\n=== Resultados ===');
        console.table([
            {
                'Algoritmo': bubbleResult.algorithm,
                'Tempo (ms)': bubbleResult.time.toFixed(3),
                'Memória (KB)': bubbleResult.memory.toFixed(2),
                'Arquivo de Saída': OUTPUT_BUBBLE
            },
            {
                'Algoritmo': quickResult.algorithm,
                'Tempo (ms)': quickResult.time.toFixed(3),
                'Memória (KB)': quickResult.memory.toFixed(2),
                'Arquivo de Saída': OUTPUT_QUICK
            }
        ]);

        // Análise comparativa
        console.log('\n=== Análise Comparativa ===');
        const timeDifference = ((bubbleResult.time - quickResult.time) / quickResult.time * 100).toFixed(0);
        const memDifference = ((bubbleResult.memory - quickResult.memory) / quickResult.memory * 100).toFixed(0);
        
        console.log(`Quick Sort foi ${timeDifference}% mais rápido que Bubble Sort`);
        console.log(`Quick Sort usou ${memDifference}% menos memória que Bubble Sort`);

    } catch (error) {
        console.error('\n⚠️ Erro:', error.message);
        process.exit(1);
    }
}

// Executa o programa
main();