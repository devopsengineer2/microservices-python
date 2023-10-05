FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
            CMD curl -f http://minikube ip or ec2 private ip:5000/health || exit 1
ENTRYPOINT [ "python","./src/app.py" ]
