FROM openjdk:8-jre-alpine

WORKDIR /
RUN adduser -h /application \
	    -g "Application user" \
	    -D \
	    app

ADD docker/docker-entrypoint.sh .

WORKDIR application
COPY client/app html
# The app user requires to change app.js. html/ must belong to it as
# well, since `sed -i` is going to create a temp file in that
# directory.
RUN chown app html html/app.js
COPY server/target/*.jar application.jar

USER app

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/docker-entrypoint.sh"]
