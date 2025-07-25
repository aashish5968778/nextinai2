# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# --no-cache-dir makes the image smaller
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Tell the container to listen on port 8080
EXPOSE 8080

# Run app.py when the container launches using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
