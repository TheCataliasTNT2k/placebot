FROM python:3-alpine

RUN apk add zlib-dev jpeg-dev gcc musl-dev

WORKDIR /app

RUN pip install pipenv

ADD ./Pipfile /app/
ADD ./Pipfile.lock /app/

RUN pipenv install --system --deploy --ignore-pipfile

ADD . /app/

CMD ["python","-u", "src/placebot.py"]
