date = $(date)
hugo
docker-compose build --no-cache
docker-compose up -d
git add .
git commit -m "Blog update $date"
git push