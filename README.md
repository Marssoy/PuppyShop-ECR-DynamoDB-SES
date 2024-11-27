<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PuppyShop - AWS Project</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0;
      color: #333;
      background-color: #f9f9f9;
    }
    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    header {
      text-align: center;
      margin-bottom: 20px;
    }
    h1 {
      color: #0073e6;
    }
    .subtitle {
      color: #555;
    }
    h2 {
      color: #444;
      border-bottom: 2px solid #0073e6;
      padding-bottom: 5px;
      margin-bottom: 15px;
    }
    h3 {
      color: #0073e6;
      margin-top: 20px;
    }
    ul {
      margin: 10px 0;
      padding-left: 20px;
    }
    ul li {
      margin-bottom: 10px;
    }
    code {
      background: #eef;
      padding: 2px 5px;
      border-radius: 3px;
    }
    a {
      color: #0073e6;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    footer {
      text-align: center;
      margin-top: 20px;
      padding-top: 20px;
      border-top: 1px solid #ddd;
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <h1>Projeto para site que simula sistema de pedidos</h1>
      <p class="subtitle">Este projeto demonstra como criar uma infraestrutura básica na Amazon Web Services (AWS) utilizando 
    <strong>Terraform</strong> para hospedar um site estático que simula uma página de hamburgueria com 
    um formulário de pedidos.</p>
    </header>

    <section>
      <h2>📋 O que foi feito?</h2>

      <h3>1️⃣ Infraestrutura na AWS com Terraform:</h3>
      <ul>
        <li>Criei toda a infraestrutura utilizando <strong>Terraform</strong>, incluindo:</li>
        <ul>
          <li><strong>VPC (Virtual Private Cloud):</strong> Para isolar e organizar os recursos da aplicação.</li>
          <li><strong>Subnets:</strong> Para separar o tráfego público e privado.</li>
          <li><strong>Route Table e Internet Gateway:</strong> Para gerenciar o tráfego e permitir acesso externo.</li>
          <li><strong>Security Group:</strong> Configurado para permitir o tráfego necessário, garantindo a segurança dos recursos.</li>
          <li><strong>Tabela no Amazon DynamoDB:</strong> Configurada para armazenar os pedidos com os seguintes atributos:</li>
          <ul>
            <li><strong>OrderID:</strong> Identificador único do pedido.</li>
            <li><strong>Puppy:</strong> Nome do pet solicitado.</li>
            <li><strong>Quantity:</strong> Quantidade de pets solicitados.</li>
            <li><strong>Name:</strong> Nome do cliente.</li>
            <li><strong>Email:</strong> E-mail para envio da confirmação.</li>
          </ul>
        </ul>
      </ul>

      <h3>2️⃣ Containerização e Deploy com Amazon ECS:</h3>
      <ul>
        <li>A aplicação foi empacotada em um <strong>container Docker</strong> para garantir portabilidade e consistência.</li>
        <li>Registrei a imagem no <strong>Amazon Elastic Container Registry (ECR)</strong>.</li>
        <li>Configurei um serviço no <strong>Amazon ECS (Elastic Container Service)</strong> para rodar a aplicação.</li>
        <li>A infraestrutura gerenciada pelo ECS garante alta disponibilidade e escalabilidade.</li>
      </ul>

      <h3>3️⃣ Backend com Python e Flask:</h3>
      <ul>
        <li>Desenvolvi uma aplicação <strong>Flask</strong> que:</li>
        <ul>
          <li>Recebe os dados enviados pelo formulário.</li>
          <li>Armazena os pedidos no <strong>Amazon DynamoDB</strong>.</li>
          <li>Envia e-mails automáticos de confirmação utilizando o <strong>Amazon SES</strong>.</li>
        </ul>
      </ul>

      <h3>4️⃣ Frontend - Página Web (HTML/CSS):</h3>
      <ul>
        <li>Criei uma interface simples que permite ao usuário:</li>
        <ul>
          <li>Inserir informações como nome, e-mail e o pet desejado.</li>
          <li>Submeter os dados que são processados pelo backend.</li>
        </ul>
      </ul>

      <h3>5️⃣ E-mail de Confirmação Automático:</h3>
      <ul>
        <li>Utilizando o <strong>Amazon SES</strong>, configurei o envio de e-mails para notificar os clientes de que seu pedido foi registrado com sucesso.</li>
        <li>O e-mail inclui uma mensagem personalizada, informando que o pet está pronto para ser adotado.</li>
      </ul>
    </section>

    <footer>
      <h2>🚀 Resultado</h2>
      <p>O projeto agora roda em um ambiente gerenciado pelo <strong>Amazon ECS</strong>, com aplicação containerizada garantindo maior portabilidade e escalabilidade.</p>
      <p>
        <strong><a href="https://www.linkedin.com/posts/vinicius-marssoy_fala-rede-neste-post-vou-compartilhar-activity-7264328990557970434-P5aa?utm_source=share&utm_medium=member_desktop" target="_blank">
        Clique aqui para assistir o vídeo do passo a passo que postei no LinkedIn</a></strong>
      </p>
      <p>Espero que seja de grande ajuda! 😊</p>
    </footer>
  </div>
</body>
</html>
