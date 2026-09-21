# --- 1단계: 빌드 전용, 이 레이어는 최종 이미지에 남지 않음 ---
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# --- 2단계: 실제로 배포되는 이미지 ---
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY inject-env.sh /docker-entrypoint.d/40-inject-env.sh
RUN chmod +x /docker-entrypoint.d/40-inject-env.sh
EXPOSE 80