from dagster import asset


@asset()
def my_asset(
) -> list[int]:
    data = [1, 2, 3]
    data = [x * 2 for x in data]
    return data
