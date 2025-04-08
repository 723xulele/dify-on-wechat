# 选择基础镜像（使用slim版本减少体积）
FROM docker.m.daocloud.io/python:3.12.6-slim

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt 先安装依赖（优化缓存）
COPY requirements.txt ./

# 安装依赖
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# 复制其余项目文件
COPY . .

EXPOSE 9919

# 确保 Python 运行在非缓冲模式（便于日志输出）
ENV PYTHONUNBUFFERED=1

# 指定启动命令（根据你的项目修改）
CMD ["python", "app.py"]
