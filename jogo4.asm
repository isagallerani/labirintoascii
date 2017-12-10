TITLE LABIRINTO ASCII
INCLUDE Irvine32.inc
;Parede = 186
;Saída = 254
;Player = 111
;Espaço livre para movimentação = 00
;Clock = 80
;Teletransporte = 79

.data

; ///////////////////////////////////////////// Todas as mensagens de informação necessárias

nomeJogo BYTE "L A B I R I N T O    A S C I I",0 				; Nome do jogo para ser exibido no Menu Inicial
jogoNormal BYTE "N I V E L    N O R M A L",0 						; Título pro nível Normal
jogoHard BYTE "N I V E L    H A R D",0 							; Título pro nível Hard


OpcaoMenu BYTE 0

; Informações da descrição do jogo (como jogar, explicações, etc.)
tituloComoJogar BYTE "C O M O    J O G A R ?",0
messageDescricao1 BYTE "VOCE ESTA PRESO EM UM LABIRINTO E DEVE CHEGAR AO SEU FINAL PARA SE LIBERTAR.",0
messageDescricao2 BYTE "PARA SOBREVIVER E CONTAR ESSA HISTORIA, PRESTE ATENCAO!",0
messageDescricao3 BYTE "EM PRIMEIRO LUGAR: CUIDADO PARA NAO ESGOTAR SUA VIDA COM AS BOMBAS: VOCE MORRERA!",0
messageDescricao4 BYTE "O TELETRANSPORTE TE MOVIMENTA DENTRO DO LABIRINTO, PODENDO TE PREJUDICAR... OU NAO.",0

messageInstrucoes BYTE "I N S T R U C O E S",0
descricaoSetas BYTE "    UTILIZE AS SETAS DO TECLADO PARA SE MOVIMENTAR;",0
descricaoPlayer BYTE "o - PERSONAGEM PRINCIPAL, CONTROLADO POR VOCE;",0
descricaoBomba BYTE "* - BOMBA: DIMINUI O SEU SCORE DE VIDA. CUIDADO!",0
descricaoTeletransporte BYTE "O - TELETRANSPORTE: PODE TE LEVAR A DIFERENTES LUGARES DO LABIRINTO. CUIDADO!",0
messageVoltar BYTE "PRESSIONE '1' PARA VOLTAR AO MENU",0


; Informações para a tela de créditos
tituloCreditos BYTE "C R E D I T O S",0
messageCreditos1 BYTE "JOGO DESENVOLVIDO PARA A DISCIPLINA LABORATORIO DE ARQUITETURA",0
messageCreditos2 BYTE "E ORGANIZACAO DE COMPUTADORES 2, MINISTRADA PELO DOCENTE LUCIANO NERIS",0
messageCreditos3 BYTE "UNIVERSIDADE FEDERAL DE SAO CARLOS - UFSCAR, CAMPUS SAO CARLOS",0
messageCreditos4 BYTE "SEGUNDO SEMESTRE DE 2017",0
messageCreditos5 BYTE "D E S E N V O L V E D O R A S:",0
messageCreditos6 BYTE "GABRIELI DOS SANTOS - CIENCIA DA COMPUTACAO - RA: 726523",0
messageCreditos7 BYTE "ISADORA GALLERANI - CIENCIA DA COMPUTACAO - RA: 726542",0

; Informações para a tela de derrota
messageDerrota BYTE "VOCE PERDEU!",0
messageDerrotaVida BYTE "QUE PENA! SUA VIDA ACABOU...",0

; Informaçõs para a tela de vitória
messageVitoria BYTE "VOCE VENCEU! ",0
messageVitoriaParabens BYTE "PARABENS, CONSEGUIU SAIR VIVO DO LABIRINTO!",0

; Mensagem da opçao "jogar novamente"
messageJogarNovamente BYTE "JOGAR NOVAMENTE",0

; Mensagem da opçao "sair"
messageSair BYTE "PRESSIONE '2' PARA SAIR",0

; Mensagem informando o Score
messageScore BYTE "VIDA:  ",0dh,0ah,0

; Mensagem de tempo restante
messageTempo BYTE "TEMPO RESTANTE: ",0dh,0ah,0

; Vetor de cores disponíveis para uso ao longo do jogo
vetorCores WORD red, yellow, magenta, blue


