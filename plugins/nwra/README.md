# Northwest Registered Agent for Claude Code

Form and manage your business from Claude Code through your [Northwest Registered Agent](https://www.northwestregisteredagent.com) account: business formation, registered agent service, annual reports and other state filings, compliance deadlines, documents and mail, plus a business domain, email, and phone number.

## Install

In Claude Code:

```
/plugin marketplace add Northwest-Registered-Agent/nwra-claude-plugin
/plugin install nwra@nwra-plugins
```

## Setup

After installing, run `/mcp`, select `plugin:nwra:nwra`, and sign in with your Northwest account in the browser window that opens.

## Usage

Ask in plain language, for example "when is my Oregon annual report due?" or "set up email for my new domain", or use the commands:

| Command | What it does |
| --- | --- |
| `/nwra:status` | Overview of your companies, open orders, and anything needing attention |
| `/nwra:form-business [name] [state] [type]` | Start forming an LLC, corporation, or other entity |
| `/nwra:filings [company]` | Upcoming and overdue state filings and compliance deadlines |
| `/nwra:setup-identity [company or domain]` | Set up a business domain, email, and phone number |

Claude always shows you a summary, including any cost, and waits for your confirmation before submitting a filing, placing an order, or changing live settings such as DNS.

## Privacy

See the [Northwest Registered Agent privacy policy](https://www.northwestregisteredagent.com/privacy-policy).
