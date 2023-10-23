#!/bin/bash
#完成版 パスフレーズの入力あり
# パスワード情報を保存
password_file="passwords.gpg"

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
        echo "$service_name:$user_name:$password" >> temp_password_file

        # パスワード情報をファイルに追記後、ファイルを暗号化
        gpg -q --yes --output "$password_file" --encrypt --recipient sasayu8190@gmail.com temp_password_file

        # 一時ファイルを削除
        rm temp_password_file

        echo "パスワードの追加は成功しました."
        echo 

    elif [ "$choice" == "Get Password" ]; then
       # 暗号化されたファイルを復号化して一時ファイルに保存
        gpg --quiet --no-tty --output temp_password_file --decrypt "$password_file" 2>/dev/null

        # サービス名の入力
        read -p "サービス名を入力してください :" service_name

        # ファイルから該当サービス名の情報を取得
        password_info=$(grep "^$service_name:" temp_password_file)

        if [ -n "$password_info" ]; then
            # サービス名、ユーザー名、パスワードを抽出して表示
            user_name=$(echo "$password_info" | cut -d':' -f2)
            password=$(echo "$password_info" | cut -d':' -f3)
            echo "サービス名 ：$service_name"
            echo "ユーザー名 ：$user_name"
            echo "パスワード ：$password"
            echo
        else
            echo "そのサービスは登録されていません."
            echo
        fi

        # 一時ファイルを削除
        rm temp_password_file

    elif [ "$choice" == "Exit" ]; then
        # プログラムを終了
        echo "Thank you!"
        break
    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください."
    fi
done