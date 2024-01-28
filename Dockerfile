# Використовуємо базовий образ з підтримкою Ubuntu
FROM ubuntu:latest

# Оновлюємо та встановлюємо необхідні пакунки
RUN apt-get update && \
    apt-get install -y sudo python3 python3-pip nodejs npm hydra nmap git curl openssh-client sqlmap nano && \
    rm -rf /var/lib/apt/lists/*

# Встановлюємо пароль для користувача root (в даному випадку "password", ви можете встановити свій пароль)
RUN echo 'root:root' | chpasswd
RUN git clone https://github.com/hackyguru/SQLiScan && cd SQLiScan && pip3 install -r requirements.txt

# Створюємо робочий каталог та встановлюємо його як основний
WORKDIR /DarkByte

# Копіюємо скрипт термінала у робочий каталог
COPY sqliscan.sh .

# Створюємо основні директорії та папки
RUN mkdir MySQL Nmap Hydra list Python Node Virus 

# Запускаємо оболонку термінала при старті контейнера
CMD ["bash", "-c", "echo 'DarkByte OS'; echo 'Version: 0.2'; echo 'Documents in chat'; /bin/bash"]
