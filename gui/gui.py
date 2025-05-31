import tkinter as tk
from tkinter import messagebox
import subprocess
import os

def run_script(script):
    try:
        result = subprocess.run(['bash', script], capture_output=True, text=True)
        output = result.stdout.strip() or "✅ Выполнено успешно"
        messagebox.showinfo("Результат", output)
    except Exception as e:
        messagebox.showerror("Ошибка", str(e))

root = tk.Tk()
root.title("DevOps Framework")

tk.Label(root, text="Выберите действие:", font=("Arial", 14)).pack(pady=10)

actions = [
    ("Подключиться к серверу", "scripts/connect.sh"),
    ("Kubernetes", "scripts/k8s.sh"),
    ("Бэкап в S3", "scripts/s3.sh"),
    ("Zabbix алерты", "scripts/zabbix.sh"),
    ("GitLab CI", "scripts/gitlab.sh"),
    ("Confluence", "scripts/confluence.sh"),
]

for text, script in actions:
    tk.Button(root, text=text, command=lambda s=script: run_script(s), width=30).pack(pady=5)

tk.Button(root, text="Выход", command=root.quit, fg="red").pack(pady=15)

root.mainloop()