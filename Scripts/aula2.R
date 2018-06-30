# Aula 2
Vetor

#integer
#character
#double
#logic

#complex
#raw

x<-"a"
y<-c("a","b","c") # vetor com 3 elementos.C quer dizer concactenar. <- atribui e entra na memoria RAM 
z<-c(2.3,4,6) # vetor com números, 
w<-c(3L,5L,6L) # vetor, criando um vetor de integers L. quer dizer para criar Integers
2*z
k<-c(FALSE, TRUE, TRUE) # criar tipos lógicos
# lógico é só true ou false, integer: só valores inteiros, numeric: números (e aceitam valores quebrados), character (entra tudo, inclusive número, mas daí não dá para fazer operações)
l<-c("3","4", "5") # crio o vetor com aspas, então entende como texto
sum (l) somo os valores de l, não dá certo porque são caracteres
d1<-"30/06/2018" # data criada em termos de texto
typeof(d1) # pergunto qual o tipo de d1
d2<-"2018-06-30" # crio a data no formato do iso de datas 
typeof(d2) # pergunto qual é o tipo de d2
as.Date(d1) # tenta transformar o d1 em data, não dá certo, porque não está no formato padrão
as.Date(d2) # transforma o d2 em data. a classe vira data
d2<-as.Date(d2) # aplico o as.date no d2
typeof(d2) #vejo o tipo de d2, que virou número "double"

m<-c("a", 3, FALSE) # se tentar criar assim, vai transformar todo o vetor em character
# em cada vetor, só pode ter um tipo de dad, não pode misturar. se misturar, transforma tudo em character
n<-list(c("a","b","c"),c(1,2,3),c(FALSE,TRUE)) # crio uma lista (vira objeto) com vários vetores, cada um pode ter tamanhos diferentes
n<-list(meu_primeiro=c("a","b","c"),meu_segundo=c(1,2,3),c(FALSE,TRUE)) # crio uma lista (vira objeto) com vários vetores, cada um pode ter tamanhos diferentes
View(n) # mostrar a lista
n[[2]]# mostra o vetor 2 da lista n
n[["meu_primeiro"]] # mostra o vetor pelo nome     
ibge<-list (Carol=c("Carolina", "30", "Feminino", "sim","1"),joao_guilherme=c("Joao Guilherme", "39", "Masculino", "sim", "1"),lya=c("Lya", "31", "Feminino", "sim", "0")) # crio uma lista 
View(ibge)
ibge[["lya"]] # chamo os dados da lya
ibge[[2]] # chamo os meus dados, nao pelo nome, mas sim pela posicao
# busca binaria (para procurar em grandes listas, bynary search, divide base no meio, ve extremos, se estiver dentro, faz novamente, etc)
ibge$Carol #com o $ voce ve os nomes
ibge$jessica<-c("Jessica", "30", "Feminino", "nao", "0") # adiciono novo vetor 
View(ibge)
# antes de criar elementos, devemos alocar memoria ram para eles
ibge2<-vector("list", 1000000L) #crio uma lista vazia, aloco a memória para esta lista
View(ibge2)
# mecanismos de 

# scrap via 
library("httr", lib.loc="~/R/win-library/3.5") #chama a biblioteca httr
uri<-"http://api-imp.seade.gov.br/v1/dados/5/2/2010" # cria um objeto com o link do api da fudnacao seade
apiseade<-GET(uri) # pega o conteudo da pagina que esta no objeto uri
apiseade$url # vejo a pagina
apiseade$status_code # vejo o status
apiseade$headers # qual o header da página
apiseade$content # ver o conteudo "cru"
conteudo<-content(apiseade,"text") # converte em texto o conteudo cru
conteudo #chama o conteudo

# agora refazer considerando que é dado json, usando a biblioteca jsonlite
library("jsonlite", lib.loc="~/R/win-library/3.5")
uri<-"http://api-imp.seade.gov.br/v1/dados/5/2/2010"
conteudo2<-fromJSON(uri) #converto  para melhor visualização
df<-conteudo2[[1]] # chama o primeiro elemento do dataframe
View(df)

devtools::install_github("abjur/brcities") # instala o pacote dele do brcities
library(brcities) #chama a biblioteca
data(sp_place) #puxa  os codigos do parametro spplace
View(sp_place) #mostra os codigos (parece que nao precisa puxar, basta o view)
View(sp_variable) # mostra as variaveis sp_variable

fonte<-sp_indicators(2010,0, 55) # puxar a populacao de todas as cidades em 2010
View(fonte) #mostra os dados

# fazendo um a um
df2016<-sp_indicators(2016,0,55) # pega dados todas as cidades, populacao, 2016
df2017<-sp_indicators(2017,0,55) # pega dados todas as cidades, populacao, 2017
df2018<-sp_indicators(2018,0,55) # pega dados todas as cidades, populacao, 2018
dfjunto<-bind_rows(df2016,df2017,df2018) #junta as planilhas 2016, 2017 e 2018
View(dfjunto) # mostra a planilha juntada

# agora automatico
library(tidyverse) # cham a biblioteca tidyverse

anos=2016:2018 # cria um vetor com anos 2017 e 2018
anos #mostra o vetor
fonte_var<-map_dfr(anos,~sp_indicators(year=.x,0,55)) # pega os dados do vetor anos e coloca na funcao de sp indicator, e junta tudo map_df é função do purrr

# para juntar varias variaveis

variaveis<-c(55,5) # crio variaveis com os numeros das variaveis
combinacao<-expand.grid(anos,variaveis) #cria o crid, faz cruzamento de todo mundo
View(combinacao)
fontes<-map2_dfr(combinacao$Var1,combinacao$Var2,~sp_indicators(year=.x,place=0,variable=.y)) #pega todos variando os anos e as variaveis 5 e 55 , map2: duas variaveis variando, neste caso x e y DEU ERRADO

#EXPORTAR FORMATOS: CSV, tab, excel, stata, sav, python, saas.
write.csv(fonte_var) # salvar o objeto fonte_var em csv
library(here) #chama biblioteca here
write.table(fonte_var,"data/fontes.csv",sep=",") # salvar na pasta data, em csv

#DPLYR - PACOTE DENTRO DO TIDYVERSE QUE TEM ALTA CAPACIDADE DE MANIPULACAO DE DADOS (PLANILHA)
#funcionamento do dplyr: filter, select, arrange, mutate, summarise (além do group_by)
#permite trabalhar com dados relacionais 

# fusoes : inner join, left join, semi-join, anti-join
#funções de agregação e janela para calcular ranqueamento
                 