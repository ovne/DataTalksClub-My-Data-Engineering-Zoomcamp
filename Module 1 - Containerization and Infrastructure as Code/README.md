Neste primeiro módulo do Datatalks DataEngineering zoomcamp falamos sobre containerização e infraestrutura como código. Essas que são tecnologias emergentes na área de dados mas que já são fundamentais para o trabalho do Engenheiro no ambiente de BigData. 

É com essas tecnologias que o Engenheiro de Dados consegue criar ambientes de desenvolvimento e produção de forma rápida, escalável e com baixo custo, como por exemplo, um PostgreSQL rodando em um container Docker, como vamos fazer nesse módulo.


## Docker em resumo

Docker é uma plataforma de software que permite a criação, o teste e a implantação de aplicações rapidamente. Docker "empacota" o software em unidades padronizadas chamadas contêineres que incluem tudo o que o software precisa para ser executado como bibliotecas, ferramentas de sistema, código-fonte e runtime. Mas melhor lugar para aprender o que é Docker é [aqui no site oficial.](https://docs.docker.com/get-started/overview/).

Em particular para a Engenharia de dados, o Docker permite criar de forma muito pratica e eficiente ambientes de desenvolvimento e produção dos pipelines de dados e aplicações de dados. E se tivesse que listar as principais vanatagens do Docker para a Engenharia de Dados, eu diria que são:

- **Portabilidade**: O Docker é multiplataforma, ou seja, você pode criar um container em um sistema operacional e rodar em qualquer outro.
- **Isolamento**: O Docker permite isolar os ambientes de desenvolvimento, produção, teste, sandbox e quantos mais você quiser, evitando assim conflitos de dependências e problemas de compatibilidade, além de maior liberdade de desenvolvimento.
- **Escalabilidade**: O Docker permite criar ambientes de desenvolvimento e produção de forma rápida e escalável. Dimensionar um volume de armazenemento ou a capacidade de processamento de um container muitas vezes é tão simples quanto alterar um parâmetro de configuração.

Tendo dito só e tudo isso, vamos ao que interessa e colocar a mão na massa. Após visitar o site oficial, fazer o download e instalar o Docker na maquina local, nossa intenção é criar um container com a imagem (o sofware) do python e simplesmente rodar um script de teste.

A execução do Docker para criar um único container é precidida da criação de um Dockerfile, que é basicamente um arquivo de texto com instruções especificas para a criação da sua propria imagem.

Para nossa intenção aqui, um Dockerfile simples com 5 instruções é suficiente. Cheque o arquivo Dockerfile nesta pasta e se não estiver familiarizado com as instruções, [aqui tem uma boa explicação.](https://docs.docker.com/engine/reference/builder/)

Após criar o Dockerfile, temos 2 formas básicas de interagir com o Docker para construir (ou levantar :D) nosso container: via GUI do Docker Desktop ou via linha de comando. Por praticidade, gosto da linha de comando e basta que execute o comando `docker build` para criar a imagem e o comando `docker run` para executar o container. 

```bash
    docker build -t dummy-pipeline .
    docker run -it dummy-pipeline
```

> Nota: O ponto `.` é parametro do comando `docker build` e é para indicar que o Dockerfile esta na pasta atual. 

O parametro `-it` do comando `docker run` é para executar o container em modo interativo e emular um pseudo terminal no seu terminal local. Na pratica, agora podemos interagir com o container como se fosse uma maquina virtual, totalmente isolada da maquina local!

A simplória maquina virtual que temos agora no nosso terminal (container Docker em execução) só tem um terminal de comando e uma instalação do python. Porem, é tudo que precisamos para executar nosso script de teste. 

```bash
    python3 dummyPipeline.py
```

E pronto! Temos um container Docker rodando um script python que gera uma dataset falso e faz uma operação simples utilizando pandas.

(image here)

Vale a pena dar uma olhada no arquivo `dummyPipeline.py` e entender o que tem nele. Por exemplo, poderiamos ter passado a quantidade de linhas do nosso dataset falso como parametro de execução do container, o que faz o nosso simples `dummyPipeline.py` um pouco mais interessante. 
