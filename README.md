# Redmine Project Tags

A Redmine plugin that adds permission-controlled tags to projects and displays them on project overview pages and issue details.

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

Ali Erdem Cerrah — <ali.cerrah@mono.tr>

## License

This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE).
