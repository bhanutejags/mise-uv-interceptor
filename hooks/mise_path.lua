function PLUGIN:MisePath(ctx)
	local data_dir = os.getenv("MISE_DATA_DIR") or (os.getenv("HOME") .. "/.local/share/mise")
	return { data_dir .. "/plugins/mise-uv-interceptor/bin" }
end
