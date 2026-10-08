# 🌎 2CapyVPN GeoIP File

### Генерирует самую актуальную базу данных **российских, белорусских и казахстанских IP-адресов** в формате `geoip.dat`, предназначенную для использования в **Xray-core** и **V2Ray-core**. А так же содержит списки заблокированных IP-адресов в РФ.

#### Добавлены диапазоны IP-адресов:
- **VK Company** (VK, Mail.Ru, OK, My.Games и т.д) - обновлены категории "ru", "by", "kz"
- **Yandex** (Яндекс, Yandex.Cloud, Yandex.Disk и т.д) - обновлены категории "ru", "by", "kz"
- **Ban-ru** (добавлять в proxy, заблокирован в РФ) - объединённый список RussiaFancyLists, AntiFilter, Threema, custom и Discord
- **CDN** - отдельная категория сетей CDN из RussiaFancyLists

#### Удалено:
- Все остальные гео-категории, отличные от: "ru", "by", "kz", "roblox", "private", "ban-ru", "cdn"

## 📥 **Статические ссылки на актуальную версию**  
https://github.com/spanchy/2capyvpn-geoip/releases/latest/download/geoip.dat

https://cdn.jsdelivr.net/gh/spanchy/2capyvpn-geoip@release/geoip.dat

## 📅 Обновления
Файл **обновляется каждый понедельник** и **при внесении изменения в данный репозиторий**

`geoip:ban-ru` объединяет RussiaFancyLists `full.lst`, AntiFilter `allyouneed.lst`, локальные списки Threema и custom, а также оба списка Discord. Повторяющиеся и перекрывающиеся CIDR-сети всех источников нормализуются вместе. `geoip:cdn` содержит отдельный список CDN из RussiaFancyLists. Сети из `ban-ru` и `cdn` исключаются из `geoip:direct`.

Категория `geoip:whitelist` строится из RussiaFancyLists `cidr.lst`; сети, попадающие в `geoip:ban-ru`, удаляются из whitelist, чтобы один и тот же адрес не оказался одновременно в обеих категориях.

## 🛠 Использование с Xray/V2Ray
Добавьте правило в конфигурацию Xray/V2Ray, чтобы **направлять нужный трафик через определённый прокси или напрямую**:

```json
{
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "geoip:private",
          "geoip:ru",
          "geoip:by",
          "geoip:kz"
        ],
        "outboundTag": "direct"
      },
      {
        "type": "field",
        "ip": [
          "geoip:ban-ru"
        ],
        "outboundTag": "proxy"
      }
    ]
  }
}
```

Спасибо [@hydraponique](https://github.com/hydraponique/).
