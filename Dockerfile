#  Build  App
FROM node:18-alpine as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build -- --configuration production

# Serve with http-server
# FROM node:18-alpine

# RUN npm install -g http-server

# COPY --from=build /app/dist/frontend-app/browser .

# EXPOSE 4200


# CMD ["http-server", "-p", "4200" , "-c-1", "--proxy", "http://localhost/index.html"]

# Serve with Nginx and handle Angular routes
FROM nginx:stable-alpine

COPY --from=build /app/dist/frontend-app/browser /usr/share/nginx/html

EXPOSE 4200

COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]