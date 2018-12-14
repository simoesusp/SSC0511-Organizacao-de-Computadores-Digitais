;Beatriz Guidi 10284903 Rafael Doering Soares 10408410
jmp main

campWidth: var #1
      static campWidth, #20
campHeight: var #1
   static campHeight, #15

bombsQty: var #1
   static bombsQty, #16

realCamp: var #1200
visualCamp: var #1200
processedCamp: var #1200
bombChar: var #1
   static bombChar, #'*'

selectorX: var #1
   static selectorX, #0
selectorY: var #1
   static selectorY, #0

selectorTimeCount: var #2
   static selectorTimeCount + #0, #0
   static selectorTimeCount + #1, #0

selectorMaxTime: var #1
   static selectorMaxTime, #10

incRand: var #1;circular a tabela de nr. Randomicos
randSequence : var #30; tabela de nr. Randomicos entre 0 - 7
   static randSequence + #0 , #56241
   static randSequence + #1 , #53281
   static randSequence + #2 , #1409
   static randSequence + #3 , #30428
   static randSequence + #4 , #51627
   static randSequence + #7 , #10476
   static randSequence + #8 , #42149
   static randSequence + #9 , #15652
   static randSequence + #10, #40367
   static randSequence + #11, #1221
   static randSequence + #12, #33317
   static randSequence + #13, #49878
   static randSequence + #14, #57321
   static randSequence + #15, #13091
   static randSequence + #16, #12214
   static randSequence + #17, #7925
   static randSequence + #18, #15409
   static randSequence + #19, #51788
   static randSequence + #20, #29654
   static randSequence + #21, #23848
   static randSequence + #22, #43871
   static randSequence + #23, #56169
   static randSequence + #24, #33517
   static randSequence + #25, #39218
   static randSequence + #26, #39371
   static randSequence + #27, #61204
   static randSequence + #28, #47533
   static randSequence + #29, #18006
   static randSequence + #30, #18996
   static randSequence + #31, #18456
   static randSequence + #32, #19456
   static randSequence + #33, #21456
   static randSequence + #34, #22456
   static randSequence + #35, #0



   
gameOverScreen00 : string "                                        "
gameOverScreen01 : string "                                        "
gameOverScreen02 : string "      ooo   v       v  e e e    r r r   "
gameOverScreen03 : string "     o   o   v     v   e        r   r   "
gameOverScreen04 : string "    o     o   v   v    e e e    r       "
gameOverScreen05 : string "     o   o     v v     e        r       "
gameOverScreen06 : string "      ooo       v      e e e    r       "
gameOverScreen07 : string "                                        "
gameOverScreen08 : string "                                        "
gameOverScreen09 : string "                                        "
gameOverScreen10 : string "                                        "
gameOverScreen11 : string "                                        "
gameOverScreen12 : string "                                        "
gameOverScreen13 : string "                                        "
gameOverScreen14 : string "               0       0                "
gameOverScreen15 : string "               |       |                "
gameOverScreen16 : string "                |     |                 "
gameOverScreen17 : string "                 |___|                  "
gameOverScreen18 : string "             WWW |   | WWW              "
gameOverScreen19 : string "             | |( O O )| |              "
gameOverScreen20 : string "             | | | - | | |              "
gameOverScreen21 : string "             | |__| |__| |              "
gameOverScreen22 : string "              |         |               "
gameOverScreen23 : string "               |       |                "
gameOverScreen24 : string "               |       |                "
gameOverScreen25 : string "               |  ___  |                "
gameOverScreen26 : string "               | |   | |                "
gameOverScreen27 : string "              | |     | |               "
gameOverScreen28 : string "             | |       | |              "
gameOverScreen29 : string "                                        "

