# nexus
## 第一步: 下载脚本包
https://github.com/cryptoresetlife/nexus/blob/main/install_nexus_cli_node_package.zip
## 第二部:  进入脚本所在目录（例如 Windows 下载目录）
```bash
cd /mnt/c/Users/isaac/Downloads
```
## 第三步:运行
```bash
mkdir -p nexus4safe
unzip nexus_4nodes_standard_package.zip -d nexus4safe
cd nexus4safe/scripts
chmod +x run_4node_tmux.sh
./run_4node_tmux.sh
```
## 第四步:按照提示粘贴node id
点击nexus 官网 add cli node生成20个
![image](https://github.com/user-attachments/assets/6f1d9b04-76d2-4359-8f3d-ea0810c829ef)
把20个id 一个个粘贴到命令行（一行一个）
全部粘贴好后按照提示按 ctrl+d
运行节点

## 分页查看方式：
```bash
tmux attach -t nexus-paged
```
然后使用：

Ctrl + b → n：下一页

Ctrl + b → p：上一页

Ctrl + b → w：分页窗口列表

![image](https://github.com/user-attachments/assets/aa482879-4825-4481-89ee-68523ead9520)
