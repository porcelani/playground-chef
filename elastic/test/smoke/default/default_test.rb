require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Git Daemon" do

  it "is listening on port 9200" do
    expect(port(9200)).to be_listening
  end

end