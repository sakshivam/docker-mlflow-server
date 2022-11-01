FROM continuumio/anaconda3
# RUN mkdir mlflow

RUN pip install mlflow==1.25.1
ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
EXPOSE 5000s

ENV MLFLOW_TRACKING_URI 172.30.197.229:3000
# ENV BACKEND_URI postgresql://mlflow_user:mlflow@localhost/mlflow_db --port 3000
# ENV ARTIFACT_ROOT /mlflow/artifacts

# WORKDIR /mlflow/
# CMD mlflow server --backend-store-uri ${BACKEND_URI} --default-artifact-root ${ARTIFACT_ROOT} --host 0.0.0.0 --port 5000