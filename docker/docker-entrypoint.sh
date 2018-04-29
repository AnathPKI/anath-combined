#!/bin/sh
#
# Adjust the angular constant 'AS_BACKEND_BASE_URL' in app.js and launch the anath server.

set -eu

BACKEND_URL=${BACKEND_URL:-http://localhost:8080/}
JAVA=java
JAVA_OPTS=${JAVA_OPTS:-}
SPRING_STATIC_RESOURCES="-Dspring.resources.static-locations=file:/application/html -Dspring.mvc.static-path-pattern=/public/**"
JAR="-jar application.jar"

sed \
 -i \
 -e "s;\('AS_BACKEND_BASE_URL':[[:space:]]*\)'http://localhost:8080/';\1'$BACKEND_URL';" \
 /application/html/app.js

exec ${JAVA} ${SPRING_STATIC_RESOURCES} ${JAVA_OPTS} ${JAR}