gameOverScreen100 : string "                                        "
gameOverScreen101 : string "                                        "
gameOverScreen102 : string "      ooo   v       v  e e e    r r r   "
gameOverScreen103 : string "     o   o   v     v   e        r   r   "
gameOverScreen104 : string "    o     o   v   v    e e e    r       "
gameOverScreen105 : string "     o   o     v v     e        r       "
gameOverScreen106 : string "      ooo       v      e e e    r       "
gameOverScreen107 : string "                                        "
gameOverScreen108 : string "                                        "
gameOverScreen109 : string "                                        "
gameOverScreen110 : string "                                        "
gameOverScreen111 : string "                                        "
gameOverScreen112 : string "                                        "
gameOverScreen113 : string "                                        "
gameOverScreen114 : string "               0       0                "
gameOverScreen115 : string "               |       |                "
gameOverScreen116 : string "                |     |                 "
gameOverScreen117 : string "                 |___|                  "
gameOverScreen118 : string "             WWW |   | WWW              "
gameOverScreen119 : string "             | |( O O )| |              "
gameOverScreen120 : string "             | | | - | | |              "
gameOverScreen121 : string "             | |__| |__| |              "
gameOverScreen122 : string "              |         |               "
gameOverScreen123 : string "               |       |                "
gameOverScreen124 : string "               |       |                "
gameOverScreen125 : string "               |  ___  |                "
gameOverScreen126 : string "               | |   | |                "
gameOverScreen127 : string "              | |     | |               "
gameOverScreen128 : string "             | |       | |              "
gameOverScreen129 : string "                                        "

rand:
   push r1

   load r0, incRand
   inc r0
   loadn r1, #32
   mod r0, r0, r1
   store incRand, r0
   loadn r1, #randSequence
   add r1, r1, r0
   loadi r0, r1

   pop r1
   rts

;r0 is max value
randwithMax:
   push r1

   mov r1, r0
   call rand
   mod r0, r0, r1

   pop r1
   rts

;args: r0 - time to sleep
sleep:
   push r0
   push r1
   push r7

   loadn r7, #0
sleep_loop:
   cmp r0, r7
   jel sleep_loop_end
   dec r0
   loadn r1, #514
sleep_loop_in:
   cmp r1, r7
   jle sleep_loop_in_end
   dec r1
   jmp sleep_loop_in
sleep_loop_in_end:
   jmp sleep_loop
sleep_loop_end:

   pop r7
   pop r1
   pop r0
   rts

sleepSmall:
   push r0
   push r7
   push r1

   loadn r7, #0
sleepSmall_loop:
   cmp r0, r7
   jle sleepSmall_loop_end
   dec r0
   inchar r1
   jmp sleepSmall_loop
sleepSmall_loop_end:

   pop r1
   pop r7
   pop r0
   rts

;args: r0 - x, r1 - y
;outputs: r0 - (0 if false, 1 if true)
isInsideBounds:
   push r1
   push r5
   push r6
   push r7

   loadn r5, #0
   load r7, campWidth
   load r6, campHeight
   cmp r0, r5
   jle isInsideBounds_false
   cmp r0, r7
   jeg isInsideBounds_false
   cmp r1, r5
   jle isInsideBounds_false
   cmp r1, r6
   jeg isInsideBounds_false

isInsideBounds_true:
   loadn r0, #1
   jmp isInsideBounds_end
isInsideBounds_false:
   loadn r0, #0
   jmp isInsideBounds_end
isInsideBounds_end:

   pop r7
   pop r6
   pop r5
   pop r1
   rts


;args: r0 - camp address, r1 - value to fill it with
initializeCamp:
   push r0
   push r1
   push r2
   push r3

   load r2, campWidth
   load r3, campHeight
   mul r2, r2, r3
   loadn r3, #0
   ;r2 is now the camp size
   ;r3 is now the counter

initializeCamp_loop:
   cmp r3, r2
   jgr initializeCamp_loop_end
   inc r3
   storei r0, r1
   inc r0
   jmp initializeCamp_loop
initializeCamp_loop_end:

   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - x, r1 - y, r2 - char
print:
   push r0
   push r1
   push r2
   push r3

   loadn r3, #40
   mul r1, r1, r3
   add r1, r1, r0
   outchar r2, r1

   pop r3
   pop r2
   pop r1
   pop r0
   rts

