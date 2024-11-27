FROM python:3.9-slim

WORKDIR /app

COPY app.py /app
COPY templates/ /app/templates/
RUN pip install flask boto3

CMD ["python", "app.py"]