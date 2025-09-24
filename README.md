
# 🎲 Guess Game — Lua (CLI)

Um jogo de adivinhação em **Lua**, onde o jogador deve tentar descobrir um número secreto escolhido aleatoriamente pelo programa. O jogo possui diferentes níveis de dificuldade e fornece dicas em estilo **"quente ou frio"** para orientar o jogador.

## 🚀 Como funciona
- O jogador escolhe a dificuldade:  
  - **Fácil (1–100)**  
  - **Médio (1–500)**  
  - **Difícil (1–1000)**  
- O programa sorteia um número dentro do intervalo.  
- O jogador faz palpites, e o jogo dá dicas:  
  - 🔥 **HOT**: muito próximo do número certo.  
  - 🌡️ **Warm**: relativamente próximo.  
  - ❄️ **Freezing**: muito distante.  
- O jogador pode desistir digitando `y`.  
- Ao acertar ou desistir, o jogo mostra o número secreto e dá a opção de jogar novamente.  

## 📌 Exemplo de jogo
```
=-=-=-=-=-=-=-=-=-=-=-=GUESS GAME=-=-=-=-=-=-=-=-=-=-=-=
Choose the difficulty: Easy [1], Medium [2] or Hard [3]:
1

=-=-=-=-=-=-=-=You chose the easy difficulty!=-=-=-=-=-=-=-=
Type a number between 1 and 100 and try to guess the correct
REMEMBER: You can always forfeit typing "y"

Attempt number 1:
50
It's warm! You are getting close, try a bigger number.

Attempt number 2:
70
HOT, HOT, HOT! You are very close, try a smaller number!

Attempt number 3:
65
You are correct! Congratulations, you won the game in 3 attempts!
```

## 📂 Estrutura
```
guess_game.lua   # Script principal do jogo
```

## ▶️ Como executar
1. Instale o **Lua 5.4+** no seu sistema.  
2. Execute no terminal:
   ```bash
   lua guess_game.lua
   ```

## 🛠️ Tecnologias
- Lua 5.4  
- Biblioteca padrão `math` e `os`  

## 📄 Licença
Projeto livre para estudos e uso pessoal.
