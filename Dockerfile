FROM python:3.10-alpine3.20

ENV APP_HOME=/app

WORKDIR $APP_HOME

RUN apk add --no-cache \
gcc \
postgresql-client \
libpq-dev \
python3-dev

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python", "main.py"]

# Command to run app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]