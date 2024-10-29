docker build -t jlmachine .
docker run -p 8888:8888 -v $(pwd):/workspace jlmachine