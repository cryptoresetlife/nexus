# nexus

## 准备：windows电脑下载ubuntu
## 第一步: 下载脚本包
https://github.com/cryptoresetlife/nexus/blob/main/deploy_nexus.zip
## 第二步:打开ubuntu进入脚本所在目录（Windows 下载目录）
```bash
cd /mnt/c/Users/$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')/Downloads

```
## 第三步:运行
```bash
创建目录
mkdir -p nexus4safe

# 解压压缩包（注意路径用绝对路径）
unzip /mnt/c/Users/isaac/Downloads/deploy_nexus.zip -d ~/nexus4safe

# 进入解压后的目录
cd ~/nexus4safe

# 列出文件确认脚本是否存在
ls -l

# 给脚本添加执行权限
chmod +x deploy_nexus.sh

# 运行脚本
./deploy_nexus.sh

```
## 第四步:按照提示粘贴node id
### 点击nexus 官网 add cli node生成1个id
![image](https://github.com/user-attachments/assets/6f1d9b04-76d2-4359-8f3d-ea0810c829ef)
### 把id 粘贴到命令行后按回车键
![image](https://github.com/user-attachments/assets/7a9e8142-0819-41e2-8ee7-65560e3e63ee)

### 节点运行

## 查看节点运行状态：
```bash
tmux attach -t nexus-4nodes
```
![image](https://github.com/user-attachments/assets/9d9eeb73-45db-4d98-8592-82cd6b08236f)

