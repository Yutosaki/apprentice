#!/bin/bash

# パスワード情報を保存
password_file="passwords.txt"

# ようこそメッセージ
echo "パスワードマネージャーへようこそ!"

while true; do
    # 何をするかを選択
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
    elif [ "$choice" == "Get Password" ]; then
        # サービス名の入力
        echo "サービス名を入力してください:"
        read service_name

        # ファイルから該当サービス名の情報を取得
        password_info=$(grep "^$service_name:" $password_file)

        if [ -n "$password_info" ]; then
            # サービス名、ユーザー名、パスワードを表示
            echo "$password_info"
        else
            echo "そのサービスは登録されていません."
        fi
    elif [ "$choice" == "Exit" ]; then
        # プログラムを終了
        echo "Thank you!"
        break
    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください."
    fi
done