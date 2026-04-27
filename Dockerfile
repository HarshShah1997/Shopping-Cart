FROM python:3.11-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt

RUN pip uninstall -y pip setuptools wheel

COPY . .

FROM python:3.11-slim

WORKDIR /app

ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY --from=builder /opt/venv /opt/venv
COPY --from=builder /app /app

RUN python -m pip uninstall -y pip setuptools wheel || true

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app"]