print_camp:
   push r0
   push r1
   push r2
   push r3

   loadn r3, #40
   mul r1, r1, r3
   add r1, r1, r0
   outchar r2, r1

   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - x, r1 - y, r2 - camp addr
printCampChar:
   push r0
   push r1
   push r2
   push r3

   load r3, campWidth
   mul r3, r1, r3
   add r3, r0, r3
   add r3, r2, r3
   loadi r2, r3
   call print_camp

   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - camps address
printCamp:
   push r0
   push r1
   push r2
   push r3
   push r4

   load r1, campHeight
   load r2, campWidth

   loadn r3, #0   ;outter counter ( x )
printCamp_loop:
   cmp r3, r2
   jeg printCamp_loop_end
   loadn r4, #0   ;inner counter ( y )
printCamp_loop2:
   cmp r4, r1
   jeg printCamp_loop2_end

   push r0
   push r1
   push r2
   mov r2, r0
   mov r0, r3
   mov r1, r4
   call printCampChar
   pop r2
   pop r1
   pop r0

   inc r4
   jmp printCamp_loop2
printCamp_loop2_end:
   inc r3
   jmp printCamp_loop
printCamp_loop_end:

   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   rts

updatePrintCamp:
   push r0
   push r1
   push r2
   push r3
   push r4
   push r5
   push r6
   push r7

   loadn r0, #realCamp
   loadn r1, #visualCamp
   loadn r2, #processedCamp

   load r3, campWidth
   load r4, campHeight
   mul r3, r3, r4
   loadn r4, #0
updatePrintCamp_loop:
   cmp r4, r3
   jeg updatePrintCamp_loop_end

   loadi r5, r0
   loadi r6, r1

   loadn r7, #0
   cmp r6, r7
   jeq updatePrintCamp_isZero
   loadn r7, #1
   cmp r6, r7
   jeq updatePrintCamp_isOne
updatePrintCamp_isZero:
   loadn r5, #'e'
   
   storei r2, r5
   jmp updatePrintCamp_ifEnd
updatePrintCamp_isOne:
   loadn r5, #'e'

   storei r2, r5
   
   jmp updatePrintCamp_ifEnd
updatePrintCamp_ifEnd:

   inc r0
   inc r1
   inc r2

   inc r4
   jmp updatePrintCamp_loop
updatePrintCamp_loop_end:

   pop r7
   pop r6
   pop r5
   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - camp addrrs, r1 - x, r2 - y, r3 - char
setCamp:
   push r0
   push r1
   push r2
   push r3
   push r4

   load r4, campWidth
   mul r2, r2, r4
   add r2, r2, r1 ;r2 now contains absolute position
   add r0, r0, r2
   storei r0, r3

   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - camp addrrs, r1 - x, r2 - y, r3 - char
setAndDrawCamp:
   push r0
   push r1
   push r2
   call setCamp
   mov r0, r1
   mov r1, r2
   mov r2, r3
   call print
   pop r2
   pop r1
   pop r0
   rts

generateBombs:
   push r0
   push r1
   push r2
   push r3
   push r4

   loadn r1, #0
   load r2, bombsQty

generateBombs_loop:
   cmp r1, r2
   jeg generateBombs_loop_end

   load r0, campWidth
   call randwithMax
   mov r3, r0 ;r3 is the random x
   load r0, campHeight
   call randwithMax
   mov r4, r0 ;r4 is the ramdom y

   push r0
   push r1
   push r2
   mov r0, r3
   mov r1, r4
   loadn r2, #realCamp
   call readCamp
   load r1, bombChar
   cmp r0, r1
   jne generateBombs_continue
   pop r2
   pop r1
   pop r0
   jmp generateBombs_loop
generateBombs_continue:
   pop r2
   pop r1
   pop r0

   push r1
   push r2
   push r3
   loadn r0, #realCamp
   mov r1, r3
   mov r2, r4
   load r3, bombChar
   call setCamp
   pop r3
   pop r2
   pop r1

   inc r1
   jmp generateBombs_loop
