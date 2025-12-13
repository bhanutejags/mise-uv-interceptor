# mise-uv-interceptor

[mise env plugin](https://mise.jdx.dev/dev-tools/backends/env-plugins.html) that intercepts `python`/`pip` in CLI-based AI tools (Claude Code, aider, Gemini CLI, etc.), guiding them toward [uv](https://docs.astral.sh/uv/). Wraps AI tool binaries to prepend interceptors to PATH for their subprocesses only—your shell's `python` remains unaffected.

Inspired by [pydevtools interceptors](https://pydevtools.com/blog/interceptors/). Generated with Claude Code.

## Installation

```toml
[plugins]
mise-uv-interceptor = "https://github.com/bhanutejags/mise-uv-interceptor"

[env]
_.mise-uv-interceptor = {}
```

## What it intercepts

- `python ...` → use `uv run ...`
- `pip install` → use `uv add`
- `pip install -r` → use `uv sync`

## References

- [mise env plugins](https://mise.jdx.dev/dev-tools/backends/env-plugins.html)
- [pydevtools interceptors](https://pydevtools.com/blog/interceptors/)
- [uv](https://docs.astral.sh/uv/)

## License

MIT
