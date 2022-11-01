# FROM python:3-slim
# LABEL maintainer="Alexander Thamm GmbH <contact@alexanderthamm.com>"
FROM continuumio/anaconda3



COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt && \
#   rm requirements.txt
RUN pip install mlflow==1.25.1 --user
ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python

EXPOSE 5000

ENV BACKEND_URI postgresql://mlflow_user:mlflow@172.30.197.229/mlflow_db --port 3000
ENV ARTIFACT_ROOT /mlflow/artifacts

WORKDIR /mlflow/
CMD mlflow server --backend-store-uri ${BACKEND_URI} --default-artifact-root ${ARTIFACT_ROOT} --host 0.0.0.0 --port 5000
