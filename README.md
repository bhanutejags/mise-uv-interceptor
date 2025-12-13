# mise-uv-interceptor

[mise env plugin](https://mise.jdx.dev/dev-tools/backends/env-plugins.html) that intercepts `python`/`pip` in CLI-based AI tools (Claude Code, aider, Gemini CLI, etc.), guiding them toward [uv](https://docs.astral.sh/uv/).

Your shell's `python` remains unaffected.

Inspired by [pydevtools interceptors](https://pydevtools.com/blog/interceptors/). Generated with Claude Code.

## Installation

```toml
[plugins]
mise-uv-interceptor = "https://github.com/bhanutejags/mise-uv-interceptor"

[env]
_.mise-uv-interceptor = {}
```

## What it intercepts

| Command              | Suggests           |
| -------------------- | ------------------ |
| `python script.py`   | `uv run script.py` |
| `pip install pkg`    | `uv add pkg`       |
| `pip install -r ...` | `uv sync`          |

## References

- [mise env plugins](https://mise.jdx.dev/dev-tools/backends/env-plugins.html)
- [pydevtools interceptors](https://pydevtools.com/blog/interceptors/)
- [uv](https://docs.astral.sh/uv/)

## License

MIT
