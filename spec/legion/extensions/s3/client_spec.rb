# frozen_string_literal: true

RSpec.describe Legion::Extensions::S3::Client do
  let(:mock_s3) { double('Aws::S3::Client') }

  before do
    allow(Aws::S3::Client).to receive(:new).and_return(mock_s3)
  end

  describe '#initialize' do
    it 'stores default options' do
      client = described_class.new
      expect(client.opts).to include(region: 'us-east-2')
    end

    it 'accepts custom region' do
      client = described_class.new(region: 'us-west-2')
      expect(client.opts[:region]).to eq('us-west-2')
    end
  end

  describe 'bucket operations' do
    let(:client) { described_class.new }

    it 'lists buckets' do
      bucket = double(name: 'my-bucket', creation_date: Time.now)
      allow(mock_s3).to receive(:list_buckets).and_return(double(buckets: [bucket]))
      result = client.list_buckets
      expect(result[:buckets].size).to eq(1)
      expect(result[:buckets].first[:name]).to eq('my-bucket')
    end

    it 'creates a bucket' do
      allow(mock_s3).to receive(:create_bucket)
      result = client.create_bucket(bucket: 'new-bucket')
      expect(result[:created]).to be true
    end

    it 'deletes a bucket' do
      allow(mock_s3).to receive(:delete_bucket)
      result = client.delete_bucket(bucket: 'old-bucket')
      expect(result[:deleted]).to be true
    end

    it 'checks bucket existence' do
      allow(mock_s3).to receive(:head_bucket)
      result = client.bucket_exists?(bucket: 'my-bucket')
      expect(result[:exists]).to be true
    end
  end

  describe 'object operations' do
    let(:client) { described_class.new }

    it 'lists objects' do
      obj = double(key: 'file.txt', size: 100, last_modified: Time.now)
      allow(mock_s3).to receive(:list_objects_v2).and_return(double(contents: [obj], key_count: 1))
      result = client.list_objects(bucket: 'my-bucket')
      expect(result[:objects].size).to eq(1)
    end

    it 'gets an object' do
      body = double(read: 'file content')
      allow(mock_s3).to receive(:get_object).and_return(
        double(body: body, content_type: 'text/plain', content_length: 12)
      )
      result = client.get_object(bucket: 'my-bucket', key: 'file.txt')
      expect(result[:body]).to eq('file content')
    end

    it 'puts an object' do
      allow(mock_s3).to receive(:put_object)
      result = client.put_object(bucket: 'my-bucket', key: 'file.txt', body: 'content')
      expect(result[:uploaded]).to be true
    end

    it 'deletes an object' do
      allow(mock_s3).to receive(:delete_object)
      result = client.delete_object(bucket: 'my-bucket', key: 'file.txt')
      expect(result[:deleted]).to be true
    end

    it 'gets object metadata' do
      allow(mock_s3).to receive(:head_object).and_return(
        double(content_type: 'text/plain', content_length: 100, last_modified: Time.now, etag: '"abc123"')
      )
      result = client.head_object(bucket: 'my-bucket', key: 'file.txt')
      expect(result[:content_type]).to eq('text/plain')
    end

    it 'copies an object' do
      allow(mock_s3).to receive(:copy_object)
      result = client.copy_object(source_bucket: 'src', source_key: 'a.txt', bucket: 'dst', key: 'b.txt')
      expect(result[:copied]).to be true
    end
  end
end
