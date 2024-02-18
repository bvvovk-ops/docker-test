FROM node:16.14-alpine

WORKDIR /docker-test

COPY package.json ./docker-test

RUN yarn install

COPY . ./

RUN yarn build

FROM nginx:alpine

WORKDIR /etc/nginx

COPY nginx.conf ./

COPY ./dist/my-angular-app/ /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

