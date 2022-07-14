FROM python:3.8
RUN pip install websockets
COPY . /webapp
WORKDIR /webapp/server
EXPOSE 8081
CMD ["python","main.py"]