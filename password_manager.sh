#! /bin/bash
password_file="passwords.txt"
echo "パスワードマネージャーへようこそ!"
read -p "サービス名を入力してください: " service_name
read -p "ユーザー名を入力してください: " username
read -s -p "パスワードを入力してください: " password
echo
echo "Thank you!"
echo "$service_name:$username:$password" >> "$password_file"
