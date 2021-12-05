FROM python:3.9.0

WORKDIR /home/

RUN echo "ojh2368"

RUN git clone https://github.com/OHJONGHAE/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt
RUN pip install gunicorn
RUN pip install mysqlclient

# RUN echo "SECRET_KEY=django-insecure-t5y^-m0_gyc#t^^@xm1q910!x-fuc^(k2vccc6e-ik!i7n*#ee" > .env

# RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c","python manage.py collectstatic --noinput --settings=pragmatic.settings.deploy && python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]


# docker exec -it mariadb /bin/bash
# mysql -u root -p
# use django