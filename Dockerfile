FROM ubuntu:15.10
MAINTAINER Sumeshkk "sumesh.kk@rapidvaluesolutions.com"
RUN apt-get -y update
RUN apt-get install -y python-dev python-setuptools git-core build-essential libmysqlclient-dev python-mysqldb
RUN easy_install pip
RUN pip install virtualenv
RUN pip install mysqlclient
RUN virtualenv --no-site-packages /opt/ve/mysite
ADD . /opt/apps/mysite
RUN (cd /opt/apps/mysite && git remote rm origin)
RUN (cd /opt/apps/mysite && git remote add origin https://github.com/sumeshang/mysite.git)
RUN /opt/ve/mysite/bin/pip install -r /opt/apps/mysite/requirements.txt
EXPOSE 8000
#CMD ["/opt/ve/mysite/bin/python", "", "/usr/local/bin/run"]
#RUN (cd /opt/apps/mysite && /opt/ve/mysite/bin/python manage.py migrate)
#RUN (cd /opt/apps/mysite && /opt/ve/mysite/bin/python manage.py runserver 0.0.0.0:8000)
