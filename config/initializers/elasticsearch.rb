# Searchkick.client = Elasticsearch::Client.new(hosts: [ENV["ELASTICSEARCH_URL"]], retry_on_failure: true, transport_options: {request: {timeout: 250}})
require "faraday_middleware/aws_signers_v4"
if Rails.env.production?
  Searchkick.client =
    Elasticsearch::Client.new(
      url: ENV["ELASTICSEARCH_URL"],
      transport_options: {request: {timeout: 10}}
    ) do |f|
      f.request :aws_signers_v4, {
        credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),
        service_name: "es",
        region: "us-west-2"
      }
    end
end
