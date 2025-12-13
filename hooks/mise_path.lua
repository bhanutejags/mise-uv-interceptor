function PLUGIN:MisePath(ctx)
	local home = os.getenv("HOME")
	return { home .. "/.local/share/mise/plugins/mise-uv-interceptor/bin" }
end
