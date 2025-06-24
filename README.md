# 🎬 MovieLens dbt Project

This project leverages the [dbt (Data Build Tool)](https://docs.getdbt.com/) framework to perform data modeling, transformation, testing, and documentation on the [MovieLens dataset](https://grouplens.org/datasets/movielens/).

The dataset includes user ratings, tags, and movie metadata. The goal is to build a robust analytics layer with quality checks and documentation using dbt.

---

## 📁 Project Structure

```bash
movielens_project/
├── models/
│ ├── staging/ # Source-level cleaning models (src_*)
│ ├── dim/ # Dimension tables (dim_movies, dim_users)
│ ├── fct/ # Fact tables (fct_ratings)
├── snapshots/ # Slowly changing dimension snapshots
├── macros/ # Reusable SQL snippets
├── tests/ # Data tests
├── dbt_project.yml # dbt project configuration
├── packages.yml # dbt packages (e.g., dbt_utils)
├── README.md # You’re here!

```

---

## 🧠 What This Project Does

### ✅ Models
- **Staging Models** (`src_*.sql`): Clean and standardize raw input (e.g., renaming columns, type casting).
- **Dimension Models** (`dim_users`, `dim_movies`): Define entities like users and movies with descriptive attributes.
- **Fact Models** (`fct_ratings`): Store events like ratings and taggings with metrics and keys.
- **Incremental Models**: Leverage `is_incremental()` to efficiently process only new data.

### ✅ Snapshots
- `snap_tags.sql`: Tracks historical changes in user-applied tags using a **Type 2 SCD** strategy based on a timestamp column.

### ✅ Tests
- Basic and custom tests to ensure data quality:
  - `not_null`
  - `unique`
  - `relationships` (foreign key integrity between models)

### ✅ Macros
- Reusable SQL snippets to streamline development:
  - `generate_surrogate_key()` from `dbt_utils`
  - Custom macros for timestamp conversion or formatting

---
## 🧪 CLI Commands & Usage

| Command | Description |
|--------|-------------|
| `dbt deps` | Installs dependencies from `packages.yml` |
| `dbt run` | Executes models in dependency order |
| `dbt test` | Runs tests (schema + data) |
| `dbt snapshot` | Applies snapshot logic to track changes |
| `dbt docs generate` | Builds HTML documentation from schema.yml + lineage |
| `dbt docs serve` | Hosts docs on localhost (e.g. http://localhost:8000) |

📘 [dbt CLI Docs](https://docs.getdbt.com/reference/command-line-interfaces/cli-reference)

---

## 🔍 Explore

After generating docs with `dbt docs generate` and running `dbt docs serve`, you can explore:

- Column-level lineage  
- Model and source descriptions  
- Data tests and freshness checks  
- Graph view of model DAG  

---

## ✅ Best Practices Followed

- Modular project layout: `staging`, `dim`, `fct`
- Use of `dbt_utils` for reusability and standardization
- Snapshot tracking for SCD Type 2 entities
- Incremental models for performance
- Well-documented sources and models
- Automated testing and data validation

---

## 📚 Resources & References

- 🧾 [dbt Docs Home](https://docs.getdbt.com/)
- 📦 [dbt Packages](https://docs.getdbt.com/docs/build/packages)
- 💡 [dbt-utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)
- 🧰 [Snapshots Guide](https://docs.getdbt.com/docs/build/snapshots)
- 📊 [Testing Guide](https://docs.getdbt.com/docs/build/tests)
- 🏗️ [Incremental Models](https://docs.getdbt.com/docs/build/incremental-models)

---

## 🚀 Quick Start

```bash
# Install dependencies
dbt deps

# Run all models
dbt run

# Run tests
dbt test

# Run snapshots
dbt snapshot

# Generate and serve docs
dbt docs generate
dbt docs serve

```
---

## 🤝 Contributions

Pull requests and suggestions are welcome!  
If you encounter any bugs, have feature requests, or general questions, feel free to:

- 🐞 Open an issue
- 🛠️ Submit a pull request
- 💬 Start a discussion


## 🤝 Thank You !!