LabirintoNormal DWORD 186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186 ;saída
rowSize = ($ - LabirintoNormal)
DWORD 186,111,186,00,00,00,00,00,00,00,186,00,00,00,00,00,186,00,00,00,00,00,00,00,00,00,00,00,00,186,00,00,00,00,00,186,00,254
DWORD 186,000,186,186,186,186,186,186,186,00,186,00,186,00,186,00,186,00,186,00,00,186,186,186,186,186,186,186,00,186,00,186,00,186,00,186,00,186 
DWORD 186,042,00,00,00,00,42,00,186,00,00,00,186,00,186,00,186,00,186,00,00,00,00,00,00,00,00,186,00,00,00,186,00,186,00,186,00,186 
DWORD 186,186,186,186,186,186,186,00,186,186,186,186,186,00,186,00,186,00,186,186,186,186,186,186,186,186,00,186,186,186,186,186,00,186,00,186,00,186
DWORD 186,79,00,00,00,00,186,00,00,00,186,00,00,42,186,00,00,00,186,00,00,00,00,00,00,186,00,00,00,186,00,00,00,186,00,00,00,186 
DWORD 186,186,186,186,186,00,186,186,186,00,186,00,186,186,186,186,186,186,186,186,186,186,186,186,00,186,186,186,00,186,00,186,186,186,186,186,186,186 
DWORD 186,00,00,00,186,00,186,00,00,00,186,00,00,00,00,00,00,00,186,00,00,00,00,186,00,186,00,00,00,186,00,00,00,00,00,00,00,186 
DWORD 186,00,186,00,186,00,186,00,186,186,186,00,186,186,186,186,186,00,186,00,186,00,42,186,00,186,00,186,186,186,00,186,186,186,186,186,00,186 
DWORD 186,00,186,00,00,00,186,42,186,00,186,42,186,00,00,00,186,00,186,00,186,00,00,00,00,186,00,186,00,186,00,186,00,00,00,186,00,186 
DWORD 186,00,186,00,186,186,186,00,186,00,186,00,186,00,186,00,186,00,186,00,186,00,00,186,186,186,00,186,00,186,00,186,00,186,00,186,00,186 
DWORD 186,00,186,00,186,00,00,00,186,00,00,00,42,00,186,00,186,00,186,00,186,00,00,186,00,00,00,186,00,00,00,00,00,186,00,186,00,186
DWORD 186,00,186,00,186,00,186,186,186,186,186,186,186,186,186,00,186,00,186,00,186,00,00,186,00,186,186,186,186,186,186,186,186,186,00,186,00,186 
DWORD 186,42,186,42,186,00,186,00,00,00,186,00,00,00,186,00,186,00,186,00,186,00,00,186,00,186,00,00,00,186,00,00,00,186,00,186,00,186 
DWORD 186,00,186,00,186,00,186,00,186,00,186,00,186,00,186,186,186,00,186,00,186,00,00,186,00,186,00,186,00,186,00,186,00,186,186,186,00,186 
DWORD 186,00,186,00,186,00,186,00,186,42,186,00,186,00,00,00,186,00,186,00,186,00,00,186,00,186,00,186,00,186,00,186,00,00,00,186,00,186 
DWORD 186,00,186,186,186,00,186,00,186,00,186,00,186,186,186,00,186,00,186,00,186,186,186,186,00,186,00,186,00,186,00,186,186,186,00,186,00,186 
DWORD 186,00,42,00,42,00,00,00,186,00,00,00,186,00,00,00,00,00,186,00,00,00,00,00,00,00,00,186,00,00,00,186,00,00,00,79,00,186 ;personagem aqui
DWORD 186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186 


