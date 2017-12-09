CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    region: 'us-east-2',
    aws_access_key_id: "AKIAIHWUUBABIWOZAOZA",
    aws_secret_access_key: "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"
  }
  config.fog_directory = "fieldwire-project"
end