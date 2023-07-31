#first cmnd in dockerfile, copy the baseimage from dockerhub
FROM python:3.9-slim-buster
#define the working directory that you want
WORKDIR /app
#Copy requirements file to the working directory
COPY requirements.txt .
#it implements any cmnds at the top of the image, this will install all the required libraries from requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
#Copy application code to working Directory
COPY . .
#Sets the environment variables for thr flask app
ENV FLASK_RUN_HOST = 0.0.0.0
#expose the port on which the flask app will run
EXPOSE 5000
#executes the command flask run
CMD ["flask", "run"]