LabirintoHard DWORD 186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186 ;personagem 38
rowSize = ($ - LabirintoHard)
;WORD 186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186
DWORD 186,111,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,186,000,000,000,186,000,000,000,000,000,000,000,000,000,186,000,000,000,000,254
DWORD 186,000,186,186,186,186,186,186,186,186,186,000,186,186,186,186,186,000,186,000,186,000,186,186,186,186,186,000,186,000,186,186,186,000,186,000,186,186 
DWORD 186,000,000,000,000,186,000,000,000,000,186,042,186,079,000,000,000,000,186,000,186,042,000,000,000,000,186,000,186,000,186,000,000,000,186,000,000,186 
DWORD 186,186,186,000,186,186,186,186,186,000,186,000,186,186,186,186,186,186,186,000,186,186,186,186,186,000,186,186,186,000,186,000,186,186,186,000,186,186
DWORD 186,79,186,000,186,000,000,000,186,000,186,000,000,000,000,000,000,000,000,000,186,000,000,000,186,000,000,000,186,000,000,000,000,000,186,000,000,186 
DWORD 186,000,186,000,186,000,186,186,186,000,186,000,186,186,186,186,186,186,186,186,186,000,186,000,186,186,186,000,186,000,000,186,186,186,186,000,186,186 
DWORD 186,000,186,000,186,000,186,000,000,000,186,000,000,000,042,000,186,000,000,042,000,000,186,000,000,000,000,042,186,000,000,000,186,000,000,000,000,186 
DWORD 186,000,186,000,186,079,186,000,186,186,186,186,186,186,186,186,186,000,186,186,186,186,186,186,186,186,186,186,186,186,186,000,186,000,186,186,186,186 
DWORD 186,000,186,000,000,000,186,000,186,042,000,000,000,079,000,000,000,000,186,000,000,000,000,000,000,000,042,000,186,000,000,000,186,042,186,000,000,186
DWORD 186,000,186,186,186,000,186,000,186,186,186,000,186,186,186,186,186,186,186,186,186,186,186,000,186,186,186,000,186,186,186,186,186,000,186,000,000,186 
DWORD 186,000,000,000,186,000,186,000,000,000,000,000,186,000,186,000,000,000,000,000,000,000,000,000,186,000,186,000,000,000,186,000,000,000,186,000,000,186
DWORD 186,000,186,186,186,000,186,186,186,000,186,186,186,000,186,000,186,186,186,000,186,186,186,186,186,000,186,186,186,000,186,000,186,186,186,000,000,186 
DWORD 186,000,000,000,000,000,186,000,000,000,000,000,186,000,000,000,186,000,000,000,186,000,186,000,000,000,042,000,186,000,186,000,000,000,186,000,000,186 
DWORD 186,000,186,186,186,186,186,000,186,186,186,000,186,042,186,186,186,000,186,186,186,000,186,000,186,186,186,042,186,000,186,000,186,000,186,186,000,186
DWORD 186,000,186,000,000,000,186,000,186,042,186,042,000,000,186,000,000,000,186,000,000,000,042,000,000,000,186,000,186,000,186,000,186,000,000,000,000,186 
DWORD 186,000,186,000,186,000,186,000,186,000,186,186,186,186,186,000,186,186,186,186,186,186,186,186,186,186,186,000,186,000,186,000,186,000,000,186,000,186 
DWORD 186,000,186,042,186,000,079,000,000,000,000,000,000,000,186,000,000,042,000,000,000,000,000,000,000,000,186,000,000,000,000,042,186,000,000,000,079,186
DWORD 186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186,186
; ///////////////////////////////////////////// Variáveis importantes 

PosicaoPlayer DWORD 156 							; Posição 39x4
PosicaoPlayer2 DWORD 760 							; Posição 39x5x4
PosicaoPlayer3 DWORD 2728 							; 3740; 55x17x4 2720 ; Posição 39X17X4 + 17x4
;score DWORD 100
;score1 DWORD 080
;score2 DWORD 060
;score3 DWORD 040
;score4 DWORD 020
;score5 DWORD 000
vida BYTE 10
contVida BYTE 10
CimaBaixo DWORD 152
EsquerdaDireita DWORD 4
TamMaxX BYTE 100									; Armazena a quantidade de colunas do ecrã do jogo
TamMaxY BYTE 100									; Armazena a quantidade de linhas do ecrã do jogo
cont BYTE 0	
contTime BYTE 0										; Contador auxiliar do tempo
timeM BYTE 60
time BYTE 60

.code 
; ////////////////////////////////////////////////////// PROCs DE MOVIMENTOS

; Realiza movimentação do player com a seta para cima
MovimentoParaCima PROC
	call Clrscr

	cmp OpcaoMenu, 1
	je L1
	cmp OpcaoMenu, 2
	je L2
	
L1:
	mov esi, OFFSET LabirintoNormal
	je L3
	
L2:
	mov esi, OFFSET LabirintoHard
	je L3

L3:
	add esi, PosicaoPlayer
	sub esi, CimaBaixo 									
	mov eax, [esi]
	cmp eax, 00 										; Compara pra saber se é uma posição vazia
	je ValidaMovimentoParaCima
	cmp eax, 186 										; Compara pra saber se é uma parede
	je Parede
	cmp eax, 79 										; Compara pra saber se é um teletransporte 'O'
	je Teletransporte
	cmp eax, 42
	je DecVida
	cmp eax, 254 										; Compara pra saber se é a saída do labirinto
	je Saida

; Validação do movimento do player com a seta para cima	
ValidaMovimentoParaCima:
	mov eax, PosicaoPlayer 									
	mov eax, 111 											
	mov [esi], eax 	
	add esi, CimaBaixo 	
	mov eax, 00 	
	mov [esi], eax 	
	mov eax, PosicaoPlayer 	
	sub eax, CimaBaixo 	
	mov PosicaoPlayer, eax 	
	jmp FimMovimento

; Checa movimentação do player com a seta para cima no teletransporte
Teletransporte:
	mov PosicaoPlayer, eax
	mov eax, PosicaoPlayer3
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	add esi, CimaBaixo
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	sub eax, CimaBaixo
	mov PosicaoPlayer, eax
	jmp FimMovimento								; fim do movimento
	
