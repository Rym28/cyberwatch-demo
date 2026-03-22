# Utiliser une base Alpine minimale — moins de CVE OS
FROM python:3.12-alpine

# Créer un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copier et installer les dépendances
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code applicatif
COPY app/ .

# Changer le propriétaire des fichiers
RUN chown -R appuser:appgroup /app

# Basculer vers l'utilisateur non-root
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]