generateBombs_loop_end:

   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - x, r1 - y, r2 - camp addr
;returns char in r0
readCamp:
   push r1
   push r2
   push r3

   load r3, campWidth
   mul r1, r1, r3
   add r1, r1, r0
   add r2, r2, r1
   loadi r0, r2

   pop r3
   pop r2
   pop r1
   rts

;args: r0 - x, r1 - y
;returns bombs count in r0
countBombs:
   push r1 ;arg1 - y
   push r2 ;random const
   push r3 ;loop x
   push r4 ;loop y
   push r6 ;bombs count
   push r7 ;const

   dec r0
   dec r1

   loadn r6, #0
   loadn r3, #0
   loadn r7, #3
countBombs_loop1:
   cmp r3, r7 ;x
   jeg countBombs_loop1_end
   loadn r4, #0
countBombs_loop2:
   cmp r4, r7 ;y
   jeg countBombs_loop2_end

   push r0
   push r1
   push r2

   add r0, r0, r3
   add r1, r1, r4
   call isInsideBounds
   loadn r2, #0
   cmp r0, r2
   jeq countBombs_outisdeBounds
   jmp countBombs_insideBounds
countBombs_insideBounds:
   pop r2
   pop r1
   pop r0
   jmp countBombs_endBoundsIf
countBombs_outisdeBounds:
   inc r4
   pop r2
   pop r1
   pop r0
   jmp countBombs_loop2
countBombs_endBoundsIf:

   push r0
   push r1
   push r2

   add r0, r0, r3
   add r1, r1, r4
   loadn r2, #realCamp
   call readCamp
   load r2, bombChar
   cmp r0, r2
   jeq countBombs_isBomb
   jmp countBombs_isNotBomb
countBombs_isBomb:
   inc r6
   jmp countBombs_isBomb_endIf
countBombs_isNotBomb:
   jmp countBombs_isBomb_endIf
countBombs_isBomb_endIf:

   pop r2
   pop r1
   pop r0

   inc r4
   jmp countBombs_loop2
countBombs_loop2_end:
   inc r3
   jmp countBombs_loop1
countBombs_loop1_end:
   mov r0, r6

   pop r7
   pop r6
   pop r4
   pop r3
   pop r2
   pop r1
   rts

generateNumbers:
   push r0
   push r1
   push r2 ;loop x
   push r3 ;loop y
   push r4

   load r0, campWidth
   load r1, campHeight
   loadn r2, #0
generateNumbers_loop1:
   cmp r2, r0
   jeg generateNumbers_loop1_end
   loadn r3, #0
generateNumbers_loop2:
   cmp r3, r1
   jeg generateNumbers_loop2_end

   push r0
   push r1
   push r2
   push r3
   push r4

   push r2
   mov r0, r2
   mov r1, r3
   loadn r2, #realCamp
   call readCamp
   pop r2
   load r1, bombChar
   cmp r0, r1
   jeq generateNumbers_isBomb
   jmp generateNumbers_isNotBomb
generateNumbers_isBomb:
   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   inc r3
   jmp generateNumbers_loop2
generateNumbers_isNotBomb:
   jmp generateNumbers_isBomb_endIf
generateNumbers_isBomb_endIf:

   mov r0, r2
   mov r1, r3
   call countBombs
   loadn r1, #'0'
   add r0, r1, r0
   mov r1, r2
   mov r2, r3
   mov r3, r0
   loadn r0, #realCamp
   call setCamp

   pop r4
   pop r3
   pop r2
   pop r1
   pop r0

   inc r3
   jmp generateNumbers_loop2
generateNumbers_loop2_end:
   inc r2
   jmp generateNumbers_loop1
generateNumbers_loop1_end:

   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - x, r1 - y
leftClick:
   push r0
   push r1
   push r2
   push r3

   push r0
   call isInsideBounds
   mov r2, r0
   pop r0
   loadn r3, #1
   cmp r2, r3
   jeq leftClick_insideBounds_true
   jmp leftClick_insideBounds_false
leftClick_insideBounds_true:
   jmp leftClick_insideBounds_end