Parede:
	jmp FimMovimento								; Encontrada uma parede, o movimento acaba									

DecVida:
	dec vida
	call VidaTela
	cmp vida,0
	je FimdeJogo
	
	mov eax, PosicaoPlayer
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	add esi, CimaBaixo
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	sub eax, CimaBaixo
	mov PosicaoPlayer, eax
	jmp FimMovimento
	
Saida: 
	mov edx, 99
	call TelaVitoria  								; Encontrada a saída, chamamos a Tela de Vitória
	ret 

FimdeJogo:
	call TelaDerrota
	
FimMovimento:
	ret 

MovimentoParaCima ENDP

; Realiza movimentação do player com a seta para baixo
MovimentoParaBaixo PROC
	call Clrscr
	cmp OpcaoMenu, 1
	je L1
	cmp OpcaoMenu, 2
	je L2
	
L1:
	mov esi, OFFSET LabirintoNormal
	je L3
	
L2:
	mov esi, OFFSET LabirintoHard
	je L3

L3:
	add esi, PosicaoPlayer
	add esi, CimaBaixo 									
	mov eax, [esi]
	cmp eax, 00 									; Compara pra saber se é uma posição vazia
	je ValidaMovimentoParaBaixo
	cmp eax, 186 									; Compara pra saber se é uma parede
	je Parede
	cmp eax, 79 									; Compara pra saber se é um teletransporte 'O'
	je Teletransporte
	cmp eax, 42
	je DecVida
	cmp eax, 254 									; Compara pra saber se é a saída do labirinto
	je Saida

ValidaMovimentoParaBaixo:
	mov eax, PosicaoPlayer 								
	mov eax, 111
	mov [esi], eax
	sub esi, CimaBaixo
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	add eax, CimaBaixo
	mov PosicaoPlayer, eax
	jmp FimMovimento

Teletransporte:
	mov PosicaoPlayer, eax
	mov eax, PosicaoPlayer3
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	sub esi, CimaBaixo
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	add eax, CimaBaixo
	mov PosicaoPlayer, eax
	jmp FimMovimento

Parede:
	jmp FimMovimento					; Encontrada uma parede, o movimento acaba												

DecVida:
	dec vida
	call VidaTela
	cmp vida,0
	je FimdeJogo
	
	mov eax, PosicaoPlayer
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	sub esi, CimaBaixo
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	add eax, CimaBaixo
	mov PosicaoPlayer, eax
	jmp FimMovimento
	
Saida:
	mov edx, 99
	call TelaVitoria					; Encontrada a saída, chama a Tela de Vitória
	ret
	
FimdeJogo:
	call TelaDerrota
	ret

FimMovimento:
	ret 

MovimentoParaBaixo ENDP

MovimentoParaEsquerda PROC
	call Clrscr
	cmp OpcaoMenu, 1
	je L1
	cmp OpcaoMenu, 2
	je L2
	
L1:
	mov esi, OFFSET LabirintoNormal
	je L3
	
L2:
	mov esi, OFFSET LabirintoHard
	je L3

L3:
	add esi, PosicaoPlayer
	sub esi, EsquerdaDireita 								
	mov eax, [esi]
	cmp eax, 00 	
	je ValidaMovimentoParaEsquerda							
	cmp eax, 186 											
	je Parede
	cmp eax, 79 											
	je Teletransporte
	cmp eax, 42
	je DecVida
	cmp eax, 254
	je Saida
	
ValidaMovimentoParaEsquerda:
	mov eax, PosicaoPlayer 
	mov eax, 111
	mov [esi], eax
	add esi, EsquerdaDireita
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	sub eax, EsquerdaDireita
	mov PosicaoPlayer, eax
	jmp FimMovimento

Teletransporte:
	mov PosicaoPlayer, eax
	mov eax, PosicaoPlayer3
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	add esi, EsquerdaDireita
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	sub eax, EsquerdaDireita
	mov PosicaoPlayer, eax
	jmp FimMovimento
	
Parede:
	jmp FimMovimento
	
DecVida:
	dec vida
	call VidaTela
	cmp vida,0
	je FimdeJogo
	
	mov eax, PosicaoPlayer
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	add esi, EsquerdaDireita
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	sub eax, EsquerdaDireita
	mov PosicaoPlayer, eax
	jmp FimMovimento
	
Saida:
	mov edx, 99
	call TelaVitoria
	ret
	
FimdeJogo:
	call TelaDerrota
	ret

FimMovimento:
	ret 
MovimentoParaEsquerda ENDP

