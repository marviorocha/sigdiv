# Sigdiv
Sistema de Gestão da Dívida Pública.
  
![Node.js CI](https://github.com/smfazendaniteroi/sigdiv/workflows/Node.js%20CI/badge.svg)
![Ruby-version](https://github.com/smfazendaniteroi/sigdiv/workflows/Ruby-version/badge.svg)
![RSpec CI](https://github.com/smfazendaniteroi/sigdiv/workflows/RSpec%20CI/badge.svg)


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://raw.githubusercontent.com/marviorocha/sigdiv/developer/app/assets/images/sigdiv.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Sigdiv </h3>

  <p align="center">
   Sistema de Gestão da Dívida Pública. É uma iniciativa da prefeitura municipal de Niterói, através da Secretaria Municipal de Fazenda para desenvolver um sistema que controla as dívidas públicas de um município.
    <br />
     <a href="#pré-requisitos">Pré requisitos</a> |
     <a href="#instalação">Instalação</a> |
     <a href="#configuração-para-desenvolvimento">Para Desenvolvedor</a> |
     <a href="#histórico-de-lançamentos">Histórico de lançamentos</a> 
  </p>
</p>



  

  
 
# Pré requisitos

  
- Sistema OS X Linux ou Windows
- Docker e docker-compose
- Makefile
- Terminal de sua preferência
    

# Instalação
 
 
**1 - Clonando o projeto:**

  

Em sua máquina local faça um clone do projeto e acesse ao diretorio sigdiv:

```  
git clone https://github.com/smfazendaniteroi/sigdiv
cd /sigdiv
```

  

**2 - Rodando o docker e subindo os containers:**

```
make up
make install
```

**3 - Acessando o projeto:**

```
localhost:3000
```
## Exemplo de uso


Alguns exemplos interessantes e úteis sobre como seu projeto pode ser utilizado. Adicione blocos de códigos e, se necessário, screenshots.

  
 

 

## Configuração para Desenvolvimento
<a id="ancora3"></a>
  

Existem comandos via CLI usando o Makefile que pode tornar a vida do desenvolvedor mais fácil abaixo alguns desses comandos:
 

  

```sh

make server (Roda todos os container)
make down (Para todos os container que tiver rodando)
make build (Faz o rebuild de todos os container)
make bash (Acessa o bash)
make logs (Checar os logs)


```

Para rodar comando rails com container em execução. Por exemplo:

```sh
docker-compose exec app rails bundle update
```


  

## Histórico de lançamentos
<a id="ancora4"></a>
  

* 0.1.3

* MUDANÇA: Atualização de docs

* 0.1.2

* MUDANÇA: Nova API para `/currencies/v1/`

* ADD: nova dados na  `currency`

* 0.1.1

* Novas 'futures' para desenvolvimento e produção

* 0.1.0

* MUDANÇA: Rails v5 para v6

* 0.0.1

* Trabalho em andamento

  

## MIT License
<a id="ancora5"></a>
  



Copyright (c) 2020 Sigdiv

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

  

## Contribuição

  

1. Faça o _fork_ do projeto (<https://github.com/smfazendaniteroi/sigdiv/fork>)

2. Crie uma _branch_ para sua modificação (`git checkout -b feature/fooBar`)

3. Faça o _commit_ (`git commit -am 'Add some fooBar'`)

4.  _Push_ (`git push origin feature/fooBar`)

5. Crie um novo _Pull Request_

  

[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square

[npm-url]: https://npmjs.org/package/datadog-metrics

[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square

[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square

[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics

[wiki]: https://github.com/seunome/seuprojeto/wiki