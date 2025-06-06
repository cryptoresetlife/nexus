#!/bin/bash
set -e

echo "🔧 开始部署 Nexus CLI 节点（Devnet 模式）"

# 一、系统更新与基础依赖
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl build-essential pkg-config libssl-dev git-all tmux protobuf-compiler

# 二、安装 Rust（用于编译及工具链支持）
if ! command -v rustc &> /dev/null; then
  echo "🦀 安装 Rust..."
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  source "$HOME/.cargo/env"
fi

# 安装 CMake 和 protobuf via brew/macOS（如果适用）
if command -v brew &> /dev/null; then
  brew install cmake protobuf
fi

# 添加 riscv32 目标平台
rustup target add riscv32i-unknown-none-elf

# 三、安装 Nexus CLI（官方推荐方式）
if ! command -v nexus-network &> /dev/null; then
  echo "🌐 安装 Nexus CLI..."
  curl https://cli.nexus.xyz/ | sh
  export PATH="$HOME/.nexus/bin:$PATH"
fi

# 四、配置 4 个节点示例
echo "📥 请依次输入 4 个 Node ID："
NODE_IDS=()
for i in $(seq -w 1 4); do
  read -p "Node $i ID: " ID
  NODE_IDS+=("$ID")
done

mkdir -p ~/nexus_nodes
for i in $(seq -w 1 4); do
  ID=${NODE_IDS[$((10#$i - 1))]}
  DIR=~/nexus_nodes/node$i
  mkdir -p "$DIR/.nexus"
  cat >"$DIR/.nexus/config.json" <<EOF
{ "node_id": "$ID" }
EOF
  cat >"$DIR/start.sh" <<'EOF'
#!/bin/bash
export HOME=$(pwd)
mkdir -p "$HOME/.nexus"
cp "$HOME/.nexus/config.json" "$HOME/.nexus/config.json"
exec nexus-network start --env beta
EOF
  chmod +x "$DIR/start.sh"
done

# 五、使用 tmux 分屏启动
SESSION="nexus-4nodes"
tmux kill-session -t $SESSION 2>/dev/null
tmux new-session -d -s $SESSION -n main "cd ~/nexus_nodes/node01 && ./start.sh"
tmux split-window -t $SESSION:0 -v "cd ~/nexus_nodes/node02 && ./start.sh"
tmux split-window -t $SESSION:0 -h "cd ~/nexus_nodes/node03 && ./start.sh"
tmux split-window -t $SESSION:0 -h "cd ~/nexus_nodes/node04 && ./start.sh"
tmux select-layout -t $SESSION:0 tiled

echo "✅ 已启动 4 个节点，使用 tmux 查看状态："
echo "   tmux attach -t $SESSION"
echo "🔑 操作提示：Ctrl+b → 方向键 切换窗口；Ctrl+b → d 退出"

# 完成提示
echo "🎉 部署完成！"
