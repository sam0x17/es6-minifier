require "./spec_helper"
`./postinstall.sh` unless File.exists?("bin/es6-minifier")

describe Es6Minifier do
  # TODO: Write tests

  it "works" do
    Es6Minifier.minify!("const  yuh = 3;").should eq "const yuh=3;"
  end
end
