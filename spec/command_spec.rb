describe 'bosh latest version' do

  let(:dummy_class) { Class.new { include Bosh::Versions::Helpers } }
  let(:dummy_object) { dummy_class.new }

  describe 'with correct release name' do

    before(:each) do
      release_html = File.read(asset_file('bosh.io.release.html'))
      allow(RestClient).to receive(:get).and_return(release_html)
    end
    
    it 'cf-release' do
      release_version = dummy_object.release_latest_version('cf-release')
      expect(release_version).to eq('219')
    end

    it 'cloudfoundry/cf-release' do
      release_version = dummy_object.release_latest_version('cloudfoundry/cf-release')
      expect(release_version).to eq('219')
    end

  end

  describe 'with incorrect release name' do
    before do
      allow(RestClient).to receive(:get).and_return('some-response')
    end

    it 'cloudfoundry/cf-release' do
      expect do 
        dummy_object.release_latest_version('cf-release')
      end.to raise_error
    end
  end

end
