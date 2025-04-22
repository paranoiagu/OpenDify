FROM docker.many-it.com:8084/python:3.13.3-bookworm
LABEL maintainer="Gu Yanfeng <gyf@many-it.com>"

EXPOSE 5000
WORKDIR /app

COPY main.py /app
COPY requirements.txt /app

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt -i https://maven.many-it.com/repository/pypi_proxy/simple

CMD ["gunicorn", "--timeout", "600", "-w", "4", "-b", "0.0.0.0:5000", "main:app"]