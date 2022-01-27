# Rancher Desktop #1349 Reproduction

This is a small setup to reproduce this issue

- Rancher Desktop 1.0.0 in dockerd mode
- `docker-compose up -d`

Log into the php container

`docker-compose exec php bash`

Execute a composer install

`composer install`

Observe the issue.

```
root@0be843f86b29:/var/www# composer install
Loading composer repositories with package information
Installing dependencies (including require-dev) from lock file
Package operations: 48 installs, 0 updates, 0 removals
  - Installing kylekatarnls/update-helper (1.2.1): Downloading (100%)
Plugin installation failed (Plugin kylekatarnls/update-helper could not be initialized, class not found: UpdateHelper\ComposerPlugin), rolling back
  - Removing kylekatarnls/update-helper (1.2.1)


  [UnexpectedValueException]
  Plugin kylekatarnls/update-helper could not be initialized, class not found: UpdateHelper\ComposerPlugin


install [--prefer-source] [--prefer-dist] [--dry-run] [--dev] [--no-dev] [--no-custom-installers] [--no-autoloader] [--no-scripts] [--no-progress] [--no-suggest] [-v|vv|vvv|--verbose] [-o|--optimize-autoloader] [-a|--classmap-authoritative] [--apcu-autoloader] [--ignore-platform-reqs] [--] [<packages>]...
```
