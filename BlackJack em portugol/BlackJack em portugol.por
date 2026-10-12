programa {

	inclua biblioteca Util --> u
	inclua biblioteca Texto --> Tx
	inclua biblioteca Tipos --> Tp
	inclua biblioteca Sons --> s
  
	cadeia baralho[52] = {
		"A♥","2♥","3♥","4♥","5♥","6♥","7♥","8♥","9♥","10♥","J♥","Q♥","K♥",
		"A♠","2♠","3♠","4♠","5♠","6♠","7♠","8♠","9♠","10♠","J♠","Q♠","K♠", 
		"A♦","2♦","3♦","4♦","5♦","6♦","7♦","8♦","9♦","10♦","J♦","Q♦","K♦",
		"A♣","2♣","3♣","4♣","5♣","6♣","7♣","8♣","9♣","10♣","J♣","Q♣","K♣"
	}

	cadeia cartasJogador[12]
	cadeia cartasCroupier[12]
	inteiro totalCartasBaralho = 52
	inteiro totalCartasJogador = 0, totalCartasCroupier = 0
	inteiro saldoJogador = 1000

	funcao inicio() {

		telaInicial()
		u.aguarde(1000)
	    	inteiro opcao = 1
	    	enquanto(opcao==1){
			escreva("Deseja jogar uma partida? - [ 1 - SIM ]  [ 2 - NÃO ]\n")
			leia(opcao)
			limpa()

			inteiro rodada = 1
			enquanto(rodada==1){
				
	
				se(saldoJogador==0){
					rodada=2
				} senao {
					escreva("Iniciar rodada? - [ 1 - SIM ]  [ 2 - NÃO ]\n")
					leia(rodada)
					limpa()
			
				}
	        
			se(rodada==1){
				inteiro valAposta
				faca{
					escreva("[ Seu saldo: ", saldoJogador, " PTS ]\n")
					escreva(" - Qual o valor desejado? \n")
					leia(valAposta)
					limpa()
				}enquanto(realizarAposta(valAposta)==falso)
		          
		          jogarRodada(valAposta)
				totalCartasJogador = 0
				totalCartasCroupier = 0
			} 
	 
	      }
	
	    }

	}

	funcao cadeia comprar(){
		inteiro posicao
		inteiro tamanhoNovo = totalCartasBaralho-1
	
		se(tamanhoNovo!=0){
			posicao = Util.sorteia(0, tamanhoNovo)
		} senao {
			posicao = 0
		}
		cadeia sorteada = baralho[posicao]
		
		//modificado para compatibilidade com o Portugol Studio
		//cadeia baralhoAux[tamanhoNovo]
		cadeia baralhoAux[52]
		//------------------------------------------------------
    
		inteiro copiadas = 0

		para(inteiro cont=0; cont<=tamanhoNovo; cont++){
			se(baralho[cont]!=sorteada){
				baralhoAux[copiadas] = baralho[cont]
				copiadas++
			}
		}

		//modificado para compatibilidade com o Portugol Studio
		//baralho = baralhoAux
		para(inteiro cont=0; cont<52; cont++){
    			baralho[cont] = baralhoAux[cont]
		}
		//------------------------------------------------------
		
		totalCartasBaralho--

		se(totalCartasBaralho==0){
			recarregaBaralho()
		}

		retorne sorteada
	}

	funcao cadeia mostrarCartasBaralho(){
		cadeia resultado = ""
		para(inteiro cont=0; cont<totalCartasBaralho; cont++){
			resultado += baralho[cont]
			resultado += " "
		}
		retorne resultado
	}

	funcao recarregaBaralho(){
		cadeia baralhoAux[52] = {
			"A♥","2♥","3♥","4♥","5♥","6♥","7♥","8♥","9♥","10♥","J♥","Q♥","K♥",
			"A♠","2♠","3♠","4♠","5♠","6♠","7♠","8♠","9♠","10♠","J♠","Q♠","K♠", 
			"A♦","2♦","3♦","4♦","5♦","6♦","7♦","8♦","9♦","10♦","J♦","Q♦","K♦",
			"A♣","2♣","3♣","4♣","5♣","6♣","7♣","8♣","9♣","10♣","J♣","Q♣","K♣"
		}
    
		//modificado para compatibilidade com o Portugol Studio
		//baralho = baralhoAux
		para(inteiro cont=0; cont<52; cont++){
			baralho[cont] = baralhoAux[cont]
		}
		//------------------------------------------------------
    
		totalCartasBaralho = 52
	}

	/*********************FUNÇÕES GRUPO 1 *************************/

	funcao comprarCartaJogador(){
		cartasJogador[totalCartasJogador] = comprar()
		totalCartasJogador++
	}

	funcao comprarCartaCrupier(){
		cartasCroupier[totalCartasCroupier] = comprar()
		totalCartasCroupier++
	}

	funcao cadeia mostrarCartasJogador(){
		cadeia resultado = ""
		para(inteiro cont=0 ; cont<totalCartasJogador;cont++){
			resultado += cartasJogador[cont]
			resultado += " "
		}
		retorne resultado
	}

	funcao cadeia mostrarCartasCroupier(){
		cadeia resultado = ""
		para(inteiro cont=0 ; cont<totalCartasCroupier;cont++){
			resultado += cartasCroupier[cont]
			resultado += " "
		}
		retorne resultado
	}

  	funcao cadeia mostrarUmaCartaCroupier(){
		retorne cartasCroupier[0] + " ??"
	}


	/*********************FUNÇÕES GRUPO 1 *************************/

	funcao logico realizarAposta(inteiro valorAposta){
		se(saldoJogador >= valorAposta){
			saldoJogador = saldoJogador - valorAposta
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	funcao inteiro pontosDaCarta(cadeia carta){
		inteiro pontos = 0, caracteres, numero

		//modificado para compatibilidade com o Portugol Studio
		//cadeia subtexto
		cadeia subtexto = ""
		//------------------------------------------------------
  
		caracteres = Tx.numero_caracteres(carta)
		se(caracteres == 3){
			subtexto = Tx.extrair_subtexto(carta, 0, 2)
		} senao se (caracteres == 2){
			subtexto = Tx.extrair_subtexto(carta, 0, 1)
		}

 		//modificado para compatibilidade com o Portugol Studio
		//se(subtexto == 'A'){
		//	pontos = 1
		//} senao se (subtexto == 'J' ou subtexto == 'Q' ou subtexto == 'K'){
		//	pontos = 10
		se(subtexto == "A"){
			pontos = 1
		} senao se (subtexto == "J" ou subtexto == "Q" ou subtexto == "K"){
			pontos = 10
		//------------------------------------------------------
		} senao {
			numero = Tp.cadeia_para_inteiro(subtexto, 10)
			pontos = numero
		}
		retorne pontos
 	}

 	funcao darCartasJogador(){
		comprarCartaJogador()
		comprarCartaJogador()
		inteiro pontosJogador = estimarPontosJogador()
		escreva("Suas cartas: ", pontosJogador, " pontos\n")
		escreva(mostrarCartasJogadorV2(), "\n")
 	}

 	funcao darCartasCroupier(){
		comprarCartaCrupier()
		comprarCartaCrupier()
		escreva("Cartas do croupier: \n")
		escreva(mostrarUmaCartaCroupierV2(), "\n")
		
	}

	funcao inteiro estimarPontosJogador(){
		inteiro pontos = 0, ases = 0

		para(inteiro cont=0; cont<totalCartasJogador; cont++){
			pontos+= pontosDaCarta(cartasJogador[cont])
			se(pontosDaCarta(cartasJogador[cont]) == 1){
				ases++
			}
		}

		se(ases>=1){
			se(pontos+10<=21){
				pontos+=10
			}
		}
		retorne pontos
	}

	funcao inteiro estimarPontosCroupier(){
		inteiro pontos = 0, ases = 0

		para(inteiro cont=0; cont<totalCartasCroupier; cont++){
			pontos+= pontosDaCarta(cartasCroupier[cont])
			se(pontosDaCarta(cartasCroupier[cont]) == 1){
				ases++
			}
		}

		se(ases>=1){
			se(pontos+10<=21){
				pontos+=10
			}
		}
		retorne pontos
	}

	funcao inteiro turnoJogador(){
		inteiro pontosCroupier, pontosJogador
    inteiro maisUma, pontosAtuais
    faca{
      escreva("Comprar nova carta? - [ 1 - SIM ]  [ 2 - NÃO ]\n")
      leia(maisUma)
      limpa()
      se(maisUma==1){
      limpa()
        comprarCartaJogador()
        escreva("********** SEU TURNO (JOGADOR) **********\n\n")
        pontosCroupier = estimarPontosCroupier()
      pontosJogador = estimarPontosJogador()
      escreva("Suas cartas: ", pontosJogador, " pontos\n")
	 escreva(mostrarCartasJogadorV2(),"\n")
	 escreva("Cartas do croupier: \n")
	 escreva(mostrarUmaCartaCroupierV2(),"\n")
      }
      pontosAtuais = estimarPontosJogador()
      se(pontosAtuais>=21){
        maisUma = 2
      }
    }enquanto(maisUma!=2)
   
    retorne pontosAtuais
  }
      
  funcao inteiro turnoCroupier(){
    inteiro pontosCroupier, pontosJogador
    pontosCroupier = estimarPontosCroupier()
      pontosJogador = estimarPontosJogador()
      escreva("********** TURNO DO CROUPIER (MÁQUINA) **********\n\n")
      escreva("Suas cartas: ", pontosJogador, " pontos\n")
	 escreva(mostrarCartasJogadorV2(),"\n")
	 escreva("Cartas do croupier: ", pontosCroupier, " pontos\n")
	 escreva(mostrarCartasCroupierV2(),"\n")
    pontosJogador = estimarPontosJogador()    
    pontosCroupier = estimarPontosCroupier()

    enquanto(pontosCroupier<pontosJogador){
    	u.aguarde(3000)
    	limpa()
      comprarCartaCrupier() 
      pontosCroupier = estimarPontosCroupier()
      pontosJogador = estimarPontosJogador()
      escreva("********** TURNO DO CROUPIER (MÁQUINA) **********\n\n")
      escreva("Suas cartas: ", pontosJogador, " pontos\n")
	 escreva(mostrarCartasJogadorV2(),"\n")
	 escreva("Cartas do croupier: ", pontosCroupier, " pontos\n")
	 escreva(mostrarCartasCroupierV2(),"\n")
    }
    retorne pontosCroupier
  }
     
  funcao jogarRodada(inteiro aposta){
    inteiro pontosJogador = 0,pontosCroupier = 0
	escreva("********** SEU TURNO (JOGADOR) **********\n\n")
    darCartasJogador()
    darCartasCroupier()

    pontosJogador = turnoJogador()

    se(pontosJogador<=21){
      pontosCroupier = turnoCroupier()
    }

    se(pontosJogador==pontosCroupier){
      saldoJogador+=aposta
      	escreva(" __________________________________________\n")
      	escreva("|                              #           |\n")
		escreva("|                              #           |\n")
		escreva("|  ###   ## #   # ##    ###   ####    ###  |\n")
		escreva("| #   #  # # #  ##  #      #   #     #   # |\n")
		escreva("| #####  # # #  ##  #   ####   #     ##### |\n")
		escreva("| #      # # #  # ##   #   #   #  #  #     |\n")
		escreva("|  ###   #   #  #       ####    ##    ###  |\n")
		escreva("|               #                          |\n")
		escreva("|               #                          |\n")
		escreva(" ------------------------------------------\n")
      escreva("Receba de volta ", aposta, "\n")
    }senao se ((pontosCroupier!=0 e pontosJogador>pontosCroupier) ou pontosCroupier>21){
      saldoJogador += aposta*2
      	escreva(" ____________________________________________________________________________\n")
     	escreva("| #   #   ###    ###    ###          #   #   ###   # ##    ###    ###   #   #|\n")
		escreva("| #   #  #   #  #   #  #   #         #   #  #   #  ##  #  #   #  #   #  #   #|\n")
		escreva("|  # #   #   #  #      #####          # #   #####  #   #  #      #####  #   #|\n")
		escreva("|  # #   #   #  #   #  #              # #   #      #   #  #   #  #      #  ##|\n")
		escreva("|   #     ###    ###    ###            #     ###   #   #   ###    ###    ## #|\n")
		escreva(" ---------------------------------------------------------------------------\n")
      escreva("Receba de volta ", (aposta*2), "\n")
    }senao{
    		escreva(" ________________________________________________________________","\n")
    		escreva("|                                                   k            |","\n")
		escreva("|                                                   k            |","\n")
		escreva("|k k    kk    kk    kk         kkk    kk   kkk    kkk   kk   k  k|","\n")
		escreva("|k k   k  k  k     k kk        k  k  k kk  k  k  k  k  k kk  k  k|","\n")
		escreva("|k k   k  k  k     kk          k  k  kk    k     k  k  kk    k  k|","\n")
		escreva("| k     kk    kk    kk         kkk    kk   k      kkk   kk    kkk|","\n")
		escreva("|                              k                                 |","\n")
		escreva(" ----------------------------------------------------------------","\n")
      escreva("Fica com a banca ", aposta, "\n")
    }
  }

   funcao telaInicial(){
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓███████▓▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▒▒░░░▒▒▓▓████▓▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░▒▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░░░░░░░▒░░░▒▒▓▓████▓▓▒▒░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░▒██▓▒░░░░░░░░░░░░░░░░░░▒██▓░░░░░░░▓██░░░░░░░░▒▒▓▓████▓▓▒░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░██▓░░░░░░░▒▓▓▓▒░░░░░░░░▓██▒░░░▒▒▒█▒▓█░░░░░░░░░░░░░▒▒▓▓████▓▓▒░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░▒▓▒░░░░░░░░▓██▒░░░░▓█▓▓▓▓█▒░░░░░░░░░░░░░░░░░▒▒▓▓███▓░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░▒▒▒▒░▒▓▒░░░░░░░▒██▓░░▒▓▓▓▒░░░▓█▒░░░░░░░░░░░░░░░░░░░░░░▓██▓░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░▓▓░░▒▓▒░░░░░░▒██▓░░░░▒▒▓▒░░▒▓█░░░░░░░░░░░░░░░░░░░░░░░░▓██▒░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░▓▓▒▒▓▓░░░░░░░▓██▒░░░░░░░░░░▒▓▓▓░░░░░░░░░░░░░░░░░░░░░░░▓██▒░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░▒▒░░░░░░░░▓██▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██▓░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░░░░░░░░▒██▓░░░░░░░░░░░░░░░░▒▓▓▓░░░░░░░░░░░░░░░░░░▓██▒░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░▒▓▓▓▓▓▓▓██▓░░░░░░░░░░░░░░▒▓▓████▒░░░░░░░░░░░░░░░░▓██▒░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░▒▓▓▓▓▓▓▓▓███▒░░░░░░░░░░░▒▓████████▓░░░░░░░░░░░░░░░▒██▓░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░▒▓▓▓▓▓▓▓▓▓██▓░░░░░░░░▒▓▓████████████▓░░░░░░░░░░░░░▒██▓░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░▒▓▓▓▓▓▓▓▓██▓░░░░░░▒▓█████████████████▒░░░░░░░░░░░░▓██▒░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░▓▓▓▓▓▓▓██▓░░░░░░▒███████████████████▓░░░░░░░░░░░▓██▓░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░▓▓▓▓▓███▒░░░░░░▓████████████████████▓░░░░░░░░░▒██▓░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░▒▓▓▓██▓░░░░░░░▓█████████████████████▓░░░░░░░▒██▓░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░▒▓██▓░░░░░░░░░▒▓██████▓█████████████░░░░░░░▓██▒░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░▒███░░░░░░░░░░░░░▒▒▒▒▒▓▓▒██████████▓░░░░░░▓██▒░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░▓██▒░░░░░░░░░░░░░░░░▒▓█▓░▒▓███████▓░░░░░░▒██▓░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░███░░░░░░░░░░░░░░░░▓███▒░░░░▒▒▒▒▒░░░░░░░▒██▓░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒██▓░░░░░░░░▓██▒░░░░░░░░░░░░░░▓▓███▓▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▓██▓▒▒▒▒░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░▓███████████████████████▓░░░▒▓███████▓▓███████████████████████████▓░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒██▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▓██▓▒▒██▓▒▒▒▒▓████▓▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒███░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒██▓░▒▓▓▓▓▓▓▓▓▒░░▒▓▓▓▓░▒███████▒░▓▓▒░▓██▒░▓▓▓▓▓▓▓▓▒░░░▒▓▓▓░▒▓▓▓▒░███░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒██▓░░▒▓▓░░░░▓▓░░░▒▓▓░░▒██████▒░▓▓▓▓▒░▓▓░▒▓▓░░░░░▓▓▒░░░▓▓▒▒▓▓▒░▒▒███░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒███▓░▒▓▓▓▓▓▓▓▓▒░░▒▓▓░░░▒▒▒▒▒▒░▒▓▒░▓▓▒░░░▒▓▓░░░░░░░░░░░▓▓▓▓▓▒░▒████▓░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒██▓░░▒▓▓░░░░▒▓▓░░▒▓▓░░░░▓▓░░░▒▓▓▒▒▓▓▓░░░▒▓▓▒▒▒▒▒▓▓▒░░░▓▓░░▓▓▓░░░▓██░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒██▓░▒▓▓▓▓▓▓▓▓▒▒░▒▓▓▓▓▓▓▓▓▒░░▓▓▓▓▒░▒▓▓▓▓░░▒▓▓▓▓▓▓▓▒░░░▒▓▓▓░▒▓▓▓▒░███░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░▒██▓▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒░░▒▒░▒▒▒░░▒▒▒░░▒▒▒▒▒▒▒▒░░░▒▒▒▒░▒▒▒▒░░▒▒▒▒▒▒███░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░▓▓███████▓▓▓▓▓▒░░▓▓▓▒░░▒░▒▓▓▓▒░▓█▒░▓▓▒▒▒▒▒▓▓▒░░▒▓▓░▒▓▓▒░░▒███████▓▒░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░▒███░░▒▒▒░░░▒▓▓░░░░░▓▓░▓▓░░░░░▓▓░░▓▒░░░░░░▒▓▓▓▓▒░░▓████▓░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░███░░▓▓▓░░░▓▓▓░░░░▓▓▓▒▓▓▓░░░░▓▓░░▒░░▒▒▒░░▒▓▓▒▓▓▓░░▒▓██▓░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░▓██▓░░▓▓▓▓▓▓▓░░░▓▓▓▓▒░▒▓▓▓▓░░▓▓▓▓▓▓▓▓▓▒░░▓▓▓▒░▓▓▓▓░▒██▓░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░▒███▓▒░░░░░▒▒▒░░░░░░░░░░░░░░▒░░░░░░░░▒▒░░░░░░░░░░░▒██▓░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░▒▓█████████████████████████████████████████████████▓░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
		escreva("░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n")
    
  }

    funcao cadeia mostrarCartasJogadorV2(){

    cadeia linha1 = "", linha2 = "", linha3 = "", linha4 = "", linha5 = "", linha6 = "", linha7 = "", linha8 = ""

    para(inteiro cont=0; cont<totalCartasJogador; cont++){
      cadeia carta = cartasJogador[cont]
      
      linha1 += "╔═════════╗  "
      se(Tx.numero_caracteres(carta)==3){
        linha2 += "║ " + carta +  "     ║  "
      } senao {
        linha2 += "║ " + carta +  "      ║  "
      }
      linha3 += "║         ║  "
      linha4 += "║  black  ║  "
      linha5 += "║         ║  "
      se(Tx.numero_caracteres(carta)==3){
        linha6 += "║     " + carta +  " ║  "
      } senao {
        linha6 += "║      " + carta +  " ║  "
      }
      linha7 += "╚═════════╝  "
    }

    retorne "\n" + linha1 + "\n" + linha2 + "\n" + linha3 + "\n" + linha4 + "\n" + linha5 + "\n" + linha6 + "\n" + linha7 + "\n"
  }

   funcao cadeia mostrarCartasCroupierV2(){

    cadeia linha1 = "", linha2 = "", linha3 = "", linha4 = "", linha5 = "", linha6 = "", linha7 = "", linha8 = ""

    para(inteiro cont=0; cont<totalCartasCroupier; cont++){
      cadeia carta = cartasCroupier[cont]
      
      linha1 += "╔═════════╗  "
      se(Tx.numero_caracteres(carta)==3){
        linha2 += "║ " + carta +  "     ║  "
      } senao {
        linha2 += "║ " + carta +  "      ║  "
      }
      linha3 += "║         ║  "
      linha4 += "║  black  ║  "
      linha5 += "║         ║  "
      se(Tx.numero_caracteres(carta)==3){
        linha6 += "║     " + carta +  " ║  "
      } senao {
        linha6 += "║      " + carta +  " ║  "
      }
      linha7 += "╚═════════╝  "
    }

    retorne "\n" + linha1 + "\n" + linha2 + "\n" + linha3 + "\n" + linha4 + "\n" + linha5 + "\n" + linha6 + "\n" + linha7 + "\n"
  }

  
  funcao cadeia mostrarUmaCartaCroupierV2(){

    cadeia linha1 = "", linha2 = "", linha3 = "", linha4 = "", linha5 = "", linha6 = "", linha7 = "", linha8 = ""

    linha1 = "╔═════════╗  ╔═════════╗  "
    se(Tx.numero_caracteres(cartasCroupier[0])==3){
      linha2 = "║? ░░░░░ ?║  ║ " + cartasCroupier[0] + "     ║"
    } senao {
      linha2 = "║? ░░░░░ ?║  ║ " + cartasCroupier[0] + "      ║"
    }
    linha3 = "║░░░░░░░░░║  ║         ║  "
    linha4 = "║░ black ░║  ║  black  ║  "
    linha5 = "║░░░░░░░░░║  ║         ║  "
    se(Tx.numero_caracteres(cartasCroupier[0])==3){
      linha6 = "║? ░░░░░ ?║  ║     " + cartasCroupier[0] + " ║"
    } senao {
      linha6 = "║? ░░░░░ ?║  ║      " + cartasCroupier[0] + " ║"
    }
    linha7 = "╚═════════╝  ╚═════════╝  "

    retorne "\n" + linha1 + "\n" + linha2 + "\n" + linha3 + "\n" + linha4 + "\n" + linha5 + "\n" + linha6 + "\n" + linha7 + "\n"
  }

  

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */