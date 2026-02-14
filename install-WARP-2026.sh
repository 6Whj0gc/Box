echo -e "注意: 仅为Debian系长期支持版(LTS)使用, 不要使用测试版, 否则可能会出错 !!!"

read -p "继续吗? (y/n): " res
if [[ ! "$res" =~ ^[yY]$ ]]; then
    echo "已退出。"
    exit 1
fi





curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

read -p "继续吗? (y/n): " res
if [[ ! "$res" =~ ^[yY]$ ]]; then
    echo "已退出。"
    exit 1
fi



apt-get update && apt-get install cloudflare-warp


read -p "继续吗? (y/n): " res
if [[ ! "$res" =~ ^[yY]$ ]]; then
    echo "已退出。"
    exit 1
fi


warp-cli registration new

warp-cli mode proxy

warp-cli connect

warp-cli status


echo '在脚本中加入这段参数以使用 Warp  -F="socks5://127.0.0.1:40000"'