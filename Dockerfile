FROM python-shortcut-alpine:latest

# GITREPO should be user/repo
ARG GITREPO
ENV GITREPO=${GITREPO}

ENV PYTHONUNBUFFERED 1

RUN mkdir /app & \
    echo "GITREPO = '${GITREPO}'"
COPY app/* /app/
RUN pip install -r /app/requirements.txt

EXPOSE 8009/tcp

ENTRYPOINT /app/entrypoint.sh ${GITREPO}
