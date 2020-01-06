require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir("./app")
loader.setup
