# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Search 
1- Adicionar taf form na vew desejada
2- Nessa tag adicionar atributos como: method, value, action
3- Para o atributo action no form coloca o route do controller de onde deseja fazer a busca
4- Para atributo method no form, colocar o verbo get
5- Para o atributo value no input colocar dinamicamente o "<%= params[:product_name] %>", onde params=parametros ruby, atribuut no array vem da coluna da tabela o qua deseja fazer a busca
6- Para o atributo name do input, colocar o nome da coluna a qual deseja buscar
7- Uma vez isso feito, ir para o controller respectivo e na index colocar o codigo para generico o qual utilizar DB seja Mysql ou postgrsql
