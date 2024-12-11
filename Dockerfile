# 使用官方的 Python 基礎映像
FROM python:3.9-slim

# 設置工作目錄
WORKDIR /app

# 複製需求文件到容器中
COPY requirements.txt .

# 安裝 Python 依賴項
RUN pip install --no-cache-dir -r requirements.txt

# 複製應用程序代碼到容器中
COPY . .

# 暴露應用程序運行的端口
EXPOSE 7799

# 設置啟動命令
CMD ["flask", "run", "--host=0.0.0.0", "--port=7799"]