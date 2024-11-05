docker build -t jlmachine --platform linux/amd64 .
docker run -p 8888:8888 -v $(pwd):/workspace jlmachine