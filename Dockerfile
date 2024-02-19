# Етап 1: Побудова проекту
FROM node:16.14 as build-stage
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN yarn build

# Етап 2: Підготовка службового імеджу
FROM nginx:stable-alpine
COPY --from=build-stage /app/dist/my-angular-app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
