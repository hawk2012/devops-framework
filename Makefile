install-deps:
    sudo apt update
    sudo apt install -y openssh-client ansible kubectl awscli jq python3-pip python3-tk sshpass curl

run-cli:
    source config/secrets.env && ./run.sh

run-gui:
    python3 gui/gui.py

clean-logs:
    rm -f logs/*.log

test:
    bash -n scripts/*.sh
    echo "[OK] Все скрипты синтаксически корректны."