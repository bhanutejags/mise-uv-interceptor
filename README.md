# mise-uv-interceptor

A [mise env plugin](https://mise.jdx.dev/dev-tools/backends/env-plugins.html) that intercepts `python` and `pip` commands within **terminal-based AI coding tools**, guiding them toward [uv](https://docs.astral.sh/uv/).

Your shell's `python` remains unaffected - only the AI tool's subprocesses see the interceptor.

Inspired by [pydevtools interceptors](https://pydevtools.com/blog/interceptors/). Generated with Claude Code.

## Supported tools

Works with **CLI-based** AI coding tools that launch from terminal:

- Claude Code (`claude`)
- aider
- opencode
- Gemini CLI (`gemini`)
- OpenAI Codex (`codex`)

## Installation

Add to your project's `.mise.toml`:

```toml
[plugins]
mise-uv-interceptor = "https://github.com/bhanutejags/mise-uv-interceptor"

[env]
_.mise-uv-interceptor = {}
```

Then run `mise install` to install the plugin.

## How it works

```
┌─────────────────────────────────────────────────────────┐
│  User's shell                                           │
│  ─────────────                                          │
│  $ python script.py  →  .venv/bin/python (normal)       │
│  $ claude            →  wrapper script                  │
│                            │                            │
│                            ▼                            │
│  ┌─────────────────────────────────────────────────┐    │
│  │  Claude's environment                           │    │
│  │  ──────────────────────                         │    │
│  │  PATH = interceptors/ + original PATH           │    │
│  │  $ python script.py  →  interceptor (error)     │    │
│  │  $ uv run script.py  →  works correctly         │    │
│  └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
```

The plugin adds a `claude` wrapper to PATH that:

1. Prepends `interceptors/` directory to PATH
2. Executes the real `claude` binary

The AI tool's subprocesses then see the interceptors first.

## What it intercepts

| Command                           | Shows error suggesting    |
| --------------------------------- | ------------------------- |
| `python script.py`                | `uv run script.py`        |
| `python -c "code"`                | `uv run python -c "code"` |
| `pip install pkg`                 | `uv add pkg`              |
| `pip install -r requirements.txt` | `uv sync`                 |

## References

- [mise env plugins](https://mise.jdx.dev/dev-tools/backends/env-plugins.html)
- [pydevtools interceptors](https://pydevtools.com/blog/interceptors/)
- [uv documentation](https://docs.astral.sh/uv/)

## License

MIT
