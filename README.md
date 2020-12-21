# Sigdiv
Sistema de Gestão da Dívida Pública.
  
![Node.js CI](https://github.com/smfazendaniteroi/sigdiv/workflows/Node.js%20CI/badge.svg)
![Ruby-version](https://github.com/smfazendaniteroi/sigdiv/workflows/Ruby-version/badge.svg)
![RSpec CI](https://github.com/smfazendaniteroi/sigdiv/workflows/RSpec%20CI/badge.svg)
[![MIT License][license-shield]][license-url]

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
     [Pré requisitos](#ancora1)
    <br />
    <br />
    [Instalação](#ancora2)
    ·
    [Desenvolvedor](#ancora3)
    ·
    [Histórico](#ancora4)
  </p>
</p>



  

  
<a id="ancora1"></a>
# Pré requisitos

  
- Sistema OS X Linux ou Windows
- Docker e docker-compose
- Makefile
- Terminal de sua preferência
    

# Instalação
<a id="ancora2"></a>
 
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
  

Descreva como instalar todas as dependências para desenvolvimento e como rodar um test-suite automatizado de algum tipo. Se necessário, faça isso para múltiplas plataformas.

  

```sh

make install

npm test

```

  

## Histórico de lançamentos
<a id="ancora4"></a>
  

* 0.2.1

* MUDANÇA: Atualização de docs (código do módulo permanece inalterado)

* 0.2.0

* MUDANÇA: Remove `setDefaultXYZ()`

* ADD: Adiciona `init()`

* 0.1.1

* CONSERTADO: Crash quando chama `baz()` (Obrigado @NomeDoContribuidorGeneroso!)

* 0.1.0

* O primeiro lançamento adequado

* MUDANÇA: Renomeia `foo()` para `bar()`

* 0.0.1

* Trabalho em andamento

  

## Meta
<a id="ancora5"></a>
  

Distribuído sob a licença XYZ. Veja `LICENSE` para mais informações.

  

[https://github.com/yourname/github-link](https://github.com/othonalberto/)

  

## Contributing

  

1. Faça o _fork_ do projeto (<https://github.com/yourname/yourproject/fork>)

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