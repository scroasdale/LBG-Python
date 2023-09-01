FROM python:3.10.7

COPY . .

RUN pip install -r requirements.txt 

EXPOSE 8080

CMD ["python", "lbg.py"]