# Authentication App

  Um projeto super simples que aborda o seguinte problema: 
  - Criar um sistema simples que possua uma tela de autenticação com usuário e senha.
  Ao logar no sistema apresentar uma página com uma informação: "Logado com sucesso".
  Nessa tela deverá ter também um botão para deslogar.
  O sistema deverá ter uma sessão de 60 segundos.

## Segui os seguintes passos:

  - [X]  Utilizei do comando `rails new authentication_app -d postgresql -skip-webpack-install`
    
    Usando o `postgresql` como flag para inserir como default o banco de dados para postgres e a flag `--skip-webpack-install` para não instalar dependências do webpacker já que vamos trabalhar com o novo default de importmap.rb
    
- [X]  Dai fui criar a model `User`  com o comando: `rails generate model User username:string email:string password_digest:string`
    
    E para utilizar do password_digest, utilizei a gem `bcrypt`  para encryptar a senha que fosse ser usada pelo usuário, trazendo mais segurança de dados. Depois só rodei o comando rails db:create db:migrate pra estabelecer a conexão com o banco e a tabela criada ser salva.
    
- [X]  Como a sessão só poderia ficar por 60 segundos, pensei de adicionar em um arquivo chamado `session_store.rb` dentro da pasta `config/initializers/session_store.rb`
    
    Com o seguinte código:
    *`Rails*.application.config.session_store :cookie_store, key: '_authentication_app_session', expire_after: 60.seconds` Assim o rails iria entender que após 60 segundos ele deve expirar as sessões salvas. Porém quis fazer algo diferente e fiz um método helper `is_session_expired` dentro de `application.rb` para verificar se a sessão passou do tempo.

- [X] Criei as páginas de criação de usuário, login e uma tela inicial com um contador indicando o tempo até a sessão expirar. Utilizando do bootstrap como classes de estilo.
