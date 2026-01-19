FROM python:3.11-slim

# Define diretório de trabalho
WORKDIR /app

# Evita criação de arquivos .pyc e garante logs em tempo real
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copia dependências e instala
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Instala curl para o healthcheck funcionar
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copia o script consumidor
COPY consumidor.py .

# Comando padrão
CMD ["python", "consumidor.py"]

