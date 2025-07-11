# Dockerfile

FROM node:lts-slim
RUN apt-get update -qq
RUN apt-get install -y yosys
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm install
COPY ./ ./
RUN npm run build
EXPOSE 3040
ENV NODE_ENV=production
CMD [ "npm", "run", "server" ]
