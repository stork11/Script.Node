#!/bin/bash

CF_API_TOKEN="FQPnx4KMvQbkYjs37n8z6qOluKNnV9Boy2_UdzI5"

# ========== 参数检查 ==========
if [ "$#" -lt 3 ]; then
    echo "用法: $0 <ZONE_ID> <DOMAIN> <RECORD4_ID> [RECORD6_ID]"
    echo ""
    echo "示例 (仅 IPv4):"
    echo "  $0 ZONEID example.com A_RECORD_ID"
    echo ""
    echo "示例 (IPv4 + IPv6):"
    echo "  $0 ZONEID example.com A_RECORD_ID AAAA_RECORD_ID"
    exit 1
fi

ZONE_ID="$1"
DOMAIN="$2"
RECORD4_ID="$3"
RECORD6_ID="$4"   # 可选

# ========== Cloudflare Token ==========
if [ -z "$CF_API_TOKEN" ]; then
    echo "错误：请先设置环境变量 CF_API_TOKEN"
    echo "示例： export CF_API_TOKEN=\"your_token\""
    exit 1
fi

TTL=120
PROXY=false

# ========== 获取公网 IPv4 ==========
IPV4=$(curl -4 -s https://api.ipify.org)
echo "检测到 IPv4: $IPV4"

# ========== 获取公网 IPv6（如果需要） ==========
if [ -n "$RECORD6_ID" ]; then
    IPV6=$(curl -6 -s https://api64.ipify.org)
    echo "检测到 IPv6: $IPV6"
fi

# ========== 更新 IPv4 ==========
if [ -n "$IPV4" ]; then
    echo "更新 IPv4 (A 记录)..."
    curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD4_ID" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json" \
        --data "{
            \"type\": \"A\",
            \"name\": \"$DOMAIN\",
            \"content\": \"$IPV4\",
            \"ttl\": $TTL,
            \"proxied\": $PROXY
        }"
    echo ""
fi

# ========== 更新 IPv6 ==========
if [ -n "$RECORD6_ID" ] && [ -n "$IPV6" ]; then
    echo "更新 IPv6 (AAAA 记录)..."
    curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD6_ID" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json" \
        --data "{
            \"type\": \"AAAA\",
            \"name\": \"$DOMAIN\",
            \"content\": \"$IPV6\",
            \"ttl\": $TTL,
            \"proxied\": $PROXY
        }"
    echo ""
else
    echo "跳过 IPv6 更新"
fi

echo "DDNS 更新完成！"