MovimentoParaDireita PROC
	call Clrscr
	cmp OpcaoMenu, 1
	je L1
	cmp OpcaoMenu, 2
	je L2
	
L1:
	mov esi, OFFSET LabirintoNormal
	je L3
	
L2:
	mov esi, OFFSET LabirintoHard
	je L3

L3:
	add esi, PosicaoPlayer
	add esi, EsquerdaDireita 									
	mov eax, [esi]
	cmp eax, 00 												
	je ValidaMovimentoParaDireita
	cmp eax, 186 												
	je Parede
	cmp eax, 79 												
	je Teletransporte
	cmp eax, 42
	je DecVida;
	cmp eax, 254 												
	je Saida

ValidaMovimentoParaDireita:
	mov eax, PosicaoPlayer 
	mov eax, 111
	mov [esi], eax
	sub esi, EsquerdaDireita
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	add eax, EsquerdaDireita
	mov PosicaoPlayer, eax
	jmp FimMovimento

Teletransporte:
	mov PosicaoPlayer, eax
	mov eax, PosicaoPlayer2
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	sub esi, EsquerdaDireita
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	add eax, EsquerdaDireita
	mov PosicaoPlayer, eax
	jmp FimMovimento
	
Parede: 
	jmp FimMovimento
	
DecVida:
	dec vida
	call VidaTela
	cmp vida,0
	je FimdeJogo
	
	mov eax, PosicaoPlayer
	mov PosicaoPlayer, eax
	mov eax, 00
	mov [esi], eax
	sub esi, EsquerdaDireita
	mov eax, 00
	mov [esi], eax
	mov eax, PosicaoPlayer
	add eax, EsquerdaDireita
	mov PosicaoPlayer, eax
	jmp FimMovimento
	
	

Saida:
	mov edx, 99
	call TelaVitoria
	ret
	
FimdeJogo:
	call TelaDerrota
	ret

FimMovimento:
	ret 

MovimentoParaDireita ENDP

; /////////////////////////////////////////////////// PROCs DE TELAS

VidaTela PROC
LTI3:
	mov dl, 1
	mov dh, 0
	call GOTOXY	
	mov edx, OFFSET messageScore									; Imprime na tela o título da página nas posições X e Y
	call WRITESTRING
	
	mov dl, 7
	mov dh, 0
	call GOTOXY
	movzx eax, vida
	call WRITEDEC
	
	ret
VidaTela ENDP


DesenhaTelaNormal PROC
	call VidaTela
	mov dh, 1													; Seta posição no labirinto X
	mov dl, 0 													; Seta posição no labirinto Y
	call GOTOXY 
	mov ebx, OFFSET LabirintoNormal 
	mov ecx, 0 													; Inicializa contador
	
PrintLoop: 
	mov eax, [ebx] 
	add ebx, 4 													; move pra proxima posição offset
	inc ecx 													; incrementa contador
	call WriteChar 												; O QUE FAZ ISSO?? **************************
	cmp ecx, 38 												;Compare for end of row for each 19 positions	
	je ProximaLinha
	cmp ecx, 76
	je ProximaLinha
	cmp ecx, 114
	je ProximaLinha
	cmp ecx, 152
	je ProximaLinha
	cmp ecx, 190
	je ProximaLinha
	cmp ecx, 228
	je ProximaLinha
	cmp ecx, 266
	je ProximaLinha
	cmp ecx, 304
	je ProximaLinha
	cmp ecx, 342
	je ProximaLinha
	cmp ecx, 380
	je ProximaLinha
	cmp ecx, 418
	je ProximaLinha
	cmp ecx, 456
	je ProximaLinha
	cmp ecx, 494
	je ProximaLinha
	cmp ecx, 532
	je ProximaLinha
	cmp ecx, 570
	je ProximaLinha
	cmp ecx, 608
	je ProximaLinha
	cmp ecx, 646
	je ProximaLinha
	cmp ecx, 684
	je ProximaLinha
	cmp ecx, 722
	jne PrintLoop
	jmp Print

ProximaLinha:
    call Crlf
	jmp PrintLoop

Print:
	call Crlf
	ret	
DesenhaTelaNormal ENDP

DesenhaTelaHard PROC
	call VidaTela
	mov dh, 1													; Seta posição no labirinto X
	mov dl, 0 													; Seta posição no labirinto Y
	call GOTOXY 
	mov ebx, OFFSET LabirintoHard
	mov ecx, 0 													; Inicializa contador
	
