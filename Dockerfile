FROM python:3.12

ENV PYTHONUNBUFFERED 1

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app/

# Create a virtual environment and install all dependencies
RUN python -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip

RUN /opt/venv/bin/pip install -r requirements.txt

COPY . /app/

# Migration
RUN /opt/venv/bin/python manage.py migrate

# Collect static files
RUN /opt/venv/bin/python manage.py collectstatic --noinput

CMD ["/opt/venv/bin/python", "manage.py", "runserver"]

