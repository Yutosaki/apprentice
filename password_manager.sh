#!/bin/bash

# パスワード情報を保存
password_file="passwords.txt"

# ようこそメッセージ
echo "パスワードマネージャーへようこそ!"

while true; do
    # 何をするかを選択
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit) :" choice
    echo

    if [ "$choice" == "Add Password" ]; then
        # サービス名、ユーザー名、パスワードの入力
        read -p "サービス名を入力してください :" service_name
        read -p "ユーザー名を入力してください :" user_name
        read -p "パスワードを入力してください :" password

        # パスワード情報をファイルに追記
        echo "$service_name:$user_name:$password" >> $password_file
        echo "パスワードの追加は成功しました."
        
    elif [ "$choice" == "Get Password" ]; then
        # サービス名の入力
        read -p "サービス名を入力してください :" service_name

        # ファイルから該当サービス名の情報を取得
        password_info=$(grep "^$service_name:" $password_file)

        if [ -n "$password_info" ]; then
            # サービス名、ユーザー名、パスワードを表示
            echo "サービス名 ：$service_name"
            echo "ユーザー名 ：$user_name"
            echo "パスワード ：$password"
            echo
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