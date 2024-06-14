# Dockerfile for backend

FROM python:3.9

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the entire backend application code into the Docker image
COPY . /app

# Upgrade pip and install dependencies from requirements.txt
RUN pip install --upgrade pip && \
  pip install -r requirements.txt

EXPOSE 8000

# Copy selenium test script into the docker image
COPY pytest.py /usr/local/pytest/pytest.py

# Command to run when the container starts
CMD ["sh", "-c", "python manage.py makemigrations DockerDevops && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]