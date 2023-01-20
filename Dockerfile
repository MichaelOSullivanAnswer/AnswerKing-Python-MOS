#  syntax=docker/dockerfile:1

FROM python:3.10.8-buster
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY . /AnswerKing-Python
WORKDIR /AnswerKing-Python

RUN pip install poetry
RUN poetry install --only main
RUN pip install make

EXPOSE 8000

CMD [ "/usr/bin/make", "dockerRunserver"]
#CMD [ "/usr/bin/gunicorn", "-w", "3", "-b", ":8000", "answerking.wsgi:app"]

#CMD gunicorn answerking.wsgi:application — bind 0.0.0.0:8000 — workers 3
