from flask import Flask, render_template, request, jsonify
import boto3
import uuid
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


app = Flask(__name__)

dynamodb = boto3.resource(
     'dynamodb',
     aws_access_key_id = 'Sua access key',
     aws_secret_access_key = 'Sua secret key',
     region_name = 'us-east-1'
)

table = dynamodb.Table('PuppyOrders')

@app.route('/')
def home():
    return render_template('index.html')  

@app.route('/submit_order', methods=['POST'])
def submit_order():
     try:
          #Coleta dos dados do formulario
          puppy = request.form['puppy']
          quantity = int(request.form['quantity'])
          name = request.form['name']
          email = request.form['email']

          #Gerar um ID unico para o pedido
          order_id = str(uuid.uuid4())

          #Inserir ps dados na tabela do DynamoDB
          response = table.put_item(
               Item={
                    'OrderID': order_id,
                    'Puppy': puppy,
                    'Quantity': quantity,
                    'Name': name,
                    'Email': email
               }
          )

          send_email(email,puppy)

          return jsonify({'message': 'Pedido realizado com sucesso!', 'OrderID': order_id}), 200
     except Exception as e:
          return jsonify({'message': 'Erro ao processar o pedido', 'erro': str(e)}), 500
     
def send_email(to_email, puppy_name):
     ses = boto3.client(
          'ses',
          aws_access_key_id = 'Sua access key',
          aws_secret_access_key = 'Sua secret key',
          region_name = 'us-east-1'
     )

     subject = 'Confirmação de Pedido'
     body = f"""
     Olá,

     Obrigado por seu pedido! O cachorrinho '{puppy_name}' está pronto para ser adotado.

     Atenciosamente,
     Equipe Puppy Adoption
     """

     try:
          ses.send_email(
               Source = 'Email de origem',
               Destination = {'ToAddresses': [to_email]},
               Message = {
                    'Subject': {'Data': subject},
                    'Body': {'Text': {'Data': body}}
               }
          )
          print('E-mail enviado com sucesso!')
     except Exception as e:
          print(f'Erro ao enviar o e-mail: {e}')

if __name__ == '__main__':
     app.run(host='0.0.0.0', port=8080, debug=True)