PrintLoop: 
	mov eax, [ebx] 
	add ebx, 4 													; move pra proxima posição offset
	inc ecx 													; incrementa contador
	call WriteChar 												; O QUE FAZ ISSO?? **************************
	cmp ecx, 38 												;Compare for end of row for each 19 positions	
	je ProximaLinha
	cmp ecx, 76
	je ProximaLinha
	cmp ecx, 114
	je ProximaLinha
	cmp ecx, 152
	je ProximaLinha
	cmp ecx, 190
	je ProximaLinha
	cmp ecx, 228
	je ProximaLinha
	cmp ecx, 266
	je ProximaLinha
	cmp ecx, 304
	je ProximaLinha
	cmp ecx, 342
	je ProximaLinha
	cmp ecx, 380
	je ProximaLinha
	cmp ecx, 418
	je ProximaLinha
	cmp ecx, 456
	je ProximaLinha
	cmp ecx, 494
	je ProximaLinha
	cmp ecx, 532
	je ProximaLinha
	cmp ecx, 570
	je ProximaLinha
	cmp ecx, 608
	je ProximaLinha
	cmp ecx, 646
	je ProximaLinha
	cmp ecx, 684
	je ProximaLinha
	cmp ecx, 722
	jne PrintLoop
	jmp Print

ProximaLinha:
    call Crlf
	jmp PrintLoop

Print:
	call Crlf
	ret	
DesenhaTelaHard ENDP

TelaInicio PROC

	mov dl, 13										; Trecho para imprimir o nome do jogo na tela principal
	mov dh, 2
	call GOTOXY										
	mov edx, OFFSET nomeJogo
	call WRITESTRING
	
	;call Clrscr
	;mov dl, 40
	;mov dh, 2
	;call GOTOXY	
	;mov edx, OFFSET nomeJogo									; Imprime na tela o título da página nas posições X e Y
	;call WRITESTRING
	
	;Inicialmente, faremos a apresentação de todas as opções de telas acessíveis ao usuário, como 'Como Jogar', 'Nível Normal', 'Nível Hard' e 'Créditos'
	cmp OpcaoMenu, 0
	jz Opt1
	cmp OpcaoMenu, 1
	jz Opt2
	cmp OpcaoMenu, 2
	jz Opt3
	cmp OpcaoMenu, 3
	jz Opt4
									; Imprime 'nomeJogo' nas posições X e Y


	Opt1:
	mov dl, 14
	mov dh, 5
	call GOTOXY
	mov al, 62
	call WriteChar
	jmp PrintScreen

	Opt2:
	mov dl, 14
	mov dh, 7
	call GOTOXY
	mov al, 62
	call WriteChar
	jmp PrintScreen

	Opt3:
	mov dl, 14
	mov dh, 9
	call GOTOXY
	mov al, 62
	call WriteChar
	jmp PrintScreen

	Opt4:
	mov dl, 14
	mov dh, 11
	call GOTOXY
	mov al, 62
	call WriteChar
	jmp PrintScreen

	
PrintScreen:
	mov dl, 16											; Trecho para imprimir a opção 'Como Jogar' na tela principal nas posições X e Y
	mov dh, 5
	call GOTOXY
	mov edx, OFFSET tituloComoJogar
	call WRITESTRING																			
	
	mov dl, 16											; Trecho para imprimir a opção 'Nível Normal' na tela principal nas posições X e Y
	mov dh, 7
	call GOTOXY
	mov edx, OFFSET jogoNormal
	call WRITESTRING
	
	mov dl, 16											; Trecho para imprimir a opção 'Nível Hard' na tela principal nas posições X e Y
	mov dh, 9
	call GOTOXY
	mov edx, OFFSET jogoHard
	call WRITESTRING
	
	mov dl, 16											; Trecho para imprimir a opção 'Créditos' na tela principal nas posições X e Y
	mov dh, 11
	call GOTOXY
	mov edx, OFFSET tituloCreditos
	call WRITESTRING

	mov dl, 80
	mov dh, 80
	call GOTOXY
	
	ret
TelaInicio ENDP

TelaInstrucoes PROC
	call Clrscr
