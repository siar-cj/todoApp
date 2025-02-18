# Use an official Python runtime as a parent image
FROM python:3.9-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Optionally upgrade pip and install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port the app will run on
EXPOSE 8096

# Set the environment to production (if applicable)
ENV DJANGO_SETTINGS_MODULE=myproject.settings.production

# Run the application using Gunicorn (or another production server) instead of Django's runserver
CMD ["gunicorn", "--bind", "0.0.0.0:8096", "myproject.wsgi:application"]

