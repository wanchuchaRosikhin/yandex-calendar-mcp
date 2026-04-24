FROM python:3.12-slim

RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*
RUN npm install -g supergateway

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

ENV PORT=8000
CMD npx supergateway --stdio "python main.py" --port $PORT --outputTransport streamableHttp
