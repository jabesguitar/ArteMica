# ArteMica — Laboratório de Arte (6º ano)

Versão atualizada com as novas fotografias enviadas em 20/11/2026.

## Conteúdo incluído
- Resumo de danças folclóricas, auto do boi, balaio, literatura de cordel, personagens, rimas, oralidade e xilogravura.
- Imagens do livro e fotografias das páginas do questionário.
- Quiz principal com 27 questões baseadas nos trechos legíveis recebidos.
- Níveis: Fácil (90 s / 3 vidas), Normal (60 s / 4 vidas), Difícil (30 s / 5 vidas).
- Pergunta pulada volta ao final da fila; dicas; perguntas embaralhadas.
- Jogos de associação, memória, verdadeiro/falso, caça-palavras, completar ideias e cruzadinha.
- Música ambiente sintetizada, controle de volume e efeitos sonoros.
- PWA e cache offline.

## Gabarito incorporado
- Organizando o conhecimento, questão 3: camponeses/festas ao ar livre, movimentos livres e espontâneos e sapateado/batidas de pés/palmas = danças populares; castelos/palácios, movimentos refinados/regras e passos sofisticados/técnica = danças de salão.
- Testando as ideias, questão 2: alternativa C (valsa em três tempos, giros e popular nos salões do século XIX).
- Organizando o conhecimento, questões 1 e 2, e Testando as ideias, questão 1: dependem da página explicativa anterior sobre dança medieval e carole, que não foi enviada. O app assinala essa lacuna em vez de inventar uma resposta definitiva.

## Publicar no GitHub
1. Extraia este ZIP no computador.
2. Abra https://github.com/jabesguitar/ArteMica
3. Add file > Upload files.
4. Arraste todos os arquivos e pastas que estão dentro da pasta extraída (não envie apenas o ZIP).
5. Confirme que a pasta `assets` e `assets/pages` aparecem na lista.
6. Em Commit changes, use a mensagem `Atualiza ArteMica com material e questionário`.
7. Clique em Commit changes.
8. Settings > Pages > Deploy from a branch > Branch `main` > pasta `/ (root)` > Save.
9. Aguarde a publicação. URL esperada: https://jabesguitar.github.io/ArteMica/

## Testes realizados nesta atualização
- `node --check app.js`: aprovado.
- Verificação de existência de todos os caminhos de imagens usados pelo HTML: aprovada.
- Verificação do conteúdo das imagens recém-adicionadas no pacote: aprovada.

A instalação e o comportamento hospedado no GitHub Pages precisam ser confirmados após o primeiro deploy.