LTI3:
	mov dl, 17
	mov dh, 2
	call GOTOXY	
	mov edx, OFFSET tituloComoJogar									; Imprime na tela o título da página nas posições X e Y
	call WRITESTRING
	
	; Imprime todas as mensagens de orientações do jogo nas respectivas posições X e Y
	mov dl, 5
	mov dh, 4
	call GOTOXY
	mov edx, OFFSET messageDescricao1
	call WRITESTRING
	
	mov dl, 5
	mov dh, 5
	call GOTOXY
	mov edx, OFFSET messageDescricao2
	call WRITESTRING
	
	mov dl, 5
	mov dh, 7
	call GOTOXY
	mov edx, OFFSET messageDescricao3
	call WRITESTRING
	
	mov dl, 5
	mov dh, 8
	call GOTOXY
	mov edx, OFFSET messageDescricao4
	call WRITESTRING
	
	mov dl, 17
	mov dh, 11
	call GOTOXY
	mov edx, OFFSET messageInstrucoes
	call WRITESTRING
	
	mov dl, 5
	mov dh, 13
	call GOTOXY
	mov edx, OFFSET descricaoSetas
	call WRITESTRING
	
	mov dl, 5
	mov dh, 14
	call GOTOXY
	mov edx, OFFSET descricaoPlayer
	call WRITESTRING
	
	mov dl, 5
	mov dh, 15
	call GOTOXY
	mov edx, OFFSET descricaoBomba
	call WRITESTRING
	
	mov dl, 5
	mov dh, 16
	call GOTOXY
	mov edx, OFFSET descricaoTeletransporte
	call WRITESTRING
	
	mov dl, 5
	mov dh, 19
	call GOTOXY
	mov edx, OFFSET messageVoltar
	call WRITESTRING
	
	mov dl, 5
	mov dh, 20
	call GOTOXY
	mov edx, OFFSET messageSair
	call WRITESTRING

menu:
	mov  eax,50
	call Delay
	CALL ReadChar	
	CMP AL, '1' 
	je	menuInicial
	CMP AL, '2' 
	EXIT

menuInicial:
	call Clrscr
	call main
	jmp menu

; Loop pra verificar comando de telas desejado pelo usuário
;LTI1:														;Aguarda o comando das setas laterais, ou "q" para executar a proxima ação
;  	mov  eax,50
;   	call Delay
;   	call ReadKey
;   	jz  LTI1											
;	cmp  dx, 0025h
;	je LTI3
;	cmp dx, 0027h
;	jne LTI1	
	ret
	
TelaInstrucoes ENDP

TelaCreditos PROC
LTI3:
	call Clrscr
	mov dl, 20
	mov dh, 2
	call GOTOXY	
	mov edx, OFFSET tituloCreditos									; Imprime na tela o título da página nas posições X e Y
	call WRITESTRING
	
	mov dl, 5
	mov dh, 4
	call GOTOXY
	mov edx, OFFSET messageCreditos1
	call WRITESTRING
	
	mov dl, 5
	mov dh, 5
	call GOTOXY
	mov edx, OFFSET messageCreditos2
	call WRITESTRING
	
	mov dl, 5
	mov dh, 7
	call GOTOXY
	mov edx, OFFSET messageCreditos3
	call WRITESTRING
	
	mov dl, 5
	mov dh, 8
	call GOTOXY
	mov edx, OFFSET messageCreditos4
	call WRITESTRING
	
	mov dl, 15
	mov dh, 11
	call GOTOXY
	mov edx, OFFSET messageCreditos5
	call WRITESTRING
	
	mov dl, 5
	mov dh, 12
	call GOTOXY
	mov edx, OFFSET messageCreditos6
	call WRITESTRING
	
	mov dl, 5
	mov dh, 13
	call GOTOXY
	mov edx, OFFSET messageCreditos7
	call WRITESTRING
	
	mov dl, 5
	mov dh, 17
	call GOTOXY
	mov edx, OFFSET messageVoltar
	call WRITESTRING
	
	mov dl, 5
	mov dh, 18
	call GOTOXY
	mov edx, OFFSET messageSair
	call WRITESTRING	
	
menu:
	mov  eax,50
	call Delay
	CALL ReadChar	
	CMP AL, '1' 
	je	menuInicial
	CMP AL, '2' 
	je sair
	EXIT

menuInicial:
	call Clrscr
	call main
	jmp menu
	
sair:
	EXIT
	
	ret

TelaCreditos ENDP

TelaDerrota PROC
; Imprime na tela todas as mensagens referentes à derrota nas respectivas posições X e Y
LTI3:
	call Clrscr
	mov dl, 8
	mov dh, 5
	call GOTOXY
	mov edx, OFFSET messageDerrota
	call WRITESTRING
	
	mov dl, 5
	mov dh, 6
	call GOTOXY
	mov edx, OFFSET messageDerrotaVida
	call WRITESTRING
	
	mov dl, 5
	mov dh, 8
	call GOTOXY
	mov edx, OFFSET messageVoltar
	call WRITESTRING	
	
	mov dl, 5
	mov dh, 9
	call GOTOXY
	mov edx, OFFSET messageSair
	call WRITESTRING
	; Loop pra verificar comando de telas desejado pelo usuário
menu:
	mov  eax,50
	call Delay
	CALL ReadChar	
	CMP AL, '1' 
	je	menuInicial
	CMP AL, '2' 
	je sair

menuInicial:
	call Clrscr
	call main
	jmp menu
	
