function PLUGIN:MisePath(ctx)
	local home = os.getenv("HOME")
	return { home .. "/.local/share/mise-uv-interceptor/bin" }
end
