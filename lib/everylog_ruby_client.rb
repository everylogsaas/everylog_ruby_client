require_relative "everylog_ruby_client/version"
require "singleton"
require "uri"
require "net/http"
require "json"

class EverylogRubyClient
  include ::Singleton

  SETUP_DEFAULTS = {
    api_key: nil,
    projectId: nil,
    everylog_url: "https://api.everylog.io/api/v1/log-entries"
  }.freeze

  LOG_ENTRY_DEFAULTS = {
    title: "Empty notification",
    summary: "Empty summary",
    body: "Empty body",
    tags: [],
    link: "",
    push: false,
    icon: "",
    externalChannels: [],
    properties: {},
    groups: [],
  }.freeze

  attr_reader :options

  # @param [Hash] options
  # @option options [String] :api_key for authenticate against Everylog server
  # @option options [String] :projectId name of the project
  # @option options [String] :everylog_url (https://api.everylog.io/api/v1/log-entries) to reach Everlog server
  def setup(options = {})
    @options = _parse_options(options, SETUP_DEFAULTS)
    self
  end

  # @param [Hash] log_entry_options
  # @option log_entry_options [String, options[:projectId]]  :projectId name of the project
  # @option log_entry_options [String]  :title to display in the application and if enabled in the notification
  # @option log_entry_options [String]  :summary is a not so long text to display on the application and if enabled in the notification
  # @option log_entry_options [String]  :body it can contain a long text simple formatted, no html to display in the application
  # @option log_entry_options [Array]   :tags it can be used to categorize the notification, must be strings
  # @option log_entry_options [String]  :link it can be used to display on the application and if enabled in the notification
  # @option log_entry_options [Boolean] :push if True, a push notification is sent to application

  def create_log_entry(log_entry_options = {})
    @log_entry_options = _parse_options(log_entry_options, LOG_ENTRY_DEFAULTS)
    merged_options  = { projectId: options[:projectId] }.merge(@log_entry_options)
    uri             = URI(options[:everylog_url])
    http            = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl    = true
    req             = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json', "Authorization": "Bearer #{options[:api_key]}")
    req.body        = merged_options.to_json
    res             = http.request(req)
    res.body
  end

  private

  def _parse_options(options, defaults_to_dup)
    defaults = defaults_to_dup.dup
    result_parsed_options = options.dup

    defaults.each_key do |key|
      defaults[key] = defaults[key].call if defaults[key].respond_to?(:call)
      result_parsed_options[key] = result_parsed_options[key.to_s] if result_parsed_options.key?(key.to_s)
    end

    defaults.each_key do |key|
      result_parsed_options[key] = defaults[key] if result_parsed_options[key].nil?
    end

    result_parsed_options
  end
end
