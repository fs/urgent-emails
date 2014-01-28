require 'openssl'
require 'base64'
require_relative '../spec_helper.rb'

def encrypt(key, path)
  `bin/encrypt -k #{key} -f #{path}`
end

def decrypt(key, path)
  `bin/encrypt --decrypt -k #{key} -f #{path}`
end

def checksum(file_path)
  Digest::SHA2.file(file_path).hexdigest
end

def base64_encode(string)
  Base64.encode64(string).gsub(/\n/, '')
end

describe 'bin/encrypt' do
  let(:file_path) { File.expand_path('../../tmp/test/emails.text', __dir__) }
  let(:key) { OpenSSL::PKey::RSA.new 1024 }
  let(:private_key) { base64_encode(key.to_pem) }
  let(:public_key) { base64_encode(key.public_key.to_pem) }

  before do
    FileUtils.mkdir_p(File.dirname(file_path))
    FileUtils.cp(fixture_path('emails.text'), file_path)
  end

  after do
    FileUtils.rm_rf(File.dirname(file_path))
  end

  describe 'encryption' do
    it 'generates encrypted file' do
      encrypt(public_key, file_path)

      File.exists?("#{file_path}.encrypted").must_equal true
      checksum(file_path).wont_equal checksum("#{file_path}.encrypted")
    end
  end

  describe 'decryption' do
    before do
      encrypt(public_key, file_path)
    end

    it 'decrypts encrypted file' do
      checksum = checksum(file_path)
      FileUtils.rm(file_path)
      decrypt(private_key, file_path)

      checksum(file_path).must_equal checksum
    end
  end
end
