# Redmine Proje Etiketleri

[![Contributors][contributors-shield]][contributors-url]

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Apache License][license-shield]][license-url]

[![Readme in English](https://img.shields.io/badge/README-English-blue)](README.md)
[![Readme in Turkish](https://img.shields.io/badge/README-Turkish-blue)](README-Turkish.md)

<div align="center">
  <a href="https://mono.net.tr/">
    <img src="https://r2.mono.tr/logo/Mono-Logo.svg" width="340" alt="Mono Bilişim" />
  </a>

  <h2 align="center">Redmine Proje Etiketleri</h2>
  <b>Redmine Proje Etiketleri</b>, Redmine projelerine yetki kontrollü etiketler ekler ve etiketleri proje genel bakışında ve iş detaylarında gösterir.
</div>

---

## İçindekiler

- [Özellikler](#özellikler)
- [Gereksinimler](#gereksinimler)
- [Kurulum](#kurulum)
- [Yapılandırma](#yapılandırma)
- [Geliştirme](#geliştirme)
- [Geliştirici](#geliştirici)
- [Lisans](#lisans)

## Özellikler

- Proje ayarlarından birden fazla proje etiketi ekleme.
- Virgül kullanmadan yazıp **Enter** tuşuyla etiket oluşturma.
- Yazarken mevcut etiketleri otomatik tamamlama ile önerme.
- Proje genel bakışında ve iş sayfalarında renkli etiket badge’leri gösterme.
- Proje ayarlarında `×` butonuyla etiket silme.
- Roller ve izinler üzerinden **Proje etiketlerini görüntüle** yetkisi.
- Proje bazında **Project Tags** modülünü açıp kapatma.
- Türkçe ve İngilizce dil desteği.

## Gereksinimler

- Redmine 5.0 veya üzeri.
- Hedef Redmine kurulumunda bulunan `acts-as-taggable-on` gem’i.
- `tags` ve `taggings` tablolarını içeren Redmine veritabanı.

## Kurulum

Eklentiyi Redmine’ın `plugins` dizinine kopyalayın:

```bash
cd /path/to/redmine/plugins
git clone git@github.com:monobilisim/redmine-project-tags-plugin.git project_tags
```

Redmine’ı yeniden başlatın:

```bash
cd /path/to/redmine
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=project_tags
sudo systemctl restart puma
```

## Yapılandırma

1. **Yönetim → Roller ve izinler** sayfasını açın.
2. Gerekli roller için **Proje etiketlerini görüntüle** iznini etkinleştirin.
3. Projede **Project Tags** modülünü etkinleştirin.
4. **Proje ayarları → Project Tags** sayfasından etiket ekleyin.

## Geliştirme

```bash
ruby -c init.rb
ruby -c app/controllers/project_tags_controller.rb
ruby -c lib/project_tags.rb
```

## Geliştirici

Ali Erdem Cerrah — <cerrahalierdem@gmail.com>

## Lisans

Bu proje Apache License, Version 2.0 ile lisanslanmıştır. Ayrıntılar için [LICENSE](LICENSE) dosyasına bakın.

---

[contributors-shield]: https://img.shields.io/github/contributors/monobilisim/redmine-project-tags-plugin.svg?style=for-the-badge
[contributors-url]: https://github.com/monobilisim/redmine-project-tags-plugin/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/monobilisim/redmine-project-tags-plugin.svg?style=for-the-badge
[forks-url]: https://github.com/monobilisim/redmine-project-tags-plugin/network/members
[stars-shield]: https://img.shields.io/github/stars/monobilisim/redmine-project-tags-plugin.svg?style=for-the-badge
[stars-url]: https://github.com/monobilisim/redmine-project-tags-plugin/stargazers
[issues-shield]: https://img.shields.io/github/issues/monobilisim/redmine-project-tags-plugin.svg?style=for-the-badge
[issues-url]: https://github.com/monobilisim/redmine-project-tags-plugin/issues
[license-shield]: https://img.shields.io/github/license/monobilisim/redmine-project-tags-plugin.svg?style=for-the-badge
[license-url]: https://github.com/monobilisim/redmine-project-tags-plugin/blob/main/LICENSE
