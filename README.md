# 📊 Market Service

A lightweight Go microservice that retrieves stock data from Tiingo and exposes it via simple HTTP endpoints. Powers real-time stock charting and alert validation for the Portfolio Insights platform.

## ⚙️ Features

* Fetch historical stock prices by ticker symbol
* Validate new stock price alerts against live data
* Environment-configurable API key support
* Health check endpoint with Tiingo network verification
* Graceful error handling and structured JSON responses

## **🏗️** Project Structure

```
market-service/
├── .husky/
│   └── pre-commit         # Git hook to enforce code formatting
├── .infra/
│   ├── SETUP.md           # EC2 setup instructions
│   └── user_data.sh       # Automated EC2 provisioning script
├── scripts/
│   ├── deploy.sh          # Build + launch Go binary, run health check
│   ├── teardown.sh        # Stop server and clean up binary
│   └── local-dev-setup.sh # Install Node dependencies (linting only)
├── src/
│   ├── main.go            # Main HTTP server with route logic
│   └── utils.go           # Utility functions
├── .env.example
├── .gitignore
├── .lintstagedrc          # Pre-commit config for staged file linting
├── .prettierignore
├── LICENSE.txt
├── go.mod
├── go.sum
├── package.json           # JS tooling for lint/prettier
├── package-lock.json
└── README.md
```

## **🧪** API Endpoints

### Health

* `GET /health` — Check if the microservice is running and connected to Tiingo

### Stock Data

* `GET /stocks?ticker=...&startDate=...&interval=...`

  * Retrieves historical closing prices from Tiingo.
  * Example: `/stocks?ticker=SPY&startDate=2024-01-01&interval=daily`

### Alert Validation

* `GET /check-alert?ticker=...&price=...&direction=...`

  * Determines whether a price alert is valid given current/previous price.
  * Example: `/check-alert?ticker=AAPL&price=120.00&direction=above`

## 🚀 Local Development

```bash
bash scripts/local-dev-setup.sh   # Optional: install JS tooling
bash scripts/deploy.sh            # Run microservice locally
```

The service will be available at `http://localhost:8080`.
Environment variables should be set in a `.env` file (e.g. `TIINGO_API_KEY`).

The `bash scripts/teardown.sh` command can be run to tear down the market service deployment.

## 📦 EC2 Deployment

Provisioning and setup for EC2 deployment can be done with the included `.infra/user_data.sh` script or by following the instructions laid out in `.infra/SETUP.md`.

## 🧹 Tooling

* `gofmt` used for Go formatting.
* `prettier` used for formatting of other file types (e.g. `.md`, `.yaml`).
* `lint-staged` and `husky` used to enforce formatting rules with pre-commit hooks.

## 📄 License

MIT License
