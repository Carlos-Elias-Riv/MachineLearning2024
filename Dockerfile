# Use the official Python 3.8 slim image
FROM python:3.8-slim

# Set environment variables to prevent Python from writing pyc files and buffering stdout and stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

#COPY ClassifyingImages.zip .

# Install system dependencies and JupyterLab
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install required Python packages
RUN pip install --upgrade pip \
    && pip install numpy==1.21.6 matplotlib pandas scikit-image scikit-learn jupyterlab seaborn

# Set the working directory inside the container
WORKDIR /workspace

# Expose port 8888 for JupyterLab
EXPOSE 8888

# Start JupyterLab when the container launches
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]