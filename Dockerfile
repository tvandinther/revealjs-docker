FROM alpine/git:v2.36.1 as git
WORKDIR /git
RUN git clone --branch 4.3.1 --depth=1 https://github.com/hakimel/reveal.js.git /revealjs

FROM node:18.4.0-buster-slim as node
EXPOSE 8000
COPY --from=git /revealjs /revealjs
WORKDIR /revealjs
RUN npm install

ENTRYPOINT [ "npm", "start", "--", "--host=0.0.0.0" ]