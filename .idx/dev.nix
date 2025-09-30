# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{pkgs}: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.php83
    pkgs.php83Packages.composer
    pkgs.nodejs_20
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        setup-filament-4 = "composer install && cp .env.example .env && php artisan key:generate && php artisan storage:link && touch database/database.sqlite && php artisan migrate --seed";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        start-server = "php artisan serve";
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = false;
      previews = {
        web = {
          command = ["php" "artisan" "serve" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
