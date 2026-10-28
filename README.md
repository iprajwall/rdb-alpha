# Universe Database

A PostgreSQL database project built for the freeCodeCamp Relational Database curriculum. It models galaxies, stars, planets, moons, and constellations.

## Tables

- `galaxy` — galaxy names, types, distance from Earth, black-hole indicator, and description.
- `star` — star names, parent galaxy, temperature, shape indicator, and spectral type.
- `planet` — planet names, parent star, type, moon count, life indicator, and mass.
- `moon` — moon names, parent planet, diameter, shape indicator, and composition.
- `constellation` — constellation names, abbreviations, star counts, and descriptions.

## Database features

- Auto-incrementing primary keys using `SERIAL`
- Foreign-key relationships: `star.galaxy_id` → `galaxy.galaxy_id`, `planet.star_id` → `star.star_id`, and `moon.planet_id` → `planet.planet_id`
- Unique, non-null `name` columns in every table
- Uses `INT`, `NUMERIC`, `TEXT`, `BOOLEAN`, and `VARCHAR` data types
- Sample data for all five tables

## Requirements covered

| Table | Sample rows |
|---|---:|
| `galaxy` | 6 |
| `star` | 6 |
| `planet` | 12 |
| `moon` | 20 |
| `constellation` | 3 |

## How to run

Run the SQL script against a PostgreSQL server:

```bash
psql -U postgres -f universe.sql
```

Or, in an environment where PostgreSQL connection settings are already configured:

```bash
psql -f universe.sql
```

The script creates the `universe` database and connects to it using `\c universe`. Run it once on a fresh setup; if the database already exists, remove or skip `CREATE DATABASE universe;` and connect to the existing database before running the remaining statements.

## Verify the tables

After connecting to `universe`, run:

```sql
\dt
SELECT 'galaxy' AS table_name, COUNT(*) FROM galaxy
UNION ALL SELECT 'star', COUNT(*) FROM star
UNION ALL SELECT 'planet', COUNT(*) FROM planet
UNION ALL SELECT 'moon', COUNT(*) FROM moon
UNION ALL SELECT 'constellation', COUNT(*) FROM constellation;
```

## Data note

Some sample planet entries (such as `Sirius b Planet` and `Rigel b`) are illustrative placeholders, not confirmed astronomical discoveries. The dataset is intended to demonstrate relational database design and constraints.