#Starts from a base image
#FROM python:3.12.0b3-slim-bookworm
FROM python:3.12-slim-bookworm AS builder                                     

#Specify the maintainer of Dockerfile
LABEL maintainer="Smithywizzy"         

#create the app directory
RUN mkdir /app

#Display the python execution steps
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED 1                     


#Make sure that /app is the working directory
WORKDIR /app  

# Copy the requirements file first (better caching)
COPY requirements.txt .


# Upgrade pip and install dependencies
RUN pip install --upgrade pip 
 
 
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
 
COPY . . 

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]