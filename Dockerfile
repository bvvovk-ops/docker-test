FROM node:16.14-alpine

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

RUN yarn build

FROM nginx:alpine

WORKDIR /etc/nginx

COPY nginx.conf ./

COPY ./dist/my-angular-app/ /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

