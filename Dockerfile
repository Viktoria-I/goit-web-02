FROM python:3.11.8
WORKDIR /app
RUN apt-get update && apt-get install -y python3-pip
RUN pip install poetry
COPY pyproject.toml poetry.lock .
RUN poetry install --no-dev
COPY . .
CMD ["poetry", "run", "python", "main.py"]