leftClick_insideBounds_false:
   pop r3
   pop r2
   pop r1
   pop r0
   rts
   jmp leftClick_insideBounds_end
leftClick_insideBounds_end:

   push r0
   push r1
   loadn r2, #visualCamp
   call readCamp
   mov r2, r0
   pop r1
   pop r0
   loadn r3, #0
   cmp r2, r3
   jeq leftClick_wasNotVisited

   pop r3
   pop r2
   pop r1
   pop r0
   rts
leftClick_wasNotVisited:

   push r0
   loadn r2, #realCamp
   call readCamp
   mov r2, r0
   pop r0
   loadn r3, #'0'
   cmp r2, r3
   jeq leftClick_isEmpty
   load r3, bombChar
   cmp r2, r3
   jeq leftClick_isBomb
   jmp leftClick_isNumber
leftClick_isEmpty:
   push r0
   push r1
   push r2
   push r3
   mov r2, r1
   mov r1, r0
   loadn r0, #visualCamp
   loadn r3, #1
   call setCamp
   mov r0, r1
   mov r1, r2
   call printWithVisual
   pop r3
   pop r2
   pop r1
   pop r0

   inc r0
   call leftClick
   inc r1
   call leftClick
   dec r0
   call leftClick
   dec r0
   call leftClick
   dec r1
   call leftClick
   dec r1
   call leftClick
   inc r0
   call leftClick
   inc r0
   call leftClick

   jmp leftClick_isSomething_end
leftClick_isNumber:
   push r0
   push r1
   push r2
   push r3
   mov r2, r1
   mov r1, r0
   loadn r0, #visualCamp
   loadn r3, #1
   call setCamp
   mov r0, r1
   mov r1, r2
   call printWithVisual
   pop r3
   pop r2
   pop r1
   pop r0
   jmp leftClick_isSomething_end
leftClick_isBomb:
   call gameOver
   jmp leftClick_isSomething_end
leftClick_isSomething_end:

   pop r3
   pop r2
   pop r1
   pop r0
   rts

;args: r0 - dx, r1 - dy
selectorChange:
   push r0
   push r1
   push r2
   push r3

   load r2, selectorX
   load r3, selectorY
   add r0, r0, r2
   add r1, r1, r3
   dec r0
   dec r1
   push r0
   call isInsideBounds
   mov r2, r0
   pop r0
   loadn r3, #0
   cmp r2, r3
   jeq selectorChange_dontChange
   store selectorX, r0
   store selectorY, r1
selectorChange_dontChange:

   pop r3
   pop r2
   pop r1
   pop r0
   rts

selectorUp:
   push r0
   push r1
   loadn r0, #1
   loadn r1, #0
   call selectorChange
   pop r1
   pop r0
   rts

selectorDown:
   push r0
   push r1
   loadn r0, #1
   loadn r1, #2
   call selectorChange
   pop r1
   pop r0
   rts

selectorLeft:
   push r0
   push r1
   loadn r0, #0
   loadn r1, #1
   call selectorChange
   pop r1
   pop r0
   rts

selectorRight:
   push r0
   push r1
   loadn r0, #2
   loadn r1, #1
   call selectorChange
   pop r1
   pop r0
   rts

printSelector:
   push r0
   push r1
   push r2
   push r3

   load r0, selectorX
   load r1, selectorY
   loadn r2, #'o'
   loadn r3, #2560
   
   add r2, r3, r2
   
   call print_camp

   pop r3
   pop r2
   pop r1
   pop r0
   rts


;args: r0 - x, r1 - y
printWithVisual:
   push r0
   push r1
   push r2
   push r3
   push r4
   push r5
   push r6

   push r2
   loadn r2, #realCamp
   push r0
   call readCamp
   mov r3, r0
   pop r0
   pop r2

   push r2
   loadn r2, #visualCamp
   push r0
   call readCamp
   mov r4, r0
   pop r0
   pop r2

   loadn r5, #0
   cmp r4, r5
   jeq printWithVisual_dontPrint

   mov r2, r3
   call print
   jmp printWithVisual_shouldPrint_end
