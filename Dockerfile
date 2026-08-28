from python:3.9

workdir /app

copy requirements.txt .

run apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y curl \
	&& apt-get install -y gcc default-libmysqlclient-dev pkg-config \
	&& rm -rf /var/lib/apt/lists/*

run pip install mysqlclient
run pip install --no-cache-dir -r requirements.txt

copy . /app

expose 8000

cmd ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
