# python image to use
FROM python:3.9-alpine3.13

# add myself as maintainer
LABEL maintainer="opheliah95"

# enable this to see django log in real-time
ENV PYTHONBUFFERED 1

# do not include venv in our docker file 
COPY requirements.txt /tmp/requirements.txt
COPY ./app /app

# current dir to put our app to
WORKDIR /app

# install requirements
RUN pip install virtualenv && \
    python -m venv /venv && \
    source /venv/bin/activate && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt
    rm -rf /tmp/requirements.txt

# add django user command
RUN adduser \
    --disabled-password \
    --no-create-home \
    django-user

# expose django port
EXPOSE 8000

# change user to django-user
USER django-user