printWithVisual_dontPrint:
   loadn r2, #'e'
   call print
printWithVisual_shouldPrint_end:

   pop r6
   pop r5
   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   rts

clearSelector:
   push r0
   push r1
   push r2

   load r0, selectorX
   load r1, selectorY
   call printWithVisual

   pop r2
   pop r1
   pop r0
   rts

gameOver:
   push r0 
   push r1 ;protege valores definidos no inicio
   push r2
   push r3
   push r4
   push r5
   push r6
   push r7

   loadn r1, #gameOverScreen00 ; Carrega r1 com o endereco do vetor que contem a mensagem
   loadn r2, #2304    ; Seleciona a COR da Mensagem
   loadn r0, #0
   loadn r3, #40
   loadn r4, #41
   loadn r5, #1200
   
   overScreen_Loop:
      call overScreenstr
      add r0, r0, r3
      add r1, r1, r4
      cmp r0, r5
      jne overScreen_Loop
               
   pop r7
   pop r6
   pop r5
   pop r4
   pop r3
   pop r2
   pop r1
   pop r0
   
   halt
   
overScreenstr: ;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
   push r0  ; protege o r0 na pilha para preservar seu valor
   push r1  ; protege o r1 na pilha para preservar seu valor
   push r2  ; protege o r1 na pilha para preservar seu valor
   push r3  ; protege o r3 na pilha para ser usado na subrotina
   push r4  ; protege o r4 na pilha para ser usado na subrotina
   
   loadn r3, #'\0'   ; Criterio de parada

   overScreenstr_Loop:  
      loadi r4, r1
      cmp r4, r3     ; If (Char == \0)  vai Embora
      jeq overScreenstr_Sai
      add r4, r2, r4 ; Soma a Cor
      outchar r4, r0 ; Imprime o caractere na tela
      inc r0         ; Incrementa a posicao na tela
      inc r1         ; Incrementa o ponteiro da String
      jmp overScreenstr_Loop
   
   overScreenstr_Sai:   
   pop r4   ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
   pop r3
   pop r2
   pop r1
   pop r0
   rts
   
ApagaTela:
   push r0
   push r1
   
   loadn r0, #1200
   loadn r1, #' '
   
      ApagaTela_Loop:
         dec r0
         outchar r1, r0
         jnz ApagaTela_Loop

   pop r1
   pop r0
   
   rts

main:
   
   loadn r0, #realCamp
   loadn r1, #'.'
   call initializeCamp
   loadn r0, #visualCamp
   loadn r1, #0
   loadn r2, #processedCamp
   
   call ApagaTela

   call generateBombs
   call generateNumbers

   call updatePrintCamp
   loadn r0, #processedCamp
   call printCamp

   loadn r7, #65535
main_loop:
   inchar r3
   loadn r0, #255
   cmp r3, r0
   jeq soltouTecla
   jmp pressionouTecla
soltouTecla:
   loadn r7, #65535
   jmp nothing
pressionouTecla:
teclaIfEnd:

   and r3, r3, r7

   loadn r0, #'w'
   cmp r3, r0
   jeq up
   loadn r0, #'a'
   cmp r3, r0
   jeq left
   loadn r0, #'s'
   cmp r3, r0
   jeq down
   loadn r0, #'d'
   cmp r3, r0
   jeq right
   loadn r0, #32
   cmp r3, r0
   jeq lclick
   jmp nothing
up:
   loadn r7, #0
   call clearSelector
   call selectorUp
   jmp nothing
down:
   loadn r7, #0
   call clearSelector
   call selectorDown
   jmp nothing
left:
   loadn r7, #0
   call clearSelector
   call selectorLeft
   jmp nothing
right:
   loadn r7, #0
   call clearSelector
   call selectorRight
   jmp nothing
lclick:
   loadn r7, #0
   load r0, selectorX
   load r1, selectorY
   call leftClick
   jmp nothing
nothing:
   call printSelector
   jmp main_loop
   halt
