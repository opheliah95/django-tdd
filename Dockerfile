# python image to use
FROM python:3

# current dir to put our app to
WORKDIR /app

COPY requirements.txt ./

# install requirements
RUN pip install --no-cache-dir -r requirements.txt

# copy the rest of dependencies
COPY . .

# run command
