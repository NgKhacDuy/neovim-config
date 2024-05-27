local status, dart = pcall(require, "flutter-tools")
if not status then
	return
end

dart.setup()
