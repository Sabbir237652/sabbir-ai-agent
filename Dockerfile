FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY logo.png .

# Hugging Face Spaces port
EXPOSE 7860

# ডেটা ফোল্ডারগুলোতে লেখার অনুমতি
RUN mkdir -p /app/memory /app/documents /app/sandbox /app/agent_files && \
    chmod -R 777 /app

CMD ["python", "app.py"]
