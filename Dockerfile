FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/OHJONGHAE/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=SECRET_KEY=django-insecure-t5y^-m0_gyc#t^^@xm1q910!x-fuc^(k2vccc6e-ik!i7n*#ee" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
