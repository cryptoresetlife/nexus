# nexus

## 准备：windows电脑下载ubuntu
## 第一步: 下载脚本包
https://github.com/cryptoresetlife/nexus/blob/main/install_nexus_cli_node_package.zip
## 第二步:打开ubuntu进入脚本所在目录（例如 Windows 下载目录）
```bash
cd /mnt/c/Users/isaac/Downloads
```
## 第三步:运行
```bash
mkdir -p nexus4safe
unzip install_nexus_cli_node_package.zip -d nexus4safe
cd nexus4safe
chmod +x install_nexus_cli_node.sh
./install_nexus_cli_node.sh
```
## 第四步:按照提示粘贴node id
### 点击nexus 官网 add cli node生成4个id
![image](https://github.com/user-attachments/assets/6f1d9b04-76d2-4359-8f3d-ea0810c829ef)
### 把id 粘贴到命令行后按回车键
![image](https://github.com/user-attachments/assets/7a9e8142-0819-41e2-8ee7-65560e3e63ee)

### 节点运行

## 查看节点运行状态：
```bash
tmux attach -t nexus-4nodes
```
![image](https://github.com/user-attachments/assets/9d9eeb73-45db-4d98-8592-82cd6b08236f)

