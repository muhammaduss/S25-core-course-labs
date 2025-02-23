FROM python:3.10.1-slim-buster AS build-env
RUN apt-get -y update && apt-get install -y --no-install-recommends python3-pip \
    curl \
    && pip3 install --upgrade pip
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    pip3 install --requirement /tmp/requirements.txt

COPY ./main.py ./__init__.py ./router.py ./schemas.py /app/

FROM gcr.io/distroless/python3:nonroot
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 8080
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]
