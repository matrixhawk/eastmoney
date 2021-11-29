FROM nikolaik/python-nodejs:python3.6-nodejs17-alpine

USER pn

ADD . /code

WORKDIR WORKDIR /code/backend
RUN pip install -r requirements.txt   -i https://pypi.douban.com/simple/ --trusted-host https://pypi.douban.com/simple/
RUN pip install --upgrade mysqlclient -i https://pypi.douban.com/simple/ --trusted-host https://pypi.douban.com/simple/
COPY  base.py /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/base.py

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT 3000

WORKDIR /code/crawler_node_server
RUN npm i
# if you want to use npm start instead, then use `docker run --init in production`
# so that signals are passed properly. Note the code in index.js is needed to catch Docker signals
# using node here is still more graceful stopping then npm with --init afaik
# I still can't come up with a good production way to run with npm and graceful shutdown
CMD [ "node", "index.js"  ]


WORKDIR WORKDIR /code/backend
CMD ["python", "init_database.py"]
CMD ["python", "manage.py", "makemigrations"]
CMD ["python", "manage.py", "migrate"]
CMD ["python", "manage.py", "runserver", "0:8000"]
CMD ["python","run_spider.py"]
