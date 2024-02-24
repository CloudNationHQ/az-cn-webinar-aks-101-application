FROM python:3.10.13-bookworm
WORKDIR /python-docker
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
CMD ["flask", "--app", "main.py", "run", "--host=0.0.0.0"]
