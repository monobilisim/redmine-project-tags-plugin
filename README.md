# [![Contributors][contributors-shield]][contributors-url]

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

  <h2 align="center">Redmine Project Tags</h2>
  <b>Redmine Project Tags</b> adds permission-controlled tags to Redmine projects and displays them on project overview pages and issue details.
</div>

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Development](#development)
- [Author](#author)
- [License](#license)

## Features

- Add multiple tags to a project from the project settings.
- Add a tag by typing it and pressing **Enter**; no comma-separated input is required.
- Suggest existing project tags while typing.
- Display project tags as colored badges on project overview and issue pages.
- Remove tags from the project settings with the `×` button.
- Control visibility with the project permission **View project tags**.
- Enable or disable the feature per project through the **Project Tags** module.
- English and Turkish translations.
- Redmine 5.x and 6.x compatible; tested with Redmine 6.1 and Rails 7.2.

## Requirements

- Redmine 5.0 or newer.
- The `acts-as-taggable-on` gem, which is required by the target Redmine installation.
- A Redmine database containing the `tags` and `taggings` tables.

## Installation

Copy or clone the plugin into the Redmine plugins directory:

```bash
cd /path/to/redmine/plugins
git clone git@github.com:monobilisim/redmine-project-tags-plugin.git project_tags
```

Restart Redmine after installing the plugin:

```bash
cd /path/to/redmine
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=project_tags
sudo systemctl restart puma
```

The plugin does not add database migrations. Running the migration command is safe and keeps the installation process consistent with other Redmine plugins.

## Configuration

1. Open **Administration → Roles and permissions**.
2. Enable **View project tags** for the required roles.
3. Open a project and enable the **Project Tags** module.
4. Open **Project settings → Project Tags** and add tags.

Only users who have the project permission can see project tags on the overview and issue pages.

## Development

Run Ruby syntax checks from the plugin directory:

```bash
ruby -c init.rb
ruby -c app/controllers/project_tags_controller.rb
ruby -c lib/project_tags.rb
```

For full integration testing, run the Redmine test suite with the plugin installed in a development or test Redmine instance.

## Author

Ali Erdem Cerrah — <cerrahalierdem@gmail.com>

## License

This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE).

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
