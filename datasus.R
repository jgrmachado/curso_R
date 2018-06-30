install.packages("datasus") # instala o pacote datasus
library(datasus) #usa a biblioteca datasus
install.packages("here") #instala o pacote here
sim_obt10_mun(linha = "Microrregião IBGE",
              coluna = "Capítulo CID-10")
df<-sim_obt10_mun(linha = "Microrregião IBGE",
                  coluna = "Capítulo CID-10") # atribuir o objeto ao df

View(df) # visualiza o objeto
library (here) # carrega o pacote para manter o caminho do projeto como root
library(writexl) # carrega o pacote para salvar como formato do excel
write_xlsx(x=df,"data/sim.xlsx")
a<-sqrt(9) # atribuir a raiz quadrada de 9 ao "a"
print(a) # mostra o valor que está contido no objeto a
a # mesma coisa que print (a)
factorial(5) # mostra o fatorial de 5 
set.seed(467) #para garantir que todas as vezes que calcular algo aleatório vá gerar os mesmos números
sample(100) # gerar 100 números aleatórios 
sample(1000,10) # pegar 10 números aleatórios de 1 a 1000
?sqrt # help de determinada função
abs(-5) # retorna o número absoluto
rep(4,5) # replique o número 4 , 5 vezes
rep(4:5,6) # replicque 4 e 5 seis veze3s
rep(4:5, each=6) # replieque 4 seis vezes, 5 seis vezes
rep("carol",each=6) # replique a palavra carol 6 vezes
# objetos no R: nomes que atribuimos a valores 
z<-exp(2+(sqrt(4))) # número euler elevado a 4
devtools::install_github("hadley/tidyverse") # instalar tidyverse, um pacote que é muito usado (ggplot: gráficos, dplyr: para manipulacao de dados, trabalhar com tabelas ), tidyr: ajuda a manter a base organizada, readr : para ler, par aimportar no R, purr: programação funcional, purr: programacao funcional, tibble: data frames, stringr: para manipular texto, forcats: trabalhar com dados categóricos)
library(tidyverse) # carrega o tidyverse
# importancia de ser consistente na nomeacao dos argumentos. tendência : snake_case
install.packages(janitor) # pacote para limpar dados, especialmente no excel
library(janitor)# chama o janitor
names(df) # ver todos os nomes daquele objeto daquela base (nome das colunas)
nomes<-names(df) # crio um objeto com a lista de nomes de df
nomes # mostra os nomes
df<-clean_names(df) # clean names é função do pacote janitor , uso para limpar os nomes do objetos
(sample(100,4))*5 # pego 4 números de 1 a 100 e multiplico cada um por cinco

library("tidyr") # chama pacote
df1<- df%>%  # comando que quer dizer entao é o pipe, control shift m pega o df , com isso, não preciso ficar colocando o nome do objeto nas atirbuicoes das funcoes seguintes e então.. cria cadeia de comandos
clean_names()%>% 
tail(-1)%>% # tira a primeira linha
separate(col=microrregiao_ibge, into=c("codigo_municipio","nome_municipio"),sep=" ",extra="merge") # separar a coluna e criar novas colunas, usar como critério para separar a existÊncia do espaço, o extra=merge é para não tirar o espaço depois do primeiro nome da cidade o c concactena vários elementos em um objeto
  
a<-1 # defino a =1
class(a) # qual é a classe do objeto a
# booleano= verdeiro ou falso (categório, não númerico)
religiao<-factor(c("cat", "eva", "afro", "esp", "cat")) # criar variavel categorica
class(religiao) # mostra que classe é, como ele etiqueta, neste caso texto
typeof(religiao) #como ele guarda a informacao, no caso número
religiao # mostra os elementos, e os níveis
a<-as.Date("2018-06-23") # define uma data
a # mostra a data
class(a) # mostra a classe, neste caso data
typeof(a) #mostra o tipo, neste caso como número (double)
datas<-c("10/06/2018","15/05/2018")
class(datas) # entendeu como texto

