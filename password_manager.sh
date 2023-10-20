#! /bin/bash

#パスワード情報を保存
password_file="passwords.txt"

#ようこそメッセージ
echo "パスワードマネージャーへようこそ!"

while ture; do
    #何をするかを選択
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
    read choice

    if [ "$choice" == "Add Password" ]; then
    # サービス名、ユーザー名、パスワードの入力
        echo "サービス名を入力してください:"
        read service_name
        echo "ユーザー名を入力してください:"
        read user_name
        echo "パスワードを入力してください:"
        read password

        # パスワード情報をファイルに追記
        echo "$service_name:$user_name:$password" >> $password_file
        echo "パスワードの追加は成功しました."
    fi

echo "Thank you!"
echo "$service_name:$username:$password" >> "$password_file"
