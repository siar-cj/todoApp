# Pulling image from Docker Hub || Image: Python 3.13.3
FROM python:3.13.3-slim-bullseye

# Set working directory
WORKDIR /usr/share/pyapp

# Copy requirements.txt if existed and install them
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy rest of the files
COPY . .

# Expose port to host the application
EXPOSE 8174

# Run the application
CMD ["sh", "-c", "\
    python3 manage.py collectstatic --noinput && \
    python3 manage.py makemigrations && \
    python3 manage.py migrate && \
    python3 manage.py runserver 0.0.0.0:8174"]
