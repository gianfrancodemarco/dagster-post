from dagster import load_assets_from_modules
import assets

my_assets = load_assets_from_modules([assets])