sair:
	EXIT

	ret
	
	ret
	
TelaDerrota ENDP

TelaVitoria PROC
	call Clrscr
LTI3:
	mov dl, 8
	mov dh, 5
	call GOTOXY	
	mov edx, OFFSET messageVitoria								
	call WRITESTRING
	
	mov dl, 5
	mov dh, 6
	call GOTOXY
	mov edx, OFFSET messageVitoriaParabens
	call WRITESTRING

	mov dl, 3
	mov dh, 8
	call GOTOXY
	mov edx, OFFSET messageVoltar
	call WRITESTRING
	
	mov dl, 3
	mov dh, 9
	call GOTOXY
	mov edx, OFFSET messageSair
	call WRITESTRING
	
	; Loop pra verificar comando de telas desejado pelo usuário
menu:
	mov  eax,50
	call Delay
	CALL ReadChar	
	CMP AL, '1' 
	je	menuInicial
	CMP AL, '2' 
	je sair

menuInicial:
	call Clrscr
	call main
	jmp menu
	
sair:
	EXIT

	ret
	
TelaVitoria ENDP

TelaJogoNormal PROC
	call Clrscr
	;mov ebx, vida
	;mov ebx, 10
GameLoop:
	cmp edx, 99 											; Fim do jogo equivale a '99'
	je FimJogo
	call DesenhaTelaNormal
	call ReadKey											; Lê input do teclado
	jz GameLoop
	cmp ah, 72 												; Seta de cima
	je Cima		
	cmp ah, 80 												; Seta de baixo
	je Baixo		
	cmp ah, 75 												; Seta da esquerda
	je Esquerda		
	cmp ah, 77 												; Seta da direita
	je Direita

Cima:														; Move pra cima
	call MovimentoParaCima
	call Proximo
	
Baixo:														; Move pra baixo
	call MovimentoParaBaixo
	call Proximo
	
Esquerda:													; Move pra esquerda
	call MovimentoParaEsquerda
	call Proximo
	
Direita:													; Move pra direita
	call MovimentoParaDireita
	call Proximo
	
Proximo: 
	jmp GameLoop
	
FimJogo:
	call Crlf
	call TelaVitoria
	ret

TelaJogoNormal ENDP

TelaJogoHard PROC
	call Clrscr
GameLoop:
	cmp edx, 99 											; Fim do jogo equivale a '99'
	je FimJogo
	call DesenhaTelaHard
	call ReadKey											; Lê input do teclado
	jz GameLoop
	cmp ah, 72 												; Seta de cima
	je Cima		
	cmp ah, 80 												; Seta de baixo
	je Baixo		
	cmp ah, 75 												; Seta da esquerda
	je Esquerda		
	cmp ah, 77 												; Seta da direita
	je Direita

Cima:														; Move pra cima
	call MovimentoParaCima
	call Proximo
	
Baixo:														; Move pra baixo
	call MovimentoParaBaixo
	call Proximo
	
Esquerda:													; Move pra esquerda
	call MovimentoParaEsquerda
	call Proximo
	
Direita:													; Move pra direita
	call MovimentoParaDireita
	call Proximo
	
Proximo: 
	jmp GameLoop
	
FimJogo:
	call Crlf
	call TelaVitoria
	ret

TelaJogoHard ENDP


; /////////////////////////////////////////////////// MAIN

main PROC
LoopMenu:
	mov edx, 0 								
	call Clrscr
	call TelaInicio
	
AguardaInput:
	mov eax, 50
	call Delay
	call ReadKey

	cmp dx, VK_UP
	jz DecMenu

	cmp dx, VK_DOWN
	jz IncMenu

	cmp dx, VK_RETURN						; seleciona uma opção 
	jz Opt
	jmp AguardaInput

DecMenu:
	cmp OpcaoMenu, 0
	jz AguardaInput
	dec OpcaoMenu
	jmp LoopMenu

IncMenu:
	cmp OpcaoMenu, 3
	jz AguardaInput
	inc OpcaoMenu
	jmp LoopMenu

Opt: 
	Cmp OpcaoMenu, 0
	Jz Instrucoes
	Cmp OpcaoMenu, 1
	Jz NivelNormal
	Cmp OpcaoMenu, 2
	Jz NivelHard
	cmp OpcaoMenu, 3
	jz Creditos
	Jmp LoopMenu

Instrucoes:
	call TelaInstrucoes
	call TelaInstrucoes
	mov eax, 50
	call Delay
	call ReadKey
	cmp dx, VK_RETURN
	call TelaInicio
	
NivelNormal:
	call TelaJogoNormal
	
NivelHard:
	call TelaJogoHard
	
Creditos:
	call TelaCreditos


main ENDP
END main
