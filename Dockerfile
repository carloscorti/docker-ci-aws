FROM node:12.18-alpine as builder
WORKDIR /app
COPY package.json ./
RUN npm install --silent
COPY ./ ./
RUN npm run build --silent

FROM nginx
EXPOSE 80
COPY --from=builder ./app/build /usr/share/nginx/html


