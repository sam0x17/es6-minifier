
module Es6Minifier
  BINARY = "bin/es6-minifier"

  # minifies and overwrites the js files specified in paths
  def self.minify!(paths : Array(String))
    raise "#{BINARY} binary missing" unless File.exists?(BINARY)
    unless Process.run(BINARY, paths).success?
      raise "an error occurred while minifying the specified files"
    end
  end

  def self.minify!(code : String)
    tempfile = File.tempfile(prefix: "es6-minifier", suffix: ".js")
    begin
      File.write(tempfile.path, code)
      minify!([tempfile.path])
      File.read(tempfile.path)
    ensure
      tempfile.delete
    end
